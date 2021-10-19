#!/usr/bin/env python3
#
# This software is owned by
#       ____ _____ ____ ____    ____         __ _
#      / ___| ____/ ___/ ___|  / ___|  ___  / _| |___      ____ _ _ __ ___
#     | |  _|  _| \___ \___ \  \___ \ / _ \| |_| __\ \ /\ / / _` | '__/ _ \
#     | |_| | |___ ___) |__) |  ___) | (_) |  _| |_ \ V  V / (_| | | |  __/
#      \____|_____|____/____/  |____/ \___/|_|  \__| \_/\_/ \__,_|_|  \___|
#
#

# -*- coding: utf-8 -*-
"""
 Dienstprogram Empfang von events vom zmq-Datenbus an die über WebSockets angeschlossenen
 CLients
"""

import argparse
import logging
import logging.handlers
import os
import sys
import asyncio
import zmq
import zmq.asyncio
import websockets
import json
from wclib import loghelpers
from wclib import swagger
from wclib import webcatiapi
from wclib import webcati
from wczmqrelay import wcsocket

wcSocketManager = wcsocket.WCWebSocketManager()
zmqContext = zmq.asyncio.Context()
eventLoop = zmq.asyncio.ZMQEventLoop()
# eventLoop = asyncio.get_event_loop()
asyncio.set_event_loop(eventLoop)

async def handleWSMessage( pWCWebSocketConnection: wcsocket.WCWebSocketConnection, jsonString: str):
    try:
        telegram = json.loads( jsonString)
        # print("handleWSMessage aufgerufen !")
        if ("cmd" in telegram):
            command = telegram["cmd"]
            if (command == 'hello'):
                if ("filter" in telegram):
                    if telegram["filter"] == "interviewer":
                        pWCWebSocketConnection.filter = True
                    else:
                        pWCWebSocketConnection.filter = telegram["filter"]
                else:
                    pWCWebSocketConnection.filter = False
                if ("sessionID" in telegram):
                    loghelpers.infoandprint("SessionID gesetzt für diese Verbindung auf " + str(telegram["sessionID"]))
                    pWCWebSocketConnection.sessionID = telegram["sessionID"]
                loghelpers.infoandprint(
                        "Filter gesetzt für diese Verbindung auf " + str(pWCWebSocketConnection.filter))
                ok = { "cmd" : "ok" }
                jsonString = json.dumps(ok)
                await pWCWebSocketConnection.messageQueue.put(jsonString)
            elif (command == "ping"):
                pong = { "cmd" : "pong"}
                jsonString = json.dumps(pong)
                loghelpers.infoandprint("send pong")
                await pWCWebSocketConnection.messageQueue.put(jsonString)
            elif (command == "setcurrentstudy"):
                if ("studynumber" in telegram):
                    loghelpers.infoandprint("CurrentStudyNumber gesetzt auf " + str(telegram["studynumber"]))
                    pWCWebSocketConnection.currentStudyNumber = telegram["studynumber"]
            else:
                loghelpers.errorandprint("Unbekannter Befehl WS: " + command)
    except Exception as ex:
        loghelpers.errorandprint("Ex>>HandleWSMessage: |" + str(ex) + "| json: |" + jsonString + "|")

async def wsHandler(websocket, path):
    global wcSocketManager

    loghelpers.infoandprint("Server gestartet")
    localConnection = wcsocket.WCWebSocketConnection(websocket)
    wcSocketManager.addConnection(localConnection)
    abort = False
    while not abort:
        try:
            listener_task = asyncio.ensure_future(websocket.recv())
            producer_task = asyncio.ensure_future(localConnection.messageQueue.get())
            done, pending = await asyncio.wait(
                [listener_task, producer_task],
                return_when=asyncio.FIRST_COMPLETED)

            if listener_task in done:
                message = listener_task.result()
                loghelpers.infoandprint("Server/WS =>: |" + message + "|")
                await handleWSMessage( localConnection, message)
            else:
                listener_task.cancel()

            if producer_task in done:
                message = producer_task.result()
                loghelpers.infoandprint("Server/ZMQ =>: |" + message + "|")
                await localConnection.socket.send(message)
            else:
                producer_task.cancel()
        except Exception as ex:
            loghelpers.errorandprint("Ex>>wsHandler: " + str(ex))
            abort = True
            wcSocketManager.removeConnection(localConnection)
    loghelpers.infoandprint("Server: Verbindung abgebaut ")

