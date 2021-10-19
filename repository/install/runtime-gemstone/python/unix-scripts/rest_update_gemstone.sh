#!/bin/bash
#
# This software is owned by
#       ____ _____ ____ ____    ____         __ _
#      / ___| ____/ ___/ ___|  / ___|  ___  / _| |___      ____ _ _ __ ___
#     | |  _|  _| \___ \___ \  \___ \ / _ \| |_| __\ \ /\ / / _` | '__/ _ \
#     | |_| | |___ ___) |__) |  ___) | (_) |  _| |_ \ V  V / (_| | | |  __/
#      \____|_____|____/____/  |____/ \___/|_|  \__| \_/\_/ \__,_|_|  \___|
#
# This source file loads all the needed prerequisites to have a REST server
#
#
usage() {
  cat <<HELP

USAGE: $(basename $0) <version> <db-name> 
Loads all packages of the runtime

EAXMPLES
  $(basename $0) v71 webcati71

HELP
}

if [ $# -ne 2 ]; then
  usage; exit 1
fi
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/$2/defStone.env $2
if [ -s $GEMSTONE/seaside/etc/gemstone.secret ]; then
    . $GEMSTONE/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GEMSTONE/seaside/etc/gemstone.secret'
    exit 1
fi
cat << EOF | $GEMSTONE/bin/topaz -l -u rest_framework_update
set user DataCurator pass $GEMSTONE_CURATOR_PASS gems $GEMSTONE_NAME
iferror where
login
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKMigrationSupport' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'Neo-JSON-Core' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKPlatformExtension' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSK-ModelBaseRuntime' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKJSONSchemaSupport' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKZeroMQBase' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKZeroMQGemstone' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKZeroMQWrapper' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKRESTSupport' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKSwaggerSupport' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKExtensions' ;
	load.
%
doit
Gofer new
	url: 'http://dev.gessgroup.de/extfiles/public/${1}/sources' ;
	package: 'MSKMigrationSupport' ;
	load.
ZnConstants 
  defaultMaximumEntitySize: (16 * 1024 * 1024) ; 
  maximumEntitySize: (16 * 1024 * 1024).
%
commit
EOF
