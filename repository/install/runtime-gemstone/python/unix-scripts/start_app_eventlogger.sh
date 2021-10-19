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
# Dieses Script startet ein GEM, um die API Requests von aussen abzuarbeiten
#
#

source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$DBNAME/defStone.env "$DBNAME"
 
if [ -s $GEMSTONE/seaside/etc/gemstone.secret ]; then
    . $GEMSTONE/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GEMSTONE/seaside/etc/gemstone.secret'
    exit 1
fi

while [ -f $DBNAME ]
do

nowTS=`date +%Y-%m-%d-%H-%M`

python3 -u ../app_eventlogger.py -l=$ZMQPUBEVENTPORTADDR >> $GEMSTONE_LOGDIR/app_eventlogger_${nowTS}.log 2>&1

#
# Wenn die Datei nicht mehr vorhanden ist -> sofort Abbruch
# ansonsten 60 sekunden warten, damit nicht zu schnell respawned wird
#
if [ ! -f $DBNAME ]; then
   exit 0
else
   sleep 60s
fi
done