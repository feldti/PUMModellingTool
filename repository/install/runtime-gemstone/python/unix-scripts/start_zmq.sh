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
# Dieses Script startet ein komplettes Runtime-System von webcati inklusiver
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <stone-name> <PULL-Port> <PUB-Port> <processID> <#bg-tasks>
# aler notwendiger Hintergrundskripte
Starts Runtime system of GESS WEBCati

1 <stone-name>   - Name der Datenbank
2 <PULL-Port>    - Port des PULL-Sockets, der die Nachrichten der DB serialisiert
3 <PUB-Port>     - Port des PUB-Sockets, der den CATI-Datenbus bildet
4 <processid>    - ProzessID der aufrufenden Shell
5 <# bgtasks>    - Anzahl der zu startenden backgroundtasks
EXAMPLES

  $(basename $0) webcati71 21000 22000 9000 67543 1

HELP
}

if [ ! -f  ./credentials.sh ]; then
  echo "Could not find credentials.sh. Starting aborted"
  exit 1

fi
source ./credentials.sh
#
# Sind genuegend Parameter mitgegeben ...
#
if [ $# -ne 5 ]; then
  usage; exit 1
fi
#
nohup ./start_app_logger.sh &
#
# This script starts the complete application server system
# 
#
startStone $1
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$1/defStone.env $1
waitstone $1
nohup ./starthttp_zmq.sh $1 $NORMALMEMORY $(($NORMALPORT + 00)) http_normal.0 $2 $4 &
nohup ./starthttp_zmq.sh $1 $NORMALMEMORY $(($NORMALPORT + 10)) http_normal.1 $2 $4 &
nohup ./starthttp_zmq.sh $1 $NORMALMEMORY $(($NORMALPORT + 20)) http_normal.2 $2 $4 &
nohup ./starthttp_zmq.sh $1 $NORMALMEMORY $(($NORMALPORT + 30)) http_normal.3 $2 $4 &
nohup ./starthttp_zmq.sh $1 $NORMALMEMORY $(($NORMALPORT + 40)) http_normal.4 $2 $4 &
nohup ./starthttp_zmq.sh $1 $LONGMEMORY  $(($LONGPORT + 00)) http_long.1 $2 $4 &
nohup ./starthttp_zmq.sh $1 $LONGMEMORY  $(($LONGPORT + 10)) http_long.2 $2 $4 &
nohup ./starthttp_zmq.sh $1 $MEMORYMEMORY $(($MEMORYPORT + 00)) http_memory.1 $2 $4 &
nohup ./starthttp_zmq.sh $1 $MEMORYMEMORY $(($MEMORYPORT + 10)) http_memory.2 $2 $4 &
nohup ./starthttp_zmq.sh $1 $LIMITEDMEMORY $(($LIMITEDPORT + 00)) http_limited.1 $2 $4 &
nohup ./starthttp_zmq.sh $1 $LIMITEDMEMORY $(($LIMITEDPORT + 10)) http_limited.2 $2 $4 &
#
# If you want to have background tasks
#
for (( counter=1 ; counter <= $5 ; counter++ ))
do
  nohup ./bgtaskexecuter.sh $1 $2 $LOGGERPULLPORT $5 $counter &
done
#
rm -r logs/*
# Wir muessen ein paar Sekunden warten, bis alle Ports geöffnet sind
sleep 10
#
# EventPublisher
#
nohup ./start_app_eventpublisher.sh &
#
#
nohup ./start_app_eventlogger.sh &
#
#
nohup ./start_app_websocketsrv.sh &
#
if [ "$STARTNETLDI" = "true" ]; then
 startNetldi $DBNAME
fi




