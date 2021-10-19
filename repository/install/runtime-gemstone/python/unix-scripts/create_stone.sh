#!/bin/bash
#
# This software is owned by
#       ____ _____ ____ ____    ____         __ _
#      / ___| ____/ ___/ ___|  / ___|  ___  / _| |___      ____ _ _ __ ___
#     | |  _|  _| \___ \___ \  \___ \ / _ \| |_| __\ \ /\ / / _` | '__/ _ \
#     | |_| | |___ ___) |__) |  ___) | (_) |  _| |_ \ V  V / (_| | | |  __/
#      \____|_____|____/____/  |____/ \___/|_|  \__| \_/\_/ \__,_|_|  \___|
#
# Dieses Skript erzeugt eine neue Datenbank und lädt die passende Software in das System
# und erzeugt die passenden Verzeichnisse
#
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0)  <stonename> <gemstone-version> <software-branch> <softwareversion> <frameworkversion>
Creates a stone for the application - including framework and application specific code

EXAMPLES
  $(basename $0) sts 3.5.1 develop|production v00 v71

HELP
}

GRPNAME=`id -n -g`

#
# Sind genuegend Parameter mitgegeben ...
#
if [ $# -ne 5 ]; then
  usage; exit 1
fi

#
# Und eine ersten Stone erzeugen
#
createStone -g $1 $2
if [ ! -d "$GS_HOME/server/stones/$1" ]; then
  exit 1
fi
#
# Konfigurationsdatei fuer das gem kopieren - Speicherlimit hochsetzen, um auch den groessten
# Softwareklumpen installieren zu können
#
sudo cp ../configuration/gem.conf "$GS_HOME/server/stones/$1/gem.conf"
sudo cp ../configuration/system.conf "$GS_HOME/server/stones/$1/extents/system.conf"
stopStone $1
stopNetldi $1
#
# To read the configuration files again
#
startStone $1
#
# Immer noch im unix-scripts Verzeichnis
#
./update_gemstone.sh $1
#
# 
#
./rest_update_gemstone.sh $5 $1
preinitialize_gemstone.sh $1
app_update_gemstone.sh $4 $1 $3
postinitialize_gemstone.sh $1
initialize_gemstone.sh $1
./settimezone.sh $1

