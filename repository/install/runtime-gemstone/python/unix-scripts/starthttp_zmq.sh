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
usage() {
  cat <<HELP

USAGE: $(basename $0) <stone-name> <memory> <http-port> <name> <push-port>
Starts a HTTP-Server on a specific port and a GEM with a temporary memory

1 <stone-name>   - Name der Datenbank
2 <memory>       - Temp memory of this GEM
3 <http-port>    - HTTP-Port
4 <name>         - Name of this script
5 <push-port>    - ZMQ-PUSH Port
6 <processID>    - ID des Prozesses


EXAMPLES

  $(basename $0) webcati6 75000 19000 long 12000

HELP
}

#
# Sind genuegend Parameter mitgegeben ...
#
if [ $# -ne 6 ]; then
  usage; exit 1
fi

source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$1/defStone.env "$1"
 
if [ -s $GEMSTONE/seaside/etc/gemstone.secret ]; then
    . $GEMSTONE/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GEMSTONE/seaside/etc/gemstone.secret'
    exit 1
fi

while [ -f $1 ]
do

nowTS=`date +%Y-%m-%d-%H-%M`
cat << EOF | nohup $GEMSTONE/bin/topaz -l -T $2 -u ${4}_${3}_${5} 2>&1 >> $GEMSTONE_LOGDIR/${4}_${6}_server_${nowTS}.log

set user DataCurator pass $GEMSTONE_CURATOR_PASS gems $GEMSTONE_NAME

display oops
iferror where

login

run

"record gems pid in the pid file"

| file |

(GsFile isServerDirectory: '$GEMSTONE_DATADIR') ifFalse: [ ^nil ].

file := GsFile openWriteOnServer: '$GEMSTONE_DATADIR/${4}.pid'.
file nextPutAll: (System gemVersionReport at: 'processId') printString.
file cr.
file close.

(ObjectLogEntry
  info: '${4}_server: startup'
  object: 'pid: ', (System gemVersionReport at: 'processId') printString) addToLog.
System commitTransaction
    ifFalse: [
      System abortTransaction.
      nil error: 'Could not commit ObjectLog entry' ].
%
run

| count server |

GsProcess usingNativeCode not
  ifTrue: [
    "Enable remote Breakpoing handling"
    Breakpoint trappable: true.
    GemToGemAnnouncement installStaticHandler.
    System commitTransaction ifFalse: [ nil error: 'Could not commit for GemToGemSignaling' ].
  ].

System transactionMode: #manualBegin.


"This thread is needed to handle the SigAbort exception, when the primary
thread is blocked. Assuming default 60 second STN_GEM_ABORT_TIMEOUT, wake
up at 30 second intervals."

[
  [ true ] whileTrue: [ 
	(Delay forSeconds: 30) wait ].

] forkAt: Processor lowestPriority.

IndexManager sessionAutoCommit: true.

GsFile gciLogServer: '$1 Server started on port ', $3 printString,' ZMQ-Port:', $5 printString.
server := MSKRestCallServerZMQ newDefaultServer.
server port: $3 printString asNumber.
server
	startServer: true 
	httpDebug: false 
	localhost: true
	zmqProtocol: 'tcp' 
	interface: '127.0.0.1'
	port: $5 printString asNumber.
%

run

GemToGemAnnouncement uninstallStaticHandler.
System beginTransaction.
(ObjectLogEntry
  fatal: '${4}_server: topaz exit'
  object:
    'pid: ', (System gemVersionReport at: 'processId') printString) addToLog.
System commitTransaction.

%

EOF
#
# Wenn die Datei nicht mehr vorhanden ist -> sofort Abbruch
# ansonsten 60 sekunden warten, damit nicht zu schnell respawned wird
#
if [ ! -f $1 ]; then
   exit 0
else
   sleep 60s
fi
done