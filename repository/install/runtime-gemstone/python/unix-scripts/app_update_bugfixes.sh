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
# This script loads all application extensions files except the model file ...
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <versions-name> <stone-name>  <software-branch>
Loads all core packages (containing the actual product code) WITHOUT
the model definition into the system

EXAMPLES
  $(basename $0) v00 sts develop|production

HELP
}

#
# Sind genuegend Parameter mitgegeben ...
#
if [ $# -ne 3 ]; then
  usage; exit 1
fi

#
# Set the environment
cd
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$2/defStone.env $2
if [ -s $GEMSTONE/seaside/etc/gemstone.secret ]; then
    . $GEMSTONE/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GEMSTONE/seaside/etc/gemstone.secret'
    exit 1
fi

# a) add the correct path at the remote site
# b) add additional package loading commands
# c) change the name of the RestClass according to your needs: below STSRestClass
#    its a sublcass of MSKRestCallV2 in your Gemstone server
cat << EOF | $GEMSTONE/bin/topaz -l
set user DataCurator pass $GEMSTONE_CURATOR_PASS gems $GEMSTONE_NAME
iferror where
login
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/gess-sts/${1}/${3}/sources' ;
	package: 'StatisticsServerExtension' ;
	load.
%
doit
STSRestClass buildAPIDefinitionsStructure.
%
commit
EOF