def suitableForClient(pWCWebSocketConnection: wcsocket.WCWebSocketConnection, pTelegram):
    # Ungefilterte Verbindungen bekommen immer alle Telegramme aus dem 0MQ Bus
    # Supervisoren, Administratoren
    if not pWCWebSocketConnection.filter:
        if ("ev" in pTelegram):
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVADDRESSDELIVERED):
                return False
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVDIALERREQUEST):
                return False
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVEXITQUESTION):
                return False
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVDIALERACTIONLISTCHANGED):
                return False
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVDIALERADDRESSSTATUS):
                return False
            # Ansonsten muss die sessionID stimmen und der Befehl
            if ("sessionID" in pTelegram):
                if (pTelegram["sessionID"] != pWCWebSocketConnection.sessionID):
                    # evCurrentCallNotification Event wird weitergeleitet
                    if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVCURRENTCALLNOTIFICATION):
                        return False
                    # evMessageSend Event wird ebenfalls weitergegeben
                    if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVMESSAGESEND):
                        return False
        return True
    # Ansonsten muss die sessionID stimmen und der Befehl
    else:
        if ("sessionID" in pTelegram) and ("ev" in pTelegram):
            if (pTelegram["sessionID"] != pWCWebSocketConnection.sessionID):
                return False
            # evEnterDialerInterview Event wird weitergeleitet
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVENTERDIALERINTERVIEW):
                return True
            # evCurrentCallNotification Event wird weitergeleitet
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVCURRENTCALLNOTIFICATION):
                return True
            # evMessageSend Event wird ebenfalls weitergegeben
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVMESSAGESEND):
                return True
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVTERMINATEDIALERWAITINGCLIENT):
                return True
            if (pTelegram["ev"] == webcatiapi.CATIENUMTIMEEVENTS_EVTERMINATECLIENT):
                return True
        return False

async def receiver():
    global args, zmqContext, wcSocketManager

    """receive messages with polling"""
    subscribeSocket = zmqContext.socket(zmq.SUB)
    subscribeSocket.connect(args.publishURL)
    subscribeSocket.setsockopt_string(zmq.SUBSCRIBE, "")
#    loghelpers.infoandprint("Vor der While-Schleife")
    while True:
        try:
#            loghelpers.infoandprint("Vor Empfang")
            msg_parts = await subscribeSocket.recv_multipart()
#            loghelpers.infoandprint("Nach Empfang")
            wsEventObject = {}
            wsEventObject["app"] = msg_parts[0].decode('utf-8')
            wsEventObject["type"] = msg_parts[1].decode('utf-8')
            wsEventObject["ev"] = msg_parts[2].decode('utf-8')
            wsEventObject["created"] = msg_parts[3].decode('utf-8')
            wsEventObject["sessionID"] = msg_parts[4].decode('utf-8')
            wsEventObject["wtt"] = msg_parts[5].decode('utf-8')
            wsEventObject["content"] = msg_parts[6].decode('utf-8')
            wsEventObject["aqm"] = msg_parts[7].decode('utf-8')
            wsEventObject["study"] = msg_parts[8].decode('utf-8')
            wsEventObject["user"] = msg_parts[9].decode('utf-8')
            jsonString = json.dumps(wsEventObject)
            loghelpers.infoandprint(wsEventObject["ev"])
#            loghelpers.infoandprint("Anzahl der Verbindungen:" + str(len(wcSocketManager.connections())))
            if len(wcSocketManager.connections()) == 0:
                loghelpers.infoandprint("Event received - but no active client connections available")
            else:
                for eachWCWebSocketConnection in wcSocketManager.connections():
    #                loghelpers.infoandprint("Checke bekannte Verbindung")
                    if suitableForClient(eachWCWebSocketConnection, wsEventObject):
                        loghelpers.infoandprint("Sende to client from zmq via ws: " + wsEventObject["ev"])
                        await eachWCWebSocketConnection.messageQueue.put(jsonString)
        except Exception as ex:
            print(str(ex))


