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
# This source file loads all the sources from the gemstone vendor
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <db-name>
Updates the product software

EAXMPLES
  $(basename $0) webcati

HELP
}

if [ $# -ne 1 ]; then
  usage; exit 1
fi
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$1/defStone.env $1
if [ -s $GEMSTONE/seaside/etc/gemstone.secret ]; then
    . $GEMSTONE/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GEMSTONE/seaside/etc/gemstone.secret'
    exit 1
fi
cat << EOF | $GEMSTONE/bin/topaz -l -u product_update
set user DataCurator pass $GEMSTONE_CURATOR_PASS gems $GEMSTONE_NAME
iferror where
login
doit
Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeGrease.
%
doit
"Install GLASS from github"
GsDeployer deploy: [
 Metacello new
  baseline: 'GLASS1';
  repository: 'github://glassdb/glass:master/repository';
  get.
 Metacello new
  baseline: 'GLASS1';
  repository: 'github://glassdb/glass:master/repository';
  onLock: [:ex | ex honor ];
  load: 'default' ].
%
doit
GsDeployer deploy: [
  "Load GsApplicationTools packages"
  Metacello new
    baseline: 'GsApplicationTools';
    repository: 'github://GsDevKit/gsApplicationTools:master/repository';
    load: #('default')
].
%
doit
GsDeployer deploy: [
  Metacello new
    baseline: 'ZincHTTPComponents';
    repository: 'github://GsDevKit/zinc:gs_master/repository';
    onLock: [:ex | ex honor ];
    load: 'REST' ].
%
doit
GsDeployer deploy: [
  Metacello new
    baseline: 'Zodiac';
    repository: 'github://GsDevKit/zodiac:gs_master/repository';
    onLock: [:ex | ex honor ];
    load: 'Zodiac-Core' ].
%
doit
GsDeployer deploy: [
  Metacello new
    baseline: 'Zodiac';
    repository: 'github://GsDevKit/zodiac:gs_master/repository';
    onLock: [:ex | ex honor ];
    load: 'Zodiac-GemStone-Core' ].
%
doit
ZnConstants 
  defaultMaximumEntitySize: (16 * 1024 * 1024) ; 
  maximumEntitySize: (16 * 1024 * 1024).
%
commit
EOF
