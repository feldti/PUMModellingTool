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
# Dieses Script startet ein komplettes Runtime-System der Anwendung
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) Startet die Datenbanken mit den Standardkonfigurationswerte


HELP
}

if [ ! -f "./credentials.sh" ]; then
  echo "credentials.sh file not available"
  exit 1111
fi
source ./credentials.sh
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$DBNAME/defStone.env $DBNAME

#
# This file will be created to show all other tasks that the database is running
#
touch $DBNAME
nowTS=`date +%Y-%m-%d-%H-%M`

# Backup Verzeichnis anlegen für die komprimierten Logs
if [ ! -d "$GEMSTONE_LOGDIR/backup" ]; then
  mkdir -p "$GEMSTONE_LOGDIR/backup"
  echo "LOG Backup directory not available. Created"
fi

if [ ! -d "$GEMSTONE_LOGDIR/backup" ]; then
  echo "LOG Backup directory not available. Abort"
  exit 1200
fi

# we compress and save all log files
echo $GEMSTONE_LOGDIR/*.log | xargs mv -t $GEMSTONE_LOGDIR/backup
(echo $GEMSTONE_LOGDIR/backup/*.log | xargs 7z a $GEMSTONE_LOGDIR/"$DBNAME"_"$nowTS"_log.7z  ; echo $GEMSTONE_LOGDIR/backup/*.log | xargs rm ) &

./start_zmq.sh $DBNAME $PULLEVENTPORT $PUBEVENTPORT $$ $NRBGTASKS

