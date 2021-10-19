#!/bin/bash
#
# This software is owned by
#       ____ _____ ____ ____    ____         __ _
#      / ___| ____/ ___/ ___|  / ___|  ___  / _| |___      ____ _ _ __ ___
#     | |  _|  _| \___ \___ \  \___ \ / _ \| |_| __\ \ /\ / / _` | '__/ _ \
#     | |_| | |___ ___) |__) |  ___) | (_) |  _| |_ \ V  V / (_| | | |  __/
#      \____|_____|____/____/  |____/ \___/|_|  \__| \_/\_/ \__,_|_|  \___|
#
# Dieses Skript lädt von Entwicklungsserver eine von PUM erzeugtes Shellskript
# herunter, um ein neues Modell zu installieren
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <version> <pumversion> <stone> <software-branch>

Imports a new source code shell script for the database

http://dev.projekt.tv/extfiles/gess-sts/<version>/sources/statisticsserver-modelsource-<pumversion>.sh

EAXMPLES
  $(basename $0) v00 0_001 sts develop|production

HELP
}

if [ $# -ne 4 ]; then
  usage; exit 1
fi

rm out.txt
curl http://dev.gessgroup.de/extfiles/gess-sts/$1/$4/sources/statisticsserver-modelsource-$2.sh > statisticsserver-$2.sh
dos2unix statisticsserver-$2.sh
sudo chmod a+x statisticsserver-$2.sh
./statisticsserver-$2.sh $3 &>statisticsserver-$2_out.txt
less statisticsserver-$2_out.txt
