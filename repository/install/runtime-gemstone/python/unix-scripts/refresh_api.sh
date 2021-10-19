#!/bin/bash
#
# This software is owned by
#       ____ _____ ____ ____    ____         __ _
#      / ___| ____/ ___/ ___|  / ___|  ___  / _| |___      ____ _ _ __ ___
#     | |  _|  _| \___ \___ \  \___ \ / _ \| |_| __\ \ /\ / / _` | '__/ _ \
#     | |_| | |___ ___) |__) |  ___) | (_) |  _| |_ \ V  V / (_| | | |  __/
#      \____|_____|____/____/  |____/ \___/|_|  \__| \_/\_/ \__,_|_|  \___|
#
# Mit diesem Skript kann man die aktuellen API-Strukturen herstellen oder auffrischen
# Es sollte immer ausgeführt werden, wenn sich die API im Modell geändert hat
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <stone-name>
initializes the API structure within the database

EXAMPLES
  $(basename $0) webcati6

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
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$1/defStone.env $1
echo "2"
if [ -s $GS_HOME/server/stones/$1/product/seaside/etc/gemstone.secret ]; then
    . $GS_HOME/server/stones/$1/product/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GS_HOME/server/stones/$1/defStone.env esystem'
    exit 1
fi

cat << EOF | topaz -l
set user DataCurator pass $GEMSTONE_CURATOR_PASS gems $GEMSTONE_NAME
iferror where
login
doit
STSRestClass buildAPIDefinitionsStructure.
%
commit
%
EOF
