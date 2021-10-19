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
# Dieses Script startet ein komplettes Runtime-System von webcati in der ersten Konfiguration
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) Stoppt alle Prozesse auf dem Server


HELP
}

if [ ! -f "./credentials.sh" ]; then
  echo "credentials.sh file not available"
  exit 1
fi

source ./credentials.sh
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$DBNAME/defStone.env $DBNAME

./stop_zmq.sh $DBNAME