PGMNAME = "GESS ZMQ-WebSocket Relay (GESS Software)"
PGMVERSION = "1.0.0.1"

# Um mit WebCati kommunizieren zu können, muss man die folgenden Parameter mitgeben:
#
# userlogin      (u) - Benutzerlogin der Benutzerkennung, mit der Skript bei WebCati laufen soll
# userpassword   (p) - Benutzerpasswort der Benutzerkennung, das beim Einloggen genutzt wird
# customername   (n) - Name des Customers, der Genutzt werden soll
#
#
# ./wcapp_websocketsrvpy -u="root" -p="root" -n="gess" -i="Test" -l="http://localhost" -z="tcp://localhost:22000" -w=8765
#

parser = argparse.ArgumentParser(description='Process the arguments')
parser.add_argument('-u', type=str, dest='username', required=True, help='set the user name')
parser.add_argument('-p', type=str, dest='password', required=True, help='set the password')
parser.add_argument('-n', type=str, dest='customername', required=True, help='set the name of used customer')
parser.add_argument('-l', type=str, dest='url', required=True, help='set of url of the webcati api (including http://)')
parser.add_argument('-z', type=str, dest='publishURL', required=True, help='URL of the ZMQ Publish Socket')
parser.add_argument('-g', type=str, dest='logfile', required=True, help='set the path of the log file name')
parser.add_argument('-w', type=int, dest='wsport', required=True, help='Port of the WebSocket Server')

args = parser.parse_args()
#
# Schon mal ein Verzeichnis fürs Logging anlegen und logging starten
#

logger = logging.getLogger()
logger.setLevel(logging.INFO)

handler = logging.handlers.TimedRotatingFileHandler(args.logfile , when='h',
                                                    backupCount=14 * 24)
formatter = logging.Formatter(fmt="%(asctime)s -> %(message)s", datefmt="%Y-%m-%d %H:%M:%S")
handler.setFormatter(formatter)

logger.addHandler(handler)


loghelpers.infoandprint(PGMNAME + " " + PGMVERSION)
#
# Die WebCati API Instanz aufbauen, die man später benutzen möchte, um gegen
# WebCati programmieren zu können
#
client = swagger.ApiClient('', args.url)
client.debugOption = False
api = webcatiapi.RESTApi(client)

#
# Meldung auf dem Bildschirm
#

loghelpers.infoandprint("PUM-Model        : " + webcatiapi.PUM_PROJECT_VERSION)
loghelpers.infoandprint("PUM-Generator    : " + webcatiapi.PUM_GENERATOR_VERSION)

loghelpers.infoandprint("Login            : " + args.username)
loghelpers.infoandprint("Passwort         : " + args.password)
loghelpers.infoandprint("Customername     : " + args.customername)
loghelpers.infoandprint("PyZMQ-Version    : " + zmq.pyzmq_version())
loghelpers.infoandprint("ZMQ-Version      : " + zmq.zmq_version())
loghelpers.infoandprint("URL-Publish      : " + args.publishURL)
loghelpers.infoandprint("WS-Port          : " + str(args.wsport))
webcatiSession = None
webcatiCustomerID = None
webcatiName = None

#
# Anmeldung am WebCATI
#
try:
    webcatiSession = webcati.login(api, args.username, args.password, args.customername,
                                   webcatiapi.CATIENUMAPPLICATION_GSWEBSOCKETRELAY, args.username, args.username)
    webcatiCustomerID = webcatiSession.customerID
    api.RequestSessionID = webcatiSession._id
    # KEIN Timeout setzen
    webcati.ChangeSessionTimeout(api, 0)
except webcati.WCAPIError as ex:
    loghelpers.errorandprint("Exit: Konnte mich beim WebCATI nicht anmelden - " + str(ex))
    sys.exit(1)


#
# WS-Server wird gestartet
#
start_server = websockets.serve(wsHandler, 'localhost', args.wsport)

eventLoop.run_until_complete(asyncio.wait([receiver(), start_server]))
eventLoop.run_forever()
