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
 Dienstprogram Empfang von events aus der Datenbank und Weiterleitung in den WebCATI-Datenbus
"""

import argparse
import logging
import logging.handlers
import os
import sys
import zmq
from datetime import datetime

def levelprint(pString, pLevel, pRemoteStamp, pApplicationName, pLocation, pApplicationCounter ):
    global localCounter, CLLOCDATETIMEFMT, CLLEVELFMT, CLREMDATETIMEFMT, CLAPPNAMEFMT, CLAPPLOCFMT, CLAPPCNTFMT, CLLOCCNTFMT
    msgNow = datetime.now()
    msgNowString = msgNow.strftime("%Y-%m-%dT%H:%M:%S.%f")
    level ="*?*"
    if pLevel == logging.INFO:
        level = "*I*"
    elif pLevel == logging.ERROR:
        level = "*E*"
    elif pLevel == logging.WARNING:
        level = "*W*"
    elif pLevel == logging.DEBUG:
        level = "*D*"

    msg = CLLOCDATETIMEFMT.format(str(msgNowString)) + CLLEVELFMT.format(level) + CLREMDATETIMEFMT.format(pRemoteStamp) + CLAPPNAMEFMT.format(pApplicationName) + CLAPPLOCFMT.format(pLocation) + CLAPPCNTFMT.format(pApplicationCounter) + CLLOCCNTFMT.format(localCounter) + "  " + pString
    logging.log(pLevel, msg)
    localCounter += 1
    return

def infoandprint(pString):
    global localCounter,APPLOGNAME
    levelprint(pString, logging.INFO, "", APPLOGNAME, "localhost", localCounter)
    return

def PrintNetworkMessage(messageParts):
    global APPLOGNAME, localCounter
    if len(messageParts) == 7:
        try:
            levelValue = logging.INFO
            splittedString = messageParts[5].decode('utf-8').split("\n")
            logString = ""
            for eachString in splittedString:
                logString += eachString + "\t"
            level =  messageParts[6].decode('utf-8')
            if level == "INFO":
                levelValue = logging.INFO
            elif level == "ERROR":
                levelValue = logging.ERROR
            elif level == "DEBUG":
                levelValue = logging.DEBUG
            elif level == "WARN":
                levelValue = logging.WARNING
            elif level == "WARNING":
                levelValue = logging.WARNING
            remoteStamp =  messageParts[1].decode('utf-8')
            appName = messageParts[2].decode('utf-8')
            appLocation = messageParts[3].decode('utf-8')
            appCounter = int(messageParts[4].decode('utf-8'))
            # for eachString in splittedString:
            levelprint(logString, levelValue, remoteStamp, appName, appLocation, appCounter)
        except Exception as ex:
            levelprint(str(ex), logging.ERROR, "",  APPLOGNAME, "localhost", localCounter)
    else:
        levelprint("Telegramm mit ungültiger Länge bekommen: " + str(len(messageParts)), logging.ERROR, "", APPLOGNAME, "localhost", localCounter)
    return

PGMNAME = "Logger Subsystem"
PGMVERSION = "1.0"
APPLOGNAME = "app-logger"
CLLOCDATETIME = 26
CLLOCDATETIMEFMT = "{0:>"+str(CLLOCDATETIME) + "}"
CLLEVEL = 4
CLLEVELFMT = "{0:>"+str(CLLEVEL) + "}"
CLREMDATETIME = 27
CLREMDATETIMEFMT = "{0:>"+str(CLREMDATETIME) + "}"
CLAPPNAME = 15
CLAPPNAMEFMT = "{0:>"+str(CLAPPNAME) + "}"
CLAPPLOC = 15
CLAPPLOCFMT = "{0:>"+str(CLAPPLOC) + "}"
CLAPPCNT = 10
CLAPPCNTFMT = "{0:>"+str(CLAPPCNT) + "}"
CLLOCCNT = 10
CLLOCCNTFMT = "{0:>"+str(CLLOCCNT) + "}"



localCounter = 0
# Um mit WebCati kommunizieren zu können, muss man die folgenden Parameter mitgeben:
#
# pullPort       (l) - Port des PULL Socket
# publishPort    (p) - Port des Publish Sockets
# Log-Datei      (g) - Pfad zur Logdatei
#
# ./wcapp_logger.py -l=24000 -p=24010 -g=./logall.txt
#
# Die Log-Nachrichten bestehen aus mehreren Frames:
#
# 00: LOGV01
# 01: Stamp vom Rechner im Textformat: YYYY-MM-DDTHH:MM:SS.xxx  (UTC)
# 02: Name der Anwendung               catidb, dialercnv, mandialer, dialersim, gcsessions, expsessions, blklistimport (etc)
# 03: Location                         Name oder IP Nummer des aktuellen Rechners
# 04: Lokaler Counter der Meldung      Integer
# 05: Meldung                          Textzeilen mit <CR> getrennt
# 06: Level                            I,E,D
# Die Ausgabe erfolgt:
#
# Lokale Zeit (20)     Stamp (20)        Anwendungsname (15)      Location (15)       Counter (8)   (2)          Meldung.x
#

parser = argparse.ArgumentParser(description='Process the arguments')
parser.add_argument('-g', type=str, dest='logfile', required=True, help='set the path of the log file name')
parser.add_argument('-p', type=int, dest='publishPort', required=True, help='Port of the PUBLISH socket')
parser.add_argument('-l', type=int, dest='pullPort', required=True, help='Port of the PULL socket')
args = parser.parse_args()

logger = logging.getLogger()
logger.setLevel(logging.NOTSET)

handler = logging.handlers.TimedRotatingFileHandler(args.logfile, when='h',
                                                    backupCount=14 * 24)
formatter = logging.Formatter(fmt="%(message)s")
handler.setFormatter(formatter)

logger.addHandler(handler)

infoandprint(PGMNAME + " " + PGMVERSION)
infoandprint("PyZMQ-Version            : " + zmq.pyzmq_version())
infoandprint("ZMQ-Version              : " + zmq.zmq_version())
infoandprint("PULL-Socket-Port         : " + str(args.pullPort))
infoandprint("Spaltenformat : LocalTime (1.." + str(CLLOCDATETIME) +"), Level (" + str(CLLOCDATETIME+1) + ".." + str(CLLOCDATETIME+CLLEVEL) +"), RemoteTime (" + str(CLLOCDATETIME+CLLEVEL+1) + ".." + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME) +"), AppName (" + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME+1) + ".." + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME+CLAPPNAME) +"), AppLocation (" + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME+CLAPPNAME+1) + ".." + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME+CLAPPNAME+CLAPPLOC) +"), AppCounter (" + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME+CLAPPNAME+CLAPPLOC+1) + ".." + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME+CLAPPNAME+CLAPPLOC+CLAPPCNT)+"), RemoteCounter (" + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME+CLAPPNAME+CLAPPLOC+CLAPPCNT+1) + ".." + str(CLLOCDATETIME+CLLEVEL+CLREMDATETIME+CLAPPNAME+CLAPPLOC+CLAPPCNT+CLLOCCNT) + ")")

zmqContext = zmq.Context.instance()
""":type : zmq.Context"""


pullSocket = zmqContext.socket( 7)
pullSocket.bind("tcp://*:"+str(args.pullPort))

publishSocket = zmqContext.socket( 1)
publishSocket.bind("tcp://*:"+str(args.publishPort))

# Initialize poll set
poller = zmq.Poller()
poller.register(pullSocket, zmq.POLLIN)

should_continue = True
infoandprint("Log Subsystem starting up")

messagesPerSecondCounter = 0
messages = ""
now = datetime.now()
seconds_since_midnight = int((now - now.replace(hour=0, minute=0, second=0, microsecond=0)).total_seconds())
while should_continue:
    socks = dict(poller.poll(100))
    if pullSocket in socks and socks[pullSocket] == zmq.POLLIN:
        msg_parts = pullSocket.recv_multipart()
        PrintNetworkMessage(msg_parts)
        publishSocket.send_multipart(msg_parts)
        messagesPerSecondCounter += 1

    currentNow = datetime.now()
    currentSeconds_since_midnight = int((currentNow - currentNow.replace(hour=0, minute=0, second=0, microsecond=0)).total_seconds())
    if abs(currentSeconds_since_midnight - seconds_since_midnight) > 59:
        infoandprint("Anzahl Nachrichten pro Minute: " + "{0:>5}".format(str(messagesPerSecondCounter)))
        now = currentNow
        seconds_since_midnight = currentSeconds_since_midnight
        messagesPerSecondCounter = 0

pullSocket.close(linger=None)
zmqContext.destroy(linger=None)
