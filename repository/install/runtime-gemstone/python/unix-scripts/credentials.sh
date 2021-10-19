#!/usr/bin/env bash
#       ____ _____ ____ ____    ____         __ _
#      / ___| ____/ ___/ ___|  / ___|  ___  / _| |___      ____ _ _ __ ___
#     | |  _|  _| \___ \___ \  \___ \ / _ \| |_| __\ \ /\ / / _` | '__/ _ \
#     | |_| | |___ ___) |__) |  ___) | (_) |  _| |_ \ V  V / (_| | | |  __/
#      \____|_____|____/____/  |____/ \___/|_|  \__| \_/\_/ \__,_|_|  \___|
#
# Diese Datei setzt Umgebungsvariablen, die von anderen Skripten abgefragt werden können
# Ein Anwender sollte sich diese Datei als credentials.sh kopieren und entsprechend abändern
#
#
export DBNAME="sts"
##
#
#
export USERNAME="root"
export PASSWORD="root"
#
#  Dies ist nicht das eigentliche LOG-System, sondern das EVENT-System
#
export PULLEVENTPORT=21000
export PUBEVENTPORT=22000
export ZMQPULLEVENTPORTADDR="tcp://localhost:${PULLEVENTPORT}"
export ZMQPUBEVENTPORTADDR="tcp://localhost:${PUBEVENTPORT}"
#
#
#
# Anzahl der Backgroundtasks
#
export NRBGTASKS=0
#
# Intervall in sekunden für den Statistik-Monitor
#
export STARTSTATMONITOR="true"
export ITVSTATMON=30

#
# Informationen für das Logging-System
#
export LOGGERPULLPORT=24000
export ZMQPULLLOGGERPORTADDR="tcp://localhost:${LOGGERPULLPORT}"
export LOGGERPUBPORT=24010
export LOGGERPUBPORTADDR="tcp://localhost:${LOGGERPUBPORT}"
#
# Kommunikation-HTTP
#
export NORMALPORT=23000
export LONGPORT=23200
export MEMORYPORT=23400
export LIMITEDPORT=23500

export NORMALMEMORY=100000
export LONGMEMORY=200000
export MEMORYMEMORY=1000000
export LIMITEDMEMORY=200000

export ERRORPORT=9005

export WEBSOCKETSRDPORT=9020
#
# Auf den Entwicklungsrechnern kann man gleich den support starten
#
export STARTNETLDI="true"
#
