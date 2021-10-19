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
# Kurzes Testscript, um die Uhrzeit im DB-Server zu testen
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <stone-name> <zmq-event-port> <zmq-log-port> <processID> <task_count>


EXAMPLES
  $(basename $0) sts 12345 23456 23234 2

HELP
}

#
# Sind genuegend Parameter mitgegeben ...
#
if [ $# -ne 5 ]; then
  echo "bgtasker NOT started"
  usage; exit 1
fi

#
# Umgebung setzen
#
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$1/defStone.env $1
if [ -s $GS_HOME/server/stones/$1/product/seaside/etc/gemstone.secret ]; then
    . $GS_HOME/server/stones/$1/product/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GS_HOME/server/stones/$1/defStone.env $1'
    exit 1
fi

while [ -f $1 ]
do
nowTS=`date +%Y-%m-%d-%H-%M`

# Change the service class according to your needs: below: STSServiceClass
cat << EOF | topaz -l -T 1000000 -u bgtask_${1}_${4} 2>&1 >> $GEMSTONE_LOGDIR/bgtask_$4}_${5}_${nowTS}.log
set user DataCurator pass $GEMSTONE_CURATOR_PASS gems $GEMSTONE_NAME
iferror where
login
doit
MSKRestCallServerZMQ newDefaultServer
	startZMQOnlyServer: 'tcp'
	interface: '127.0.0.1'
	port: $2 printString asNumber
	logPullPort: $3 printString asNumber
	appName: 'app-bgexec'.
STSServiceClass executeBackgroundTask.
%
EOF
#
# Wenn die Datei nicht mehr vorhanden ist -> sofort Abbruch
# ansonsten 60 sekunden warten, damit nicht zu schnell respawned wird
#
if [ ! -f $1 ]; then
   echo "bgtasker terminated"
   exit 0
else
   sleep 60s
fi
done