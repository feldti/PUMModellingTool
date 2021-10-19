#!/bin/bash
#
# This software is owned by
#       ____ _____ ____ ____    ____         __ _
#      / ___| ____/ ___/ ___|  / ___|  ___  / _| |___      ____ _ _ __ ___
#     | |  _|  _| \___ \___ \  \___ \ / _ \| |_| __\ \ /\ / / _` | '__/ _ \
#     | |_| | |___ ___) |__) |  ___) | (_) |  _| |_ \ V  V / (_| | | |  __/
#      \____|_____|____/____/  |____/ \___/|_|  \__| \_/\_/ \__,_|_|  \___|
#
#
#
# This scripts stops the running webcati server system and all supporting processes
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <stone-name>
Stops Runtime system of the application server


EXAMPLES

  $(basename $0) sts

HELP
}

#
# Sind genuegend Parameter mitgegeben ...
#
if [ $# -ne 1 ]; then
  usage; exit 1
fi

#
# Diese Datei wird nun gelöscht, damit die Hintergrundprozesse wissen, dass sie sich wirklich terminieren sollen
#
if [ -f $1 ]; then
  rm $1
fi


# This script starts the complete Simple WebCati ServerSystem
# -> one answering HTTP server
#
stopStone $1
stopNetldi $1
pkill -f eventlogger.py
pkill -f eventpublisher.py
# pkill -f wcapp_websocketsrv.py
pkill -f wcapp_errorcollector.py
pkill -f app_logger.py

stones
ifconfig




