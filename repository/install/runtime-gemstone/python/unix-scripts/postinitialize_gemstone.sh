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
# Dieses Skript sollte nach dem ersten Laden der Anwendungsssoftware ausgeführt
# werden, um die richtige Instanz zum Halten der persistenten Daten zu setzen
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <stone-name>
prepares Gemstone after import of source code

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
# Umgebung setzen
#
cd
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$1/defStone.env $1
echo "2"
if [ -s $GS_HOME/server/stones/$1/product/seaside/etc/gemstone.secret ]; then
    . $GS_HOME/server/stones/$1/product/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GS_HOME/server/stones/$1/defStone.env $1'
    exit 1
fi

# a) add the symbol name according to your application - its the name of the projects and "Data" added: below StatisticsServerData
# b) change the name of the project data according to your application: below STSProject
cat << EOF | topaz -l
set user DataCurator pass $GEMSTONE_CURATOR_PASS gems $GEMSTONE_NAME
iferror where
login
run 
| userProfile symbolDictionary | 
symbolDictionary := System myUserProfile objectNamed: 'StatisticsServerData'.
(symbolDictionary includesKey: #'DataRootInstance') ifFalse: [
	symbolDictionary at: #'DataRootInstance' put: STSProject new initialize
].
%
commit
EOF
