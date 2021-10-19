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
 Konverterprogramm als Schnittstelle zwischen GESS webcati und MROrga
"""

import argparse
import zmq
import logging
from datetime import datetime
from wchelpers.bottle import Bottle, run, response, request, HTTPError


PGMNAME = "ErrorCollector Converter (GESS Software)"
PGMVERSION = "1.0"
APPLOGNAME = "app-errcol"
localMessageCounter = 0

def logOutput(pPushSocket, pLogLevel, pString):
    global localMessageCounter, APPLOGNAME
    now = datetime.now()
    levelString = ""
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
    logMessage.append("LOGV02".encode())
    logMessage.append(now.strftime("%Y-%m-%dT%H:%M:%S.%f").encode())
    logMessage.append(APPLOGNAME.encode())
    logMessage.append("localhost".encode())
    logMessage.append(str(localMessageCounter).encode())
    logMessage.append(pString.encode())
    logMessage.append(levelString.encode())
    logMessage.append(APPLOGNAME.encode())
    logMessage.append(now.strftime("%Y-%m-%dT%H:%M:%S.%f").encode())
    pPushSocket.send_multipart(logMessage)

# httpserverport (t) - Postnummer des eigenen HTTP Servers
#
#
# ./wcapp_errorcollector.py -t=9005 -g=/var/www/html/webcati_data/webcati6/directories/logs/errorcollector.txt
#

parser = argparse.ArgumentParser(description='Process the arguments')
parser.add_argument('-t', type=int, dest='port', required=True,
                    help='set the port number of my own http server')

args = parser.parse_args()
zmqContext = zmq.Context.instance()
""":type : zmq.Context"""
pushSocket = zmqContext.socket( 8 )
pushSocket.connect("tcp://localhost:24000")

logOutput(pushSocket, logging.INFO,PGMNAME + " " + PGMVERSION)

#
# Meldung auf dem Bildschirm
#
logOutput(pushSocket, logging.INFO,"HTTP-Port             : " + str(args.port))
logOutput(pushSocket, logging.INFO,"Connect to 0MQ        : 24000")

bottleApp = Bottle()

@bottleApp.route('/middleware/applicationError',method='POST')
def webResponseGet():
    try:
        errorMessage = request._get_body_string()
        logOutput(pushSocket, logging.ERROR,str(errorMessage))
    except HTTPError as exeption:
        logOutput(pushSocket, logging.ERROR,"Fehler (HTTPError) bei Request: " + str(exeption.body))
        raise exeption
    return ""

run(bottleApp, port=args.port)
logOutput(pushSocket, logging.INFO,"Arbeit beendet")
zmqContext.destroy(linger=None)
