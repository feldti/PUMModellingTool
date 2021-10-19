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
 Dienstprogram Empfang von events und Weiterleitung in den WebCATI-Datenbus
"""

import argparse
import logging
import logging.handlers
import os
import sys
import zmq
from datetime import datetime


from wclib import loghelpers

def logOutput( pPushSocket, pLogLevel, pString):
    global localMessageCounter, APPLOGNAME

    if pLogLevel == logging.INFO:
        levelString = "INFO"
    elif pLogLevel == logging.ERROR:
        levelString = "ERROR"
    elif pLogLevel == logging.WARNING:
        levelString = "WARNING"
    elif pLogLevel == logging.DEBUG:
        levelString = "DEBUG"

    localMessageCounter += 1
    logMessage = []
    logMessage.append("LOGV01".encode())
    logMessage.append(datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f").encode())
    logMessage.append(APPLOGNAME.encode())
    logMessage.append("localhost".encode())
    logMessage.append(str(localMessageCounter).encode())
    logMessage.append(pString.encode())
    logMessage.append(levelString.encode())

    pPushSocket.send_multipart(logMessage)

PGMNAME = "Event Publisher (GESS Software)"
PGMVERSION = "1.0"
APPLOGNAME = 'app-evpublish'
localMessageCounter = 0

# Um mit WebCati kommunizieren zu können, muss man die folgenden Parameter mitgeben:
#
# publishPort    (p) - port des PUBLISH socket
# pullPort       (l) - Port des PULL Socket
#
#
# ./wcapp_eventpublisher.py  -l=21000 -p=22000
#

parser = argparse.ArgumentParser(description='Process the arguments')
parser.add_argument('-p', type=int, dest='publishPort', required=True, help='Port of the PUBLISH socket')
parser.add_argument('-l', type=int, dest='pullPort', required=True, help='Port of the PULL socket')
args = parser.parse_args()

zmqContext = zmq.Context.instance()
""":type : zmq.Context"""
pushSocket = zmqContext.socket( 8 )
pushSocket.connect("tcp://localhost:24000")

logOutput(pushSocket, logging.INFO,PGMNAME + " " + PGMVERSION)
logOutput(pushSocket, logging.INFO,"PyZMQ-Version            : " + zmq.pyzmq_version())
logOutput(pushSocket, logging.INFO,"ZMQ-Version              : " + zmq.zmq_version())
logOutput(pushSocket, logging.INFO,"PULL-Socket-Port         : " + str(args.pullPort))
logOutput(pushSocket, logging.INFO,"PUBLISH-Socket-Port      : " + str(args.publishPort))


pullSocket = zmqContext.socket( 7)
pullSocket.bind("tcp://*:"+str(args.pullPort))

publishSocket = zmqContext.socket( 1)
publishSocket.bind("tcp://*:"+str(args.publishPort))


# Initialize poll set
poller = zmq.Poller()
poller.register(pullSocket, zmq.POLLIN)

should_continue = True
logOutput(pushSocket, logging.INFO,"Warte auf Nachricht")

messagesPerSecondCounter = 0
messages = ""
now = datetime.now()
seconds_since_midnight = int((now - now.replace(hour=0, minute=0, second=0, microsecond=0)).total_seconds())
while should_continue:
    socks = dict(poller.poll(100))
    if pullSocket in socks and socks[pullSocket] == zmq.POLLIN:
        msg_parts = pullSocket.recv_multipart()
        publishSocket.send_multipart(msg_parts)
        messagesPerSecondCounter += 1

    currentNow = datetime.now()
    currentSeconds_since_midnight = int((currentNow - currentNow.replace(hour=0, minute=0, second=0, microsecond=0)).total_seconds())
    if abs(currentSeconds_since_midnight - seconds_since_midnight) > 59:
        logOutput(pushSocket, logging.INFO,"Anzahl Events pro Minute published: " + str(messagesPerSecondCounter).rjust(8))
        now = currentNow
        seconds_since_midnight = currentSeconds_since_midnight
        messagesPerSecondCounter = 0

logOutput(pushSocket, logging.INFO,"Arbeit beendet")
pullSocket.close(linger=None)
publishSocket.close(linger=None)
zmqContext.destroy(linger=None)