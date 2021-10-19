#!/usr/bin/env python3
#
# This software is owned by
#       ____ _____ ____ ____    ____         __ _
#      / ___| ____/ ___/ ___|  / ___|  ___  / _| |___      ____ _ _ __ ___
#     | |  _|  _| \___ \___ \  \___ \ / _ \| |_| __\ \ /\ / / _` | '__/ _ \
#     | |_| | |___ ___) |__) |  ___) | (_) |  _| |_ \ V  V / (_| | | |  __/
#      \____|_____|____/____/  |____/ \___/|_|  \__| \_/\_/ \__,_|_|  \___|
#
# 06.12.2019 - Updated to 12 Frames format

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

from wclib import loghelpers
from datetime import datetime

def logOutput( pPushSocket, eventTS, pLogLevel, pString, pAppTS, pAppname):
    global localMessageCounter, APPLOGNAME
    localMessageCounter += 1
    logMessage = []
    logMessage.append("LOGV02".encode())
    logMessage.append(eventTS.encode())
    logMessage.append(pAppname.encode())
    logMessage.append("localhost".encode())
    logMessage.append(str(localMessageCounter).encode())
    logMessage.append(pString.encode())
    logMessage.append("INFO".encode())
    logMessage.append(pAppname.encode())
    logMessage.append(pAppTS.encode())
    pPushSocket.send_multipart(logMessage)

PGMNAME = "Event Logger (GESS Software)"
PGMVERSION = "1.0"
APPLOGNAME = "app-evlogger"
localMessageCounter = 0

# Um mit WebCati kommunizieren zu können, muss man die folgenden Parameter mitgeben:
#
# loginstance    (i) - LoginInstance - definiert den Namen mit der Logdatei
# url            (l) - URL des PUBLISH Port (z.B. tcp://localhost:10213
#
# ./wcapp_eventlogger.py -l="tcp://localhost:22000"
#

parser = argparse.ArgumentParser(description='Process the arguments')
parser.add_argument('-l', type=str, dest='publishURL', required=True, help='Port of the PUB socket')
# parser.add_argument('-g', type=str, dest='logfile', required=True, help='set the path of the log file name')
args = parser.parse_args()

zmqContext = zmq.Context.instance()
""":type : zmq.Context"""

subscribeSocket = zmqContext.socket( 2)
subscribeSocket.connect(args.publishURL)
subscribeSocket.setsockopt_string(zmq.SUBSCRIBE,"")

pushSocket = zmqContext.socket( 8 )
pushSocket.connect("tcp://localhost:24000")

logOutput(pushSocket, datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f"), logging.INFO, PGMNAME + " " + PGMVERSION,"","")
logOutput(pushSocket, datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f"), logging.INFO, "PyZMQ-Version            : " + zmq.pyzmq_version(),"",APPLOGNAME)
logOutput(pushSocket, datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f"), logging.INFO, "ZMQ-Version              : " + zmq.zmq_version(),"", APPLOGNAME)
logOutput(pushSocket, datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f"), logging.INFO, "URL-Publish              : " + args.publishURL,"",APPLOGNAME)

# Initialize poll set
poller = zmq.Poller()
poller.register(subscribeSocket, zmq.POLLIN)

should_continue = True
logOutput(pushSocket, datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f"), logging.INFO, "Starte EventLogger","",APPLOGNAME)
while should_continue:
    socks = dict(poller.poll())
    if subscribeSocket in socks and socks[subscribeSocket] == zmq.POLLIN:
        msg_parts = subscribeSocket.recv_multipart()
        logOutput(pushSocket,
                  msg_parts[3].decode('utf-8'),
                  logging.INFO,
                  msg_parts[2].decode('utf-8')
                  + "\t (Session: "+msg_parts[4].decode('utf-8')+")"
                  + "\t" +msg_parts[5].decode('utf-8')
                  + "\t" +msg_parts[6].decode('utf-8')
                  + "\t" +msg_parts[7].decode('utf-8')
                  + "\t" +msg_parts[8].decode('utf-8')
                  + "\t" +msg_parts[9].decode('utf-8')
                  + "\t" ,
                  msg_parts[10].decode('utf-8'),
                  msg_parts[11].decode('utf-8'))

logOutput(pushSocket, datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f"), logging.INFO,"Arbeit beendet",APPLOGNAME,"")
subscribeSocket.close(linger=None)
zmqContext.destroy(linger=None)