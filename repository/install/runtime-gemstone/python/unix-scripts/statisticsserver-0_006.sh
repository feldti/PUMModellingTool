#!/bin/bash
#
usage() {
	cat <<HELP

USAGE: $(basename $0) <stone-name>
loads source code within this file into a specific stone

EXAMPLES
	$(basename $0) seaside

HELP
}
#
# check number of parameters 
#
if [ $# -ne 1 ]; then
	usage; exit 1
fi
#
# This is the source file for the project named <StatisticsServer> Version <0.006>
# Created by <Topaz/Gemstone (REST Server Smalltalk)> <9.48>
# Created at <2020-04-15T14:44:24.083+02:00>
#
#
source $GS_HOME/bin/defGsDevKit.env
source $GS_HOME/server/stones/${1}/defStone.env ${1}
if [ -s $GS_HOME/server/stones/${1}/product/seaside/etc/gemstone.secret ]; then
    . $GS_HOME/server/stones/${1}/product/seaside/etc/gemstone.secret
else
    echo 'Missing password file $GS_HOME/server/stones/${1}/defStone.env ${1}'
    exit 1
fi
cat << EOF | $GEMSTONE/bin/topaz -l
set user DataCurator pass $GEMSTONE_CURATOR_PASS gems $GEMSTONE_NAME
iferror where
login
doit
PackageInfo registerPackageName: 'StatisticsServer'.
MCWorkingCopy forPackage: (MCPackage new name: 'StatisticsServer').
PackageInfo registerPackageName: 'StatisticsServerTests'.
MCWorkingCopy forPackage: (MCPackage new name: 'StatisticsServerTests').
PackageInfo registerPackageName: 'StatisticsServerExtension'.
MCWorkingCopy forPackage: (MCPackage new name: 'StatisticsServerExtension').
PackageInfo registerPackageName: 'StatisticsServerREST'.
MCWorkingCopy forPackage: (MCPackage new name: 'StatisticsServerREST').

%
run 
| aSymbol names userProfile symbolDictionary | 
aSymbol := #'StatisticsServerData'.
userProfile := System myUserProfile.
names := userProfile symbolList names.
(names includes: aSymbol) ifFalse: [
	symbolDictionary := SymbolDictionary new name: aSymbol; yourself.
	userProfile insertDictionary: symbolDictionary at: names size + 1.
].
(symbolDictionary := System myUserProfile objectNamed: 'StatisticsServerData') isNil ifFalse:[
	(symbolDictionary includesKey: #'DataRootInstance') ifFalse: [
		| projectClass | 
		(projectClass := System myUserProfile objectNamed: 'STSProject') isNil ifFalse:[
			symbolDictionary at: #'DataRootInstance' put: projectClass new initialize
		].
	].
].
%
doit
PUMGeneralEnumObject subclass: 'STSUserRole'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSUserRole includesCategory: eachName ) ifTrue:[ STSUserRole removeCategory: eachName ].
( STSUserRole class includesCategory: eachName ) ifTrue:[ STSUserRole class removeCategory: eachName ]
].

%
doit
PUMGeneralEnumObject subclass: 'STSEnumProductDefinition'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSEnumProductDefinition includesCategory: eachName ) ifTrue:[ STSEnumProductDefinition removeCategory: eachName ].
( STSEnumProductDefinition class includesCategory: eachName ) ifTrue:[ STSEnumProductDefinition class removeCategory: eachName ]
].

%
doit
PUMGeneralEnumObject subclass: 'STSEnumErrorDefinition'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSEnumErrorDefinition includesCategory: eachName ) ifTrue:[ STSEnumErrorDefinition removeCategory: eachName ].
( STSEnumErrorDefinition class includesCategory: eachName ) ifTrue:[ STSEnumErrorDefinition class removeCategory: eachName ]
].

%
doit
MSKRESTLocaleErrorDefinition subclass: 'STSEnumErrorDefinitionLocaleErrorDefinition'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSEnumErrorDefinitionLocaleErrorDefinition includesCategory: eachName ) ifTrue:[ STSEnumErrorDefinitionLocaleErrorDefinition removeCategory: eachName ].
( STSEnumErrorDefinitionLocaleErrorDefinition class includesCategory: eachName ) ifTrue:[ STSEnumErrorDefinitionLocaleErrorDefinition class removeCategory: eachName ]
].

%
doit
PUMGeneralDomainObject subclass: 'STSAPIGeneralObject'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIGeneralObject includesCategory: eachName ) ifTrue:[ STSAPIGeneralObject removeCategory: eachName ].
( STSAPIGeneralObject class includesCategory: eachName ) ifTrue:[ STSAPIGeneralObject class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^self getDomainPropertyAccessorManual: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
getDomainPropertyAccessorManual: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^nil 

%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSAPIGeneralObject
errorMessageClass

	^STSEnumErrorDefinitionLocaleErrorDefinition
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSAPIGeneralObject
dataRootInstance

	^(StatisticsServerData at: #'DataRootInstance')
%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^[ :each | each ] 

%
doit
STSAPIGeneralObject subclass: 'STSAPIError'
	instVarNames: #(code text  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIError includesCategory: eachName ) ifTrue:[ STSAPIError removeCategory: eachName ].
( STSAPIError class includesCategory: eachName ) ifTrue:[ STSAPIError class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIError
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIError
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIError
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralObject subclass: 'STSAPIObjectsWithoutIDs'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIObjectsWithoutIDs includesCategory: eachName ) ifTrue:[ STSAPIObjectsWithoutIDs removeCategory: eachName ].
( STSAPIObjectsWithoutIDs class includesCategory: eachName ) ifTrue:[ STSAPIObjectsWithoutIDs class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
doit
STSAPIObjectsWithoutIDs subclass: 'STSAPIGeneralParameterObject'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIGeneralParameterObject includesCategory: eachName ) ifTrue:[ STSAPIGeneralParameterObject removeCategory: eachName ].
( STSAPIGeneralParameterObject class includesCategory: eachName ) ifTrue:[ STSAPIGeneralParameterObject class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
doit
STSAPIGeneralParameterObject subclass: 'STSAPISessionCreationParameter'
	instVarNames: #(login password  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPISessionCreationParameter includesCategory: eachName ) ifTrue:[ STSAPISessionCreationParameter removeCategory: eachName ].
( STSAPISessionCreationParameter class includesCategory: eachName ) ifTrue:[ STSAPISessionCreationParameter class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralParameterObject subclass: 'STSAPIPagedRequest'
	instVarNames: #(limit start page gsquery sort filter  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIPagedRequest includesCategory: eachName ) ifTrue:[ STSAPIPagedRequest removeCategory: eachName ].
( STSAPIPagedRequest class includesCategory: eachName ) ifTrue:[ STSAPIPagedRequest class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPagedRequest
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPagedRequest
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
doit
STSAPIPagedRequest subclass: 'STSAPIPRLicenseListStore'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIPRLicenseListStore includesCategory: eachName ) ifTrue:[ STSAPIPRLicenseListStore removeCategory: eachName ].
( STSAPIPRLicenseListStore class includesCategory: eachName ) ifTrue:[ STSAPIPRLicenseListStore class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIPagedRequest subclass: 'STSAPIPRLogEntryListStore'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIPRLogEntryListStore includesCategory: eachName ) ifTrue:[ STSAPIPRLogEntryListStore removeCategory: eachName ].
( STSAPIPRLogEntryListStore class includesCategory: eachName ) ifTrue:[ STSAPIPRLogEntryListStore class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIPagedRequest subclass: 'STSAPIPRSessionListStore'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIPRSessionListStore includesCategory: eachName ) ifTrue:[ STSAPIPRSessionListStore removeCategory: eachName ].
( STSAPIPRSessionListStore class includesCategory: eachName ) ifTrue:[ STSAPIPRSessionListStore class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIPagedRequest subclass: 'STSAPIPRProductListStore'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIPRProductListStore includesCategory: eachName ) ifTrue:[ STSAPIPRProductListStore removeCategory: eachName ].
( STSAPIPRProductListStore class includesCategory: eachName ) ifTrue:[ STSAPIPRProductListStore class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIPRProductListStore
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIPagedRequest subclass: 'STSAPIPRLicenseOptionListStore'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIPRLicenseOptionListStore includesCategory: eachName ) ifTrue:[ STSAPIPRLicenseOptionListStore removeCategory: eachName ].
( STSAPIPRLicenseOptionListStore class includesCategory: eachName ) ifTrue:[ STSAPIPRLicenseOptionListStore class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIPagedRequest subclass: 'STSAPIPRCustomerListStore'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIPRCustomerListStore includesCategory: eachName ) ifTrue:[ STSAPIPRCustomerListStore removeCategory: eachName ].
( STSAPIPRCustomerListStore class includesCategory: eachName ) ifTrue:[ STSAPIPRCustomerListStore class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIPagedRequest subclass: 'STSAPIPRUserListStore'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIPRUserListStore includesCategory: eachName ) ifTrue:[ STSAPIPRUserListStore removeCategory: eachName ].
( STSAPIPRUserListStore class includesCategory: eachName ) ifTrue:[ STSAPIPRUserListStore class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIPRUserListStore
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIPagedRequest
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIObjectsWithoutIDs subclass: 'STSAPIGeneralParameterObjectList'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIGeneralParameterObjectList includesCategory: eachName ) ifTrue:[ STSAPIGeneralParameterObjectList removeCategory: eachName ].
( STSAPIGeneralParameterObjectList class includesCategory: eachName ) ifTrue:[ STSAPIGeneralParameterObjectList class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
doit
STSAPIGeneralParameterObjectList subclass: 'STSAPICustomerListStorePL'
	instVarNames: #(customers  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPICustomerListStorePL includesCategory: eachName ) ifTrue:[ STSAPICustomerListStorePL removeCategory: eachName ].
( STSAPICustomerListStorePL class includesCategory: eachName ) ifTrue:[ STSAPICustomerListStorePL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralParameterObjectList subclass: 'STSAPILicenseListStorePL'
	instVarNames: #(licenses  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILicenseListStorePL includesCategory: eachName ) ifTrue:[ STSAPILicenseListStorePL removeCategory: eachName ].
( STSAPILicenseListStorePL class includesCategory: eachName ) ifTrue:[ STSAPILicenseListStorePL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralParameterObjectList subclass: 'STSAPILicenseOptionListStorePL'
	instVarNames: #(options  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILicenseOptionListStorePL includesCategory: eachName ) ifTrue:[ STSAPILicenseOptionListStorePL removeCategory: eachName ].
( STSAPILicenseOptionListStorePL class includesCategory: eachName ) ifTrue:[ STSAPILicenseOptionListStorePL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralParameterObjectList subclass: 'STSAPIUserListStorePL'
	instVarNames: #(users  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIUserListStorePL includesCategory: eachName ) ifTrue:[ STSAPIUserListStorePL removeCategory: eachName ].
( STSAPIUserListStorePL class includesCategory: eachName ) ifTrue:[ STSAPIUserListStorePL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIUserListStorePL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIUserListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIUserListStorePL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralParameterObjectList subclass: 'STSAPILogEntryListStorePL'
	instVarNames: #(entries  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILogEntryListStorePL includesCategory: eachName ) ifTrue:[ STSAPILogEntryListStorePL removeCategory: eachName ].
( STSAPILogEntryListStorePL class includesCategory: eachName ) ifTrue:[ STSAPILogEntryListStorePL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralParameterObjectList subclass: 'STSAPISessionListStorePL'
	instVarNames: #(sessions  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPISessionListStorePL includesCategory: eachName ) ifTrue:[ STSAPISessionListStorePL removeCategory: eachName ].
( STSAPISessionListStorePL class includesCategory: eachName ) ifTrue:[ STSAPISessionListStorePL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionListStorePL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPISessionListStorePL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralParameterObjectList subclass: 'STSAPIProductListStorePL'
	instVarNames: #(products  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIProductListStorePL includesCategory: eachName ) ifTrue:[ STSAPIProductListStorePL removeCategory: eachName ].
( STSAPIProductListStorePL class includesCategory: eachName ) ifTrue:[ STSAPIProductListStorePL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProductListStorePL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProductListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIProductListStorePL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralObject subclass: 'STSAPIGeneralResult'
	instVarNames: #(dbgapi dbgloc dbgss dbgms dbts success error  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIGeneralResult includesCategory: eachName ) ifTrue:[ STSAPIGeneralResult removeCategory: eachName ].
( STSAPIGeneralResult class includesCategory: eachName ) ifTrue:[ STSAPIGeneralResult class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
doit
STSAPIGeneralResult subclass: 'STSAPIResultListWithSingleObject'
	instVarNames: #(total  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIResultListWithSingleObject includesCategory: eachName ) ifTrue:[ STSAPIResultListWithSingleObject removeCategory: eachName ].
( STSAPIResultListWithSingleObject class includesCategory: eachName ) ifTrue:[ STSAPIResultListWithSingleObject class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
doit
STSAPIResultListWithSingleObject subclass: 'STSAPILicenseListStoreRL'
	instVarNames: #(licenses  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILicenseListStoreRL includesCategory: eachName ) ifTrue:[ STSAPILicenseListStoreRL removeCategory: eachName ].
( STSAPILicenseListStoreRL class includesCategory: eachName ) ifTrue:[ STSAPILicenseListStoreRL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIResultListWithSingleObject subclass: 'STSAPILicenseOptionListStoreRL'
	instVarNames: #(options  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILicenseOptionListStoreRL includesCategory: eachName ) ifTrue:[ STSAPILicenseOptionListStoreRL removeCategory: eachName ].
( STSAPILicenseOptionListStoreRL class includesCategory: eachName ) ifTrue:[ STSAPILicenseOptionListStoreRL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIResultListWithSingleObject subclass: 'STSAPILogEntryListStoreRL'
	instVarNames: #(entries  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILogEntryListStoreRL includesCategory: eachName ) ifTrue:[ STSAPILogEntryListStoreRL removeCategory: eachName ].
( STSAPILogEntryListStoreRL class includesCategory: eachName ) ifTrue:[ STSAPILogEntryListStoreRL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIResultListWithSingleObject subclass: 'STSAPIUserListStoreRL'
	instVarNames: #(users  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIUserListStoreRL includesCategory: eachName ) ifTrue:[ STSAPIUserListStoreRL removeCategory: eachName ].
( STSAPIUserListStoreRL class includesCategory: eachName ) ifTrue:[ STSAPIUserListStoreRL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIResultListWithSingleObject subclass: 'STSAPICustomerListStoreRL'
	instVarNames: #(customers  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPICustomerListStoreRL includesCategory: eachName ) ifTrue:[ STSAPICustomerListStoreRL removeCategory: eachName ].
( STSAPICustomerListStoreRL class includesCategory: eachName ) ifTrue:[ STSAPICustomerListStoreRL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIResultListWithSingleObject subclass: 'STSAPIProductListStoreRL'
	instVarNames: #(products  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIProductListStoreRL includesCategory: eachName ) ifTrue:[ STSAPIProductListStoreRL removeCategory: eachName ].
( STSAPIProductListStoreRL class includesCategory: eachName ) ifTrue:[ STSAPIProductListStoreRL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIResultListWithSingleObject subclass: 'STSAPISessionListStoreRL'
	instVarNames: #(sessions  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPISessionListStoreRL includesCategory: eachName ) ifTrue:[ STSAPISessionListStoreRL removeCategory: eachName ].
( STSAPISessionListStoreRL class includesCategory: eachName ) ifTrue:[ STSAPISessionListStoreRL class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIGeneralResult
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIGeneralObject subclass: 'STSAPIObjectWithIDs'
	instVarNames: #(syscid gop sysrev  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIObjectWithIDs includesCategory: eachName ) ifTrue:[ STSAPIObjectWithIDs removeCategory: eachName ].
( STSAPIObjectWithIDs class includesCategory: eachName ) ifTrue:[ STSAPIObjectWithIDs class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'gop') ifTrue:[ ^'getGop' ].
	(apiPropertyName = 'sysrev') ifTrue:[ ^'getSysrev' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
doit
STSAPIObjectWithIDs subclass: 'STSAPICustomer'
	instVarNames: #(name  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPICustomer includesCategory: eachName ) ifTrue:[ STSAPICustomer removeCategory: eachName ].
( STSAPICustomer class includesCategory: eachName ) ifTrue:[ STSAPICustomer class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomer
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'getName' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomer
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPICustomer
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIObjectWithIDs subclass: 'STSAPILicense'
	instVarNames: #(customerGop validTo productGop key description createdTS  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILicense includesCategory: eachName ) ifTrue:[ STSAPILicense removeCategory: eachName ].
( STSAPILicense class includesCategory: eachName ) ifTrue:[ STSAPILicense class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicense
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'customerGop') ifTrue:[ ^'getCustomerGop' ].
	(apiPropertyName = 'validTo') ifTrue:[ ^'getValidTo' ].
	(apiPropertyName = 'productGop') ifTrue:[ ^'getProductGop' ].
	(apiPropertyName = 'key') ifTrue:[ ^'getKey' ].
	(apiPropertyName = 'description') ifTrue:[ ^'getDescription' ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^'getCreatedTS' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicense
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'validTo') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILicense
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIObjectWithIDs subclass: 'STSAPILicenseOption'
	instVarNames: #(name value licenseGop  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILicenseOption includesCategory: eachName ) ifTrue:[ STSAPILicenseOption removeCategory: eachName ].
( STSAPILicenseOption class includesCategory: eachName ) ifTrue:[ STSAPILicenseOption class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOption
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'getName' ].
	(apiPropertyName = 'value') ifTrue:[ ^'getValue' ].
	(apiPropertyName = 'licenseGop') ifTrue:[ ^'getLicenseGop' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOption
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILicenseOption
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIObjectWithIDs subclass: 'STSAPIApplicationSession'
	instVarNames: #(lastActivity defaultTimeout expiration createdTS currentLocale  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIApplicationSession includesCategory: eachName ) ifTrue:[ STSAPIApplicationSession removeCategory: eachName ].
( STSAPIApplicationSession class includesCategory: eachName ) ifTrue:[ STSAPIApplicationSession class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'lastActivity') ifTrue:[ ^'getLastActivity' ].
	(apiPropertyName = 'defaultTimeout') ifTrue:[ ^'getDefaultTimeout' ].
	(apiPropertyName = 'expiration') ifTrue:[ ^'getExpiration' ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^'getCreatedTS' ].
	(apiPropertyName = 'currentLocale') ifTrue:[ ^'getCurrentLocale' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'lastActivity') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].
	(apiPropertyName = 'expiration') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIApplicationSession
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIObjectWithIDs subclass: 'STSAPIProduct'
	instVarNames: #(name customerGop productType  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIProduct includesCategory: eachName ) ifTrue:[ STSAPIProduct removeCategory: eachName ].
( STSAPIProduct class includesCategory: eachName ) ifTrue:[ STSAPIProduct class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProduct
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'getName' ].
	(apiPropertyName = 'customerGop') ifTrue:[ ^'getCustomerGop' ].
	(apiPropertyName = 'productType') ifTrue:[ ^'getProductType' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProduct
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'productType') ifTrue:[ ^[ :each | STSEnumProductDefinition stringToValue: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIProduct
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIObjectWithIDs subclass: 'STSAPILogEntries'
	instVarNames: #(createdTS txt creator  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPILogEntries includesCategory: eachName ) ifTrue:[ STSAPILogEntries removeCategory: eachName ].
( STSAPILogEntries class includesCategory: eachName ) ifTrue:[ STSAPILogEntries class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntries
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'createdTS') ifTrue:[ ^'getCreatedTS' ].
	(apiPropertyName = 'txt') ifTrue:[ ^'getTxt' ].
	(apiPropertyName = 'creator') ifTrue:[ ^'getCreator' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntries
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'createdTS') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPILogEntries
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSAPIObjectWithIDs subclass: 'STSAPIApplicationUser'
	instVarNames: #(role password login  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIApplicationUser includesCategory: eachName ) ifTrue:[ STSAPIApplicationUser removeCategory: eachName ].
( STSAPIApplicationUser class includesCategory: eachName ) ifTrue:[ STSAPIApplicationUser class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'role') ifTrue:[ ^'getRole' ].
	(apiPropertyName = 'password') ifTrue:[ ^'getPassword' ].
	(apiPropertyName = 'login') ifTrue:[ ^'getLogin' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'role') ifTrue:[ ^[ :each | STSUserRole stringToValue: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIApplicationUser
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIGeneralObject
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
PUMGeneralDomainObject subclass: 'STSGeneralDomain'
	instVarNames: #(sysrev logEntries  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSGeneralDomain includesCategory: eachName ) ifTrue:[ STSGeneralDomain removeCategory: eachName ].
( STSGeneralDomain class includesCategory: eachName ) ifTrue:[ STSGeneralDomain class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSGeneralDomain
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^[ :each | each ] 

%
doit
STSGeneralDomain subclass: 'STSApplicationSession'
	instVarNames: #(defaultTimeout currentLocale createdTS lastActivity expiration applicationUser  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSApplicationSession includesCategory: eachName ) ifTrue:[ STSApplicationSession removeCategory: eachName ].
( STSApplicationSession class includesCategory: eachName ) ifTrue:[ STSApplicationSession class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSApplicationSession
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSApplicationSession
newInitializedApplicationUser: aSTSApplicationUser0 

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		setApplicationUser: aSTSApplicationUser0;
		yourself
%
doit
STSGeneralDomain subclass: 'STSLicense'
	instVarNames: #(description validTo createdTS options key product  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSLicense includesCategory: eachName ) ifTrue:[ STSLicense removeCategory: eachName ].
( STSLicense class includesCategory: eachName ) ifTrue:[ STSLicense class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLicense
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSLicense
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSGeneralDomain subclass: 'STSProduct'
	instVarNames: #(customer name license productType  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSProduct includesCategory: eachName ) ifTrue:[ STSProduct removeCategory: eachName ].
( STSProduct class includesCategory: eachName ) ifTrue:[ STSProduct class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSProduct
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSProduct
newInitializedCustomer: aSTSCustomer0 

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		setCustomer: aSTSCustomer0;
		yourself
%
doit
STSGeneralDomain subclass: 'STSApplicationUser'
	instVarNames: #(login password role  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSApplicationUser includesCategory: eachName ) ifTrue:[ STSApplicationUser removeCategory: eachName ].
( STSApplicationUser class includesCategory: eachName ) ifTrue:[ STSApplicationUser class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSApplicationUser
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSApplicationUser
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSGeneralDomain subclass: 'STSLogEntries'
	instVarNames: #(domObject createdTS txt creator  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSLogEntries includesCategory: eachName ) ifTrue:[ STSLogEntries removeCategory: eachName ].
( STSLogEntries class includesCategory: eachName ) ifTrue:[ STSLogEntries class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLogEntries
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSLogEntries
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSGeneralDomain subclass: 'STSCustomer'
	instVarNames: #(name products  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSCustomer includesCategory: eachName ) ifTrue:[ STSCustomer removeCategory: eachName ].
( STSCustomer class includesCategory: eachName ) ifTrue:[ STSCustomer class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSCustomer
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSCustomer
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSGeneralDomain subclass: 'STSLicenseOption'
	instVarNames: #(name value license  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSLicenseOption includesCategory: eachName ) ifTrue:[ STSLicenseOption removeCategory: eachName ].
( STSLicenseOption class includesCategory: eachName ) ifTrue:[ STSLicenseOption class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLicenseOption
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSLicenseOption
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
STSGeneralDomain subclass: 'STSUsageMessage'
	instVarNames: #(content accepted handled  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSUsageMessage includesCategory: eachName ) ifTrue:[ STSUsageMessage removeCategory: eachName ].
( STSUsageMessage class includesCategory: eachName ) ifTrue:[ STSUsageMessage class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSUsageMessage
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSUsageMessage
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSGeneralDomain
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
doit
PUMGeneralProjectClass subclass: 'STSProject'
	instVarNames: #(applicationSession applicationUser sessionTimeoutInMS debugMode unhandledUsageMessages  )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSProject includesCategory: eachName ) ifTrue:[ STSProject removeCategory: eachName ].
( STSProject class includesCategory: eachName ) ifTrue:[ STSProject class removeCategory: eachName ]
].

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSProject
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSProject
newInitialized

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self new 
		yourself
%
category: 'model-support'
set compile_env: 0
classmethod: STSProject
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
root

	^1
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
viewer

	^2
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
calculator

	^4
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
api

	^8
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
administrator

	^16
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
none

	^0
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
valueToString: aParameter

	aParameter = self root ifTrue:[ ^ 'root' ].
	aParameter = self viewer ifTrue:[ ^ 'viewer' ].
	aParameter = self calculator ifTrue:[ ^ 'calculator' ].
	aParameter = self api ifTrue:[ ^ 'api' ].
	aParameter = self administrator ifTrue:[ ^ 'administrator' ].
	aParameter = self none ifTrue:[ ^ 'none' ].

	^nil
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
valueToManyString: aParameter
	| writeStream stringRepresentation needDelimiter |

	writeStream := WriteStream on: String new.
	needDelimiter := false.
	self allValues keysAndValuesDo: [ :key :value | (aParameter bitAnd: value) ~= 0  ifTrue:[ needDelimiter ifTrue:[  writeStream nextPut: $| ]. writeStream nextPutAll:  key. needDelimiter := true ]].
	stringRepresentation := writeStream contents.
	^stringRepresentation isNil ifTrue:[ nil ] ifFalse:[ stringRepresentation ]
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
stringToValue: ns
	ns = 'root' ifTrue:[ ^self root ].
	ns = 'viewer' ifTrue:[ ^self viewer ].
	ns = 'calculator' ifTrue:[ ^self calculator ].
	ns = 'api' ifTrue:[ ^self api ].
	ns = 'administrator' ifTrue:[ ^self administrator ].
	ns = 'none' ifTrue:[ ^self none ].
	^nil
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
stringToMultiValue: ns
	| result singleStringValues allValues |

	singleStringValues := ns subStrings: $|.
	result := 0.
	allValues :=  self allValues.
	singleStringValues do: [ :eachString | | temp | (temp := allValues at: eachString ifAbsent:[ nil ]) isNil ifFalse:[ result := result + temp ]].
	 ^result.
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSUserRole
allValues

	^Dictionary new
		at: 'root' put: self root;
		at: 'viewer' put: self viewer;
		at: 'calculator' put: self calculator;
		at: 'api' put: self api;
		at: 'administrator' put: self administrator;
		at: 'none' put: self none;
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumProductDefinition
unkown

	^0
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumProductDefinition
gesscati

	^1
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumProductDefinition
valueToString: aParameter

	aParameter = self unkown ifTrue:[ ^ 'unkown' ].
	aParameter = self gesscati ifTrue:[ ^ 'gesscati' ].

	^nil
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumProductDefinition
valueToManyString: aParameter
	| writeStream stringRepresentation needDelimiter |

	writeStream := WriteStream on: String new.
	needDelimiter := false.
	self allValues keysAndValuesDo: [ :key :value | (aParameter bitAnd: value) ~= 0  ifTrue:[ needDelimiter ifTrue:[  writeStream nextPut: $| ]. writeStream nextPutAll:  key. needDelimiter := true ]].
	stringRepresentation := writeStream contents.
	^stringRepresentation isNil ifTrue:[ nil ] ifFalse:[ stringRepresentation ]
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumProductDefinition
stringToValue: ns
	ns = 'unkown' ifTrue:[ ^self unkown ].
	ns = 'gesscati' ifTrue:[ ^self gesscati ].
	^nil
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumProductDefinition
stringToMultiValue: ns
	| result singleStringValues allValues |

	singleStringValues := ns subStrings: $|.
	result := 0.
	allValues :=  self allValues.
	singleStringValues do: [ :eachString | | temp | (temp := allValues at: eachString ifAbsent:[ nil ]) isNil ifFalse:[ result := result + temp ]].
	 ^result.
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumProductDefinition
allValues

	^Dictionary new
		at: 'unkown' put: self unkown;
		at: 'gesscati' put: self gesscati;
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeWrongUserOrLoginName

	^10000
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeParameterNotDefined

	^10001
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeAccessDenied

	^10002
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeSearchObjectNotFound

	^10003
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeSearchObjectWrongClass

	^10004
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeGeneralError

	^10005
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeParameterWrongValue

	^10006
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeMethodNotImplemented

	^10007
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
errCodeRevisionConflict

	^10008
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
valueToString: aParameter

	aParameter = self errCodeWrongUserOrLoginName ifTrue:[ ^ 'errCodeWrongUserOrLoginName' ].
	aParameter = self errCodeParameterNotDefined ifTrue:[ ^ 'errCodeParameterNotDefined' ].
	aParameter = self errCodeAccessDenied ifTrue:[ ^ 'errCodeAccessDenied' ].
	aParameter = self errCodeSearchObjectNotFound ifTrue:[ ^ 'errCodeSearchObjectNotFound' ].
	aParameter = self errCodeSearchObjectWrongClass ifTrue:[ ^ 'errCodeSearchObjectWrongClass' ].
	aParameter = self errCodeGeneralError ifTrue:[ ^ 'errCodeGeneralError' ].
	aParameter = self errCodeParameterWrongValue ifTrue:[ ^ 'errCodeParameterWrongValue' ].
	aParameter = self errCodeMethodNotImplemented ifTrue:[ ^ 'errCodeMethodNotImplemented' ].
	aParameter = self errCodeRevisionConflict ifTrue:[ ^ 'errCodeRevisionConflict' ].

	^nil
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
valueToManyString: aParameter
	| writeStream stringRepresentation needDelimiter |

	writeStream := WriteStream on: String new.
	needDelimiter := false.
	self allValues keysAndValuesDo: [ :key :value | (aParameter bitAnd: value) ~= 0  ifTrue:[ needDelimiter ifTrue:[  writeStream nextPut: $| ]. writeStream nextPutAll:  key. needDelimiter := true ]].
	stringRepresentation := writeStream contents.
	^stringRepresentation isNil ifTrue:[ nil ] ifFalse:[ stringRepresentation ]
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
stringToValue: ns
	ns = 'errCodeWrongUserOrLoginName' ifTrue:[ ^self errCodeWrongUserOrLoginName ].
	ns = 'errCodeParameterNotDefined' ifTrue:[ ^self errCodeParameterNotDefined ].
	ns = 'errCodeAccessDenied' ifTrue:[ ^self errCodeAccessDenied ].
	ns = 'errCodeSearchObjectNotFound' ifTrue:[ ^self errCodeSearchObjectNotFound ].
	ns = 'errCodeSearchObjectWrongClass' ifTrue:[ ^self errCodeSearchObjectWrongClass ].
	ns = 'errCodeGeneralError' ifTrue:[ ^self errCodeGeneralError ].
	ns = 'errCodeParameterWrongValue' ifTrue:[ ^self errCodeParameterWrongValue ].
	ns = 'errCodeMethodNotImplemented' ifTrue:[ ^self errCodeMethodNotImplemented ].
	ns = 'errCodeRevisionConflict' ifTrue:[ ^self errCodeRevisionConflict ].
	^nil
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
stringToMultiValue: ns
	| result singleStringValues allValues |

	singleStringValues := ns subStrings: $|.
	result := 0.
	allValues :=  self allValues.
	singleStringValues do: [ :eachString | | temp | (temp := allValues at: eachString ifAbsent:[ nil ]) isNil ifFalse:[ result := result + temp ]].
	 ^result.
%
category: 'model-public-attributes'
set compile_env: 0
classmethod: STSEnumErrorDefinition
allValues

	^Dictionary new
		at: 'errCodeWrongUserOrLoginName' put: self errCodeWrongUserOrLoginName;
		at: 'errCodeParameterNotDefined' put: self errCodeParameterNotDefined;
		at: 'errCodeAccessDenied' put: self errCodeAccessDenied;
		at: 'errCodeSearchObjectNotFound' put: self errCodeSearchObjectNotFound;
		at: 'errCodeSearchObjectWrongClass' put: self errCodeSearchObjectWrongClass;
		at: 'errCodeGeneralError' put: self errCodeGeneralError;
		at: 'errCodeParameterWrongValue' put: self errCodeParameterWrongValue;
		at: 'errCodeMethodNotImplemented' put: self errCodeMethodNotImplemented;
		at: 'errCodeRevisionConflict' put: self errCodeRevisionConflict;
		yourself
%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeWrongUserOrLoginNameMessage: currentLocale 

	^STSAPIError withCode: 10000 template: ((self errorDefinition: 10000 locale: currentLocale) text) stringArgs: nil
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeWrongUserOrLoginNameThrowSignal: aMSKRestCallOptions 

	(self errCodeWrongUserOrLoginNameApplicationError: aMSKRestCallOptions ) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeWrongUserOrLoginNameApplicationError: aMSKRestCallOptions 

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeWrongUserOrLoginNameAnswer: aMSKRestCallOptions ) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeWrongUserOrLoginNameAnswer: aMSKRestCallOptions 

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeWrongUserOrLoginNameMessage:  aMSKRestCallOptions getCurrentLocale )))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeParameterNotDefinedMessage: currentLocale  with1Args: stringArguments

	^STSAPIError withCode: 10001 template: ((self errorDefinition: 10001 locale: currentLocale) text) stringArgs: stringArguments
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeParameterNotDefinedThrowSignal: aMSKRestCallOptions  with1Args: stringArguments

	(self errCodeParameterNotDefinedApplicationError: aMSKRestCallOptions   with1Args: stringArguments) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeParameterNotDefinedApplicationError: aMSKRestCallOptions  with1Args: stringArguments

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeParameterNotDefinedAnswer: aMSKRestCallOptions  with1Args: stringArguments) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeParameterNotDefinedAnswer: aMSKRestCallOptions  with1Args: stringArguments

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeParameterNotDefinedMessage:  aMSKRestCallOptions getCurrentLocale  with1Args: stringArguments)))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeAccessDeniedMessage: currentLocale 

	^STSAPIError withCode: 10002 template: ((self errorDefinition: 10002 locale: currentLocale) text) stringArgs: nil
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeAccessDeniedThrowSignal: aMSKRestCallOptions 

	(self errCodeAccessDeniedApplicationError: aMSKRestCallOptions ) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeAccessDeniedApplicationError: aMSKRestCallOptions 

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeAccessDeniedAnswer: aMSKRestCallOptions ) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeAccessDeniedAnswer: aMSKRestCallOptions 

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeAccessDeniedMessage:  aMSKRestCallOptions getCurrentLocale )))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeSearchObjectNotFoundMessage: currentLocale 

	^STSAPIError withCode: 10003 template: ((self errorDefinition: 10003 locale: currentLocale) text) stringArgs: nil
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeSearchObjectNotFoundThrowSignal: aMSKRestCallOptions 

	(self errCodeSearchObjectNotFoundApplicationError: aMSKRestCallOptions ) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeSearchObjectNotFoundApplicationError: aMSKRestCallOptions 

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeSearchObjectNotFoundAnswer: aMSKRestCallOptions ) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeSearchObjectNotFoundAnswer: aMSKRestCallOptions 

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeSearchObjectNotFoundMessage:  aMSKRestCallOptions getCurrentLocale )))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeSearchObjectWrongClassMessage: currentLocale  with1Args: stringArguments

	^STSAPIError withCode: 10004 template: ((self errorDefinition: 10004 locale: currentLocale) text) stringArgs: stringArguments
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeSearchObjectWrongClassThrowSignal: aMSKRestCallOptions  with1Args: stringArguments

	(self errCodeSearchObjectWrongClassApplicationError: aMSKRestCallOptions   with1Args: stringArguments) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeSearchObjectWrongClassApplicationError: aMSKRestCallOptions  with1Args: stringArguments

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeSearchObjectWrongClassAnswer: aMSKRestCallOptions  with1Args: stringArguments) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeSearchObjectWrongClassAnswer: aMSKRestCallOptions  with1Args: stringArguments

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeSearchObjectWrongClassMessage:  aMSKRestCallOptions getCurrentLocale  with1Args: stringArguments)))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeGeneralErrorMessage: currentLocale  with1Args: stringArguments

	^STSAPIError withCode: 10005 template: ((self errorDefinition: 10005 locale: currentLocale) text) stringArgs: stringArguments
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeGeneralErrorThrowSignal: aMSKRestCallOptions  with1Args: stringArguments

	(self errCodeGeneralErrorApplicationError: aMSKRestCallOptions   with1Args: stringArguments) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeGeneralErrorApplicationError: aMSKRestCallOptions  with1Args: stringArguments

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeGeneralErrorAnswer: aMSKRestCallOptions  with1Args: stringArguments) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeGeneralErrorAnswer: aMSKRestCallOptions  with1Args: stringArguments

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeGeneralErrorMessage:  aMSKRestCallOptions getCurrentLocale  with1Args: stringArguments)))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeParameterWrongValueMessage: currentLocale  with1Args: stringArguments

	^STSAPIError withCode: 10006 template: ((self errorDefinition: 10006 locale: currentLocale) text) stringArgs: stringArguments
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeParameterWrongValueThrowSignal: aMSKRestCallOptions  with1Args: stringArguments

	(self errCodeParameterWrongValueApplicationError: aMSKRestCallOptions   with1Args: stringArguments) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeParameterWrongValueApplicationError: aMSKRestCallOptions  with1Args: stringArguments

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeParameterWrongValueAnswer: aMSKRestCallOptions  with1Args: stringArguments) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeParameterWrongValueAnswer: aMSKRestCallOptions  with1Args: stringArguments

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeParameterWrongValueMessage:  aMSKRestCallOptions getCurrentLocale  with1Args: stringArguments)))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeMethodNotImplementedMessage: currentLocale  with1Args: stringArguments

	^STSAPIError withCode: 10007 template: ((self errorDefinition: 10007 locale: currentLocale) text) stringArgs: stringArguments
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeMethodNotImplementedThrowSignal: aMSKRestCallOptions  with1Args: stringArguments

	(self errCodeMethodNotImplementedApplicationError: aMSKRestCallOptions   with1Args: stringArguments) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeMethodNotImplementedApplicationError: aMSKRestCallOptions  with1Args: stringArguments

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeMethodNotImplementedAnswer: aMSKRestCallOptions  with1Args: stringArguments) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeMethodNotImplementedAnswer: aMSKRestCallOptions  with1Args: stringArguments

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeMethodNotImplementedMessage:  aMSKRestCallOptions getCurrentLocale  with1Args: stringArguments)))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeRevisionConflictMessage: currentLocale 

	^STSAPIError withCode: 10008 template: ((self errorDefinition: 10008 locale: currentLocale) text) stringArgs: nil
%
category: 'model-public-signal-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeRevisionConflictThrowSignal: aMSKRestCallOptions 

	(self errCodeRevisionConflictApplicationError: aMSKRestCallOptions ) signal 
%
category: 'model-public-apperror-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeRevisionConflictApplicationError: aMSKRestCallOptions 

	^MSKRESTCallApplicationError new mskRESTAPIAnswer: (self errCodeRevisionConflictAnswer: aMSKRestCallOptions ) ; yourself
%
category: 'model-public-answer-methods'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
errCodeRevisionConflictAnswer: aMSKRestCallOptions 

	^(aMSKRestCallOptions restCallInstance class restAnswerClass
		okRequestFor: aMSKRestCallOptions restCallInstance
		result:( aMSKRestCallOptions restCallInstance class restBaseErrorClass with: (self errCodeRevisionConflictMessage:  aMSKRestCallOptions getCurrentLocale )))
		failureWithNoCommitCall ;
		yourself

%
category: 'model-public-error-constants'
set compile_env: 0
classmethod: STSEnumErrorDefinitionLocaleErrorDefinition
createUSErrorCodes: aMSKRESTLocaleErrorDefinition

	super createUSErrorCodes: aMSKRESTLocaleErrorDefinition.

	^aMSKRESTLocaleErrorDefinition
		add: (MSKRESTErrCode code: 10000 text: 'Unknown login or password') ;
		add: (MSKRESTErrCode code: 10001 text: 'Parameter "<1s>" not defined') ;
		add: (MSKRESTErrCode code: 10002 text: 'Access Denied') ;
		add: (MSKRESTErrCode code: 10003 text: 'Object not found') ;
		add: (MSKRESTErrCode code: 10004 text: 'Object found has wrong class "<1s>"') ;
		add: (MSKRESTErrCode code: 10005 text: 'Error: "<1s>"') ;
		add: (MSKRESTErrCode code: 10006 text: 'Parameter "<1s>" has wrong value') ;
		add: (MSKRESTErrCode code: 10007 text: 'Method "<1s>" not yet implemented') ;
		add: (MSKRESTErrCode code: 10008 text: 'Revision conflict') ;
		yourself

%
doIt
STSEnumErrorDefinitionLocaleErrorDefinition initialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIProductListStoreRL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <products> with value from modeller <>"
	products := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIProductListStoreRL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProductListStoreRL
getProducts
	" ^<Set of: STSAPIProduct> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^products
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPIProductListStoreRL
mcAddProducts: aSTSAPIProduct otherSide: otherSideFlagBoolean
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPIProduct throwMSKNullParameterException:'STSAPIProductListStoreRL>mcAddProducts: %1 otherSide: %2'.

	products add: aSTSAPIProduct.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPIProductListStoreRL
addProducts: aSTSAPIProduct
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddProducts: aSTSAPIProduct otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPIProductListStoreRL
mcRemoveProducts: aSTSAPIProduct otherSide: otherSideFlagBoolean
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPIProduct throwMSKNullParameterException:'STSAPIProductListStoreRL>mcRemoveProducts: %1 otherSide: %2'.

	(products remove: aSTSAPIProduct ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPIProductListStoreRL
removeProducts: aSTSAPIProduct
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveProducts: aSTSAPIProduct otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPIProductListStoreRL
_getProducts
	" ^<Set of: STSAPIProduct> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^products
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPIProductListStoreRL
mcSetProducts: aProducts otherSide: otherSideFlagBoolean
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aProducts == products) ifTrue:[ ^self ].

	products := aProducts. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProductListStoreRL
setProducts: aSTSAPIProduct
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProductListStoreRL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetProducts: aSTSAPIProduct otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
withAPIList: returnedListOfObjects total: totalListOfObjects

		^(super withAPITotalList: totalListOfObjects)
			setProducts: returnedListOfObjects ;
			yourself

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProductListStoreRL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProductListStoreRL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProductListStoreRL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	(mapping
		mapProperty: #products
		getter: [ :object | object getProducts ]
		setter: [ :object :value | object setProducts: value ]) valueSchema: #ListOfSTSAPIProduct.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].
	mapper for: STSAPIProduct do: [ :mapping | 
		STSAPIProduct pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIProduct customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIProduct
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		addProperty: ((MSKJSONProperty named: self getProductsSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPIProduct pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getTotalESAN

	^'STSAPIProductListStoreRLTotal'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getTotalSAN

	^'total'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getSuccessESAN

	^'STSAPIProductListStoreRLSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getErrorESAN

	^'STSAPIProductListStoreRLError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getProductsESAN

	^'STSAPIProductListStoreRLProducts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getProductsSAN

	^'products'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgssESAN

	^'STSAPIProductListStoreRLDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgapiESAN

	^'STSAPIProductListStoreRLDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgmsESAN

	^'STSAPIProductListStoreRLDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbglocESAN

	^'STSAPIProductListStoreRLDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbtsESAN

	^'STSAPIProductListStoreRLDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getTotalSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTotalSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStoreRL
getTotalESAP

	^(self getTotalSAP)
		name: self getTotalESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSApplicationSession
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <defaultTimeout> with value from modeller <1800000>"
	defaultTimeout := 1800000.
	"Attribute named <currentLocale> with value from modeller <>"
	currentLocale := String new.
	"Attribute named <createdTS> with value from modeller <>"
	createdTS := DateAndTime now asUTC.
	"Attribute named <lastActivity> with value from modeller <>"
	lastActivity := DateAndTime now asUTC.
	"Attribute named <expiration> with value from modeller <>"
	expiration := DateAndTime now asUTC.
	"Attribute named <applicationUser> with value from modeller <>"
	applicationUser := nil.
%
category: 'model-initialize'
set compile_env: 0
method: STSApplicationSession
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	defaultTimeout := nil.
	currentLocale := nil.
	createdTS := nil.
	lastActivity := nil.
	expiration := nil.
	applicationUser := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSApplicationSession
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
getDefaultTimeout
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^defaultTimeout
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
setDefaultTimeout: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSApplicationSession>setDefaultTimeout:'.
	(anInteger = defaultTimeout) ifTrue:[ ^self ].
	defaultTimeout := anInteger ifNotNil:[ anInteger asInteger  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
getCurrentLocale
	" ^<String> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^currentLocale
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
setCurrentLocale: aString
	" 'aString' is assumed to be instance of class: 'String' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	aString throwMSKNullParameterException:'STSApplicationSession>setCurrentLocale:'.
	_newValue := (aString == nil) ifTrue:[ nil ] ifFalse:[ aString asString ].
	(_newValue = currentLocale) ifTrue:[ ^self ].
	currentLocale := _newValue .
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
getCreatedTS
	" ^<DateAndTime> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^createdTS
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
setCreatedTS: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aDateAndTime throwMSKNullParameterException:'STSApplicationSession>setCreatedTS:'.
	(aDateAndTime = createdTS) ifTrue:[ ^self ].
	createdTS := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
getLastActivity
	" ^<DateAndTime> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^lastActivity
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
setLastActivity: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aDateAndTime throwMSKNullParameterException:'STSApplicationSession>setLastActivity:'.
	(aDateAndTime = lastActivity) ifTrue:[ ^self ].
	lastActivity := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
getExpiration
	" ^<DateAndTime> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^expiration
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
setExpiration: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aDateAndTime throwMSKNullParameterException:'STSApplicationSession>setExpiration:'.
	(aDateAndTime = expiration) ifTrue:[ ^self ].
	expiration := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
getApplicationUser
	" ^<STSApplicationUser> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^applicationUser
%
category: 'model-private-attributes'
set compile_env: 0
method: STSApplicationSession
mcSetApplicationUser: aApplicationUser otherSide: otherSideFlagBoolean
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aApplicationUser == applicationUser) ifTrue:[ ^self ].

	applicationUser := aApplicationUser. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationSession
setApplicationUser: aSTSApplicationUser
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetApplicationUser: aSTSApplicationUser otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSApplicationSession
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSApplicationSession
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'defaultTimeout') ifTrue:[ ^'each.defaultTimeout' ].
	(apiPropertyName = 'currentLocale') ifTrue:[ ^'each.currentLocale' ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^'each.createdTS' ].
	(apiPropertyName = 'lastActivity') ifTrue:[ ^'each.lastActivity' ].
	(apiPropertyName = 'expiration') ifTrue:[ ^'each.expiration' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSApplicationSession
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSApplicationSession
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSApplicationSession
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSApplicationSession
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'cookie-support'
set compile_env: 0
classmethod: STSApplicationSession
cookieName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'sts'

%
category: 'cookie-support'
set compile_env: 0
classmethod: STSApplicationSession
cookiePath

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'/'

%
category: 'cookie-support'
set compile_env: 0
method: STSApplicationSession
sessionCookie

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^(ZnCookie name: self class cookieName value: self getGop asString)
		 path: self class cookiePath ;
		 expires: (self getExpiration asRFC1123CookieString)  ;
		 yourself
%
category: 'framework-helpers'
set compile_env: 0
method: STSApplicationSession
updateTimeout

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self setLastActivity: DateAndTime now asUTC.
	self getDefaultTimeout > 0
		ifTrue:[ self setExpiration: (self getLastActivity + (Duration milliSeconds: self getDefaultTimeout)) ]
		ifFalse:[ self setExpiration: (self getLastActivity + (Duration days: (365*10)) ) ]

%
category: 'framework-helpers'
set compile_env: 0
method: STSApplicationSession
hasExpired

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^self hasExpiredAt: DateAndTime now

%
category: 'framework-helpers'
set compile_env: 0
method: STSApplicationSession
hasExpiredAt: aDateAndTime

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^(self getDefaultTimeout > 0) and:[ self getExpiration<= aDateAndTime ]

%
category: 'framework-migration-support'
set compile_env: 0
method: STSApplicationSession
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'defaultTimeout') ifFalse:[ defaultTimeout := 1800000 ].
	(oldNames includes: #'currentLocale') ifFalse:[ currentLocale := String new ].
	(oldNames includes: #'createdTS') ifFalse:[ createdTS := DateAndTime now asUTC ].
	(oldNames includes: #'lastActivity') ifFalse:[ lastActivity := DateAndTime now asUTC ].
	(oldNames includes: #'expiration') ifFalse:[ expiration := DateAndTime now asUTC ].
	(oldNames includes: #'applicationUser') ifFalse:[ applicationUser := nil ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIError
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <code> with value from modeller <>"
	code := UndefinedObject.
	"Attribute named <text> with value from modeller <>"
	text := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIError
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	code := nil.
	text := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIError
getCode
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^code
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIError
setCode: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSAPIError>setCode:'.
	(anInteger = code) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'code';
			className: 'STSAPIError';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	code := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIError
getText
	" ^<String> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^text
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIError
setText: aString
	" 'aString' is assumed to be instance of class: 'String' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	aString throwMSKNullParameterException:'STSAPIError>setText:'.
	_newValue := (aString == nil) ifTrue:[ nil ] ifFalse:[ aString asString ].
	(_newValue = text) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'text';
			className: 'STSAPIError';
			expectedType:'String';
			receivedType: _newValue class name asString; 
			signal.
	].

	text := _newValue .
%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIError
withCode: anInteger text: aString

	^self withCode: anInteger template: aString stringArgs: nil

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIError
code: anInteger text: aString

	^self withCode: anInteger template: aString stringArgs: nil

%
category: 'model-instance-creation'
set compile_env: 0
classmethod: STSAPIError
withCode: anInteger template: templateString stringArgs: stringArray

	^self new initialize 
		setCode: anInteger ;
		setText: ( stringArray isNil ifTrue:[ templateString asUnicodeString ] ifFalse:[ (templateString expandMacrosWithArguments: stringArray) asUnicodeString ] ) ;
		setTextPattern: templateString asUnicodeString ;
		setPatternValues: (stringArray ifNil:[ Array new ]) ;
		yourself

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIError
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIError
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIError
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIError
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIError
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIError
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIError
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #code
		getter: [ :object | object getCode ]
		setter: [ :object :value | object setCode: value ].
	mapping
		mapProperty: #text
		getter: [ :object | object getText ]
		setter: [ :object :value | object setText: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIError
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #code
		getter: [ :object | object getCode ]
		setter: [ :object :value | object setCode: value ].
	mapping
		mapProperty: #text
		getter: [ :object | object getText ]
		setter: [ :object :value | object setText: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIError
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getCodeSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTextSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getCodeSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTextSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
getCodeESAN

	^'STSAPIErrorCode'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
getCodeSAN

	^'code'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
getTextESAN

	^'STSAPIErrorText'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
getTextSAN

	^'text'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
getCodeSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getCodeSAN;
		description: 'Framework Attribute. Numeric error code' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
getCodeESAP

	^(self getCodeSAP)
		name: self getCodeESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
getTextSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTextSAN;
		description: 'Framework Attribute. Textual error description' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIError
getTextESAP

	^(self getTextSAP)
		name: self getTextESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIGeneralParameterObjectList
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIGeneralParameterObjectList
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralParameterObjectList
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralParameterObjectList
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralParameterObjectList
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralParameterObjectList
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPISessionListStorePL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <sessions> with value from modeller <>"
	sessions := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPISessionListStorePL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPISessionListStorePL
getSessions
	" ^<Set of: STSAPIApplicationSession> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^sessions
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPISessionListStorePL
mcAddSessions: aSTSAPIApplicationSession otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPIApplicationSession throwMSKNullParameterException:'STSAPISessionListStorePL>mcAddSessions: %1 otherSide: %2'.

	sessions add: aSTSAPIApplicationSession.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPISessionListStorePL
addSessions: aSTSAPIApplicationSession
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddSessions: aSTSAPIApplicationSession otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPISessionListStorePL
mcRemoveSessions: aSTSAPIApplicationSession otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPIApplicationSession throwMSKNullParameterException:'STSAPISessionListStorePL>mcRemoveSessions: %1 otherSide: %2'.

	(sessions remove: aSTSAPIApplicationSession ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPISessionListStorePL
removeSessions: aSTSAPIApplicationSession
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveSessions: aSTSAPIApplicationSession otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPISessionListStorePL
_getSessions
	" ^<Set of: STSAPIApplicationSession> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^sessions
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPISessionListStorePL
mcSetSessions: aSessions otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aSessions == sessions) ifTrue:[ ^self ].

	sessions := aSessions. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPISessionListStorePL
setSessions: aSTSAPIApplicationSession
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPISessionListStorePL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetSessions: aSTSAPIApplicationSession otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPISessionListStorePL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionListStorePL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionListStorePL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionListStorePL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionListStorePL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionListStorePL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionListStorePL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(mapping
		mapProperty: #sessions
		getter: [ :object | object getSessions ]
		setter: [ :object :value | object setSessions: value ]) valueSchema: #ListOfSTSAPIApplicationSession.


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionListStorePL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIApplicationSession do: [ :mapping | 
		STSAPIApplicationSession pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIApplicationSession customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIApplicationSession
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStorePL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStorePL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStorePL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStorePL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSessionsSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPIApplicationSession pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStorePL
getSessionsESAN

	^'STSAPISessionListStorePLSessions'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStorePL
getSessionsSAN

	^'sessions'

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIGeneralResult
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <dbgapi> with value from modeller <>"
	dbgapi := UndefinedObject.
	"Attribute named <dbgloc> with value from modeller <>"
	dbgloc := UndefinedObject.
	"Attribute named <dbgss> with value from modeller <>"
	dbgss := UndefinedObject.
	"Attribute named <dbgms> with value from modeller <>"
	dbgms := UndefinedObject.
	"Attribute named <dbts> with value from modeller <now>"
	dbts := UndefinedObject.
	"Attribute named <success> with value from modeller <false>"
	success := UndefinedObject.
	"Attribute named <error> with value from modeller <>"
	error := nil.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIGeneralResult
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	dbgapi := nil.
	dbgloc := nil.
	dbgss := nil.
	dbgms := nil.
	dbts := nil.
	success := nil.
	error := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
getDbgapi
	" ^<String> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^dbgapi
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
setDbgapi: aString
	" 'aString' is assumed to be instance of class: 'String' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	aString throwMSKNullParameterException:'STSAPIGeneralResult>setDbgapi:'.
	_newValue := (aString == nil) ifTrue:[ nil ] ifFalse:[ aString asString ].
	(_newValue = dbgapi) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'dbgapi';
			className: 'STSAPIGeneralResult';
			expectedType:'String';
			receivedType: _newValue class name asString; 
			signal.
	].

	dbgapi := _newValue .
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
getDbgloc
	" ^<String> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^dbgloc
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
setDbgloc: aString
	" 'aString' is assumed to be instance of class: 'String' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	aString throwMSKNullParameterException:'STSAPIGeneralResult>setDbgloc:'.
	_newValue := (aString == nil) ifTrue:[ nil ] ifFalse:[ aString asString ].
	(_newValue = dbgloc) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'dbgloc';
			className: 'STSAPIGeneralResult';
			expectedType:'String';
			receivedType: _newValue class name asString; 
			signal.
	].

	dbgloc := _newValue .
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
getDbgss
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^dbgss
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
setDbgss: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSAPIGeneralResult>setDbgss:'.
	(anInteger = dbgss) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'dbgss';
			className: 'STSAPIGeneralResult';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	dbgss := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
getDbgms
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^dbgms
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
setDbgms: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSAPIGeneralResult>setDbgms:'.
	(anInteger = dbgms) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'dbgms';
			className: 'STSAPIGeneralResult';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	dbgms := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
getDbts
	" ^<DateAndTime> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^dbts
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
setDbts: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aDateAndTime throwMSKNullParameterException:'STSAPIGeneralResult>setDbts:'.
	(aDateAndTime = dbts) ifTrue:[ ^self ].

	(aDateAndTime notNil and:[ aDateAndTime pumIsTimestamp not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'dbts';
			className: 'STSAPIGeneralResult';
			expectedType:'DateAndTime';
			receivedType: aDateAndTime class name asString; 
			signal.
	].

	dbts := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
getSuccess
	" ^<Boolean> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^success
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
setSuccess: aBoolean
	" 'aBoolean' is assumed to be instance of class: 'Boolean' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aBoolean throwMSKNullParameterException:'STSAPIGeneralResult>setSuccess:'.
	(aBoolean = success) ifTrue:[ ^self ].

	(aBoolean notNil and:[ aBoolean pumIsBoolean not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'success';
			className: 'STSAPIGeneralResult';
			expectedType:'Boolean';
			receivedType: aBoolean class name asString; 
			signal.
	].

	success := aBoolean ifNotNil:[ aBoolean  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
getError
	" ^<STSAPIError> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^error
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPIGeneralResult
mcSetError: aError otherSide: otherSideFlagBoolean
	" 'aSTSAPIError' is assumed to be instance of class: 'STSAPIError' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aError == error) ifTrue:[ ^self ].

	error := aError. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIGeneralResult
setError: aSTSAPIError
	" 'aSTSAPIError' is assumed to be instance of class: 'STSAPIGeneralResult' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetError: aSTSAPIError otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIGeneralResult
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralResult
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralResult
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralResult
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPIGeneralResult
with: dataObject

	^self new initialize
		setData: (dataObject class = STSAPIError ifTrue:[ nil ] ifFalse:[ dataObject ]) ;
		setError: (dataObject class = STSAPIError ifTrue:[ dataObject ] ifFalse:[ nil ]) ;
		yourself

%
category: 'framework-definitions'
set compile_env: 0
method: STSAPIGeneralResult
setData: anObject

%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralResult
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralResult
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralResult
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getSuccessESAN

	^'STSAPIGeneralResultSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getErrorESAN

	^'STSAPIGeneralResultError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgssESAN

	^'STSAPIGeneralResultDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbglocESAN

	^'STSAPIGeneralResultDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbtsESAN

	^'STSAPIGeneralResultDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgapiESAN

	^'STSAPIGeneralResultDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgmsESAN

	^'STSAPIGeneralResultDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralResult
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRProductListStore
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRProductListStore
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIPRProductListStore
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRProductListStore
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRProductListStore
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRProductListStore
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRProductListStore
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRProductListStore
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRProductListStore
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getLimitESAN

	^'STSAPIPRProductListStoreLimit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getLimitSAN

	^'limit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getStartESAN

	^'STSAPIPRProductListStoreStart'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getStartSAN

	^'start'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getPageESAN

	^'STSAPIPRProductListStorePage'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getPageSAN

	^'page'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getGsqueryESAN

	^'STSAPIPRProductListStoreGsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getGsquerySAN

	^'gsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getSortESAN

	^'STSAPIPRProductListStoreSort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getSortSAN

	^'sort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getFilterESAN

	^'STSAPIPRProductListStoreFilter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getFilterSAN

	^'filter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getLimitSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLimitSAN;
		description: 'Framework Attribute. Answer the maximum number of objects in the returned list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getLimitESAP

	^(self getLimitSAP)
		name: self getLimitESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getStartSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getStartSAN;
		description: 'Framework Attribute. Returns the offset of the first element in the returned list within the total result list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getStartESAP

	^(self getStartSAP)
		name: self getStartESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getPageSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPageSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getPageESAP

	^(self getPageSAP)
		name: self getPageESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getGsquerySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGsquerySAN;
		description: 'When set, this helds a complete gsquery string' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getGsqueryESAP

	^(self getGsquerySAP)
		name: self getGsqueryESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getSortSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSortSAN;
		description: 'Sorting description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getSortESAP

	^(self getSortSAP)
		name: self getSortESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getFilterSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getFilterSAN;
		description: 'Filter description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRProductListStore
getFilterESAP

	^(self getFilterSAP)
		name: self getFilterESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSGeneralDomain
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <sysrev> with value from modeller <0>"
	sysrev := 0.
	"Attribute named <logEntries> with value from modeller <>"
	logEntries := IdentitySet new.
%
category: 'model-initialize'
set compile_env: 0
method: STSGeneralDomain
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	sysrev := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSGeneralDomain
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ Array new
%
category: 'model-public-attributes'
set compile_env: 0
method: STSGeneralDomain
getGop
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^self asOop
%
category: 'model-public-attributes'
set compile_env: 0
method: STSGeneralDomain
getSysrev
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^sysrev
%
category: 'model-public-attributes'
set compile_env: 0
method: STSGeneralDomain
setSysrev: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSGeneralDomain>setSysrev:'.
	(anInteger = sysrev) ifTrue:[ ^self ].
	sysrev := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-revision'
set compile_env: 0
method: STSGeneralDomain
_incrementRevision

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	sysrev := sysrev + 1.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSGeneralDomain
getLogEntries
	" ^<IdentitySet of: STSLogEntries> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^logEntries
%
category: 'model-public-testing'
set compile_env: 0
method: STSGeneralDomain
includesLogEntries: aSTSLogEntries
	" 'aSTSLogEntries' is assumed to be instance of class: 'STSLogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^(logEntries includesIdentical: aSTSLogEntries)

%
category: 'model-private-adding'
set compile_env: 0
method: STSGeneralDomain
mcAddLogEntries: aSTSLogEntries otherSide: otherSideFlagBoolean
	" 'aSTSLogEntries' is assumed to be instance of class: 'STSLogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSLogEntries throwMSKNullParameterException:'STSGeneralDomain>mcAddLogEntries: %1 otherSide: %2'.

	logEntries add: aSTSLogEntries.
	otherSideFlagBoolean ifTrue:[ aSTSLogEntries mcSetDomObject: self otherSide: false ].
%
category: 'model-public-adding'
set compile_env: 0
method: STSGeneralDomain
addLogEntries: aSTSLogEntries
	" 'aSTSLogEntries' is assumed to be instance of class: 'STSLogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddLogEntries: aSTSLogEntries otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSGeneralDomain
mcRemoveLogEntries: aSTSLogEntries otherSide: otherSideFlagBoolean
	" 'aSTSLogEntries' is assumed to be instance of class: 'STSLogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSLogEntries throwMSKNullParameterException:'STSGeneralDomain>mcRemoveLogEntries: %1 otherSide: %2'.

	(logEntries remove: aSTSLogEntries ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
	otherSideFlagBoolean ifTrue:[ aSTSLogEntries mcSetDomObject: nil otherSide: false ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSGeneralDomain
removeLogEntries: aSTSLogEntries
	" 'aSTSLogEntries' is assumed to be instance of class: 'STSLogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveLogEntries: aSTSLogEntries otherSide: true
%
category: 'model-public-searching'
set compile_env: 0
method: STSGeneralDomain
searchViaKeyLogEntries: keyValue


	^logEntries detect: [ :each | each  getGop =  keyValue] ifNone:[ nil ]. 
%
category: 'model-public-searching'
set compile_env: 0
method: STSGeneralDomain
searchLogEntries: anObject


	^self searchViaKeyLogEntries: anObject getGop
%
category: 'model-public-accessing'
set compile_env: 0
method: STSGeneralDomain
_getLogEntries
	" ^<IdentitySet of: STSLogEntries> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^logEntries
%
category: 'model-private-attributes'
set compile_env: 0
method: STSGeneralDomain
mcSetLogEntries: aLogEntries otherSide: otherSideFlagBoolean
	" 'aSTSLogEntries' is assumed to be instance of class: 'STSLogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aLogEntries == logEntries) ifTrue:[ ^self ].
	(otherSideFlagBoolean and:[ logEntries notNil ]) ifTrue:[ logEntries mcSetDomObject: nil otherSide: false ]. 

	logEntries := aLogEntries. 
	sysrev := sysrev + 1. 
	(otherSideFlagBoolean and:[ aLogEntries notNil ]) ifTrue:[ aLogEntries mcSetDomObject: self otherSide: false ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSGeneralDomain
setLogEntries: aSTSLogEntries
	" 'aSTSLogEntries' is assumed to be instance of class: 'STSGeneralDomain' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetLogEntries: aSTSLogEntries otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSGeneralDomain
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSGeneralDomain
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'gop') ifTrue:[ ^'each.gop' ].
	(apiPropertyName = 'sysrev') ifTrue:[ ^'each.sysrev' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSGeneralDomain
getDomainPropertyAccessorPathManual: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^nil 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSGeneralDomain
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^[ :each | each ] 

%
category: 'framework-indices'
set compile_env: 0
method: STSGeneralDomain
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSGeneralDomain
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSGeneralDomain
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSGeneralDomain
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'sysrev') ifFalse:[ sysrev := 0 ].
	(oldNames includes: #'logEntries') ifFalse:[ logEntries := IdentitySet new ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSApplicationUser
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <login> with value from modeller <>"
	login := String new.
	"Attribute named <password> with value from modeller <>"
	password := 0.
	"Attribute named <role> with value from modeller <viewer>"
	role := STSUserRole viewer.
%
category: 'model-initialize'
set compile_env: 0
method: STSApplicationUser
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	login := nil.
	password := nil.
	role := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSApplicationUser
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationUser
getLogin
	" ^<String> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^login
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationUser
setLogin: aString
	" 'aString' is assumed to be instance of class: 'String' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	aString throwMSKNullParameterException:'STSApplicationUser>setLogin:'.
	_newValue := (aString == nil) ifTrue:[ nil ] ifFalse:[ aString asString ].
	(_newValue = login) ifTrue:[ ^self ].
	login := _newValue .
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationUser
getPassword
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^password
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationUser
setPassword: anInteger
	" 'anInteger' is assumed to be instance of class: 'LargeInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSApplicationUser>setPassword:'.
	(anInteger = password) ifTrue:[ ^self ].
	password := anInteger ifNotNil:[ anInteger asInteger  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationUser
getRole
	" ^<Integer>  Value is assumed to be enum value of class: 'STSUserRole'"
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^role
%
category: 'model-public-attributes'
set compile_env: 0
method: STSApplicationUser
setRole: anInteger
	" 'anInteger' is assumed to be enum value of class: 'STSUserRole' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSApplicationUser>setRole:'.
	(anInteger = role) ifTrue:[ ^self ].
	role := anInteger ifNotNil:[ anInteger  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSApplicationUser
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSApplicationUser
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'login') ifTrue:[ ^'each.login' ].
	(apiPropertyName = 'password') ifTrue:[ ^'each.password' ].
	(apiPropertyName = 'role') ifTrue:[ ^'each.role' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSApplicationUser
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSApplicationUser
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSApplicationUser
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSApplicationUser
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSApplicationUser
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'login') ifFalse:[ login := String new ].
	(oldNames includes: #'password') ifFalse:[ password := 0 ].
	(oldNames includes: #'role') ifFalse:[ role := STSUserRole viewer ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILogEntries
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <createdTS> with value from modeller <>"
	createdTS := UndefinedObject.
	"Attribute named <txt> with value from modeller <>"
	txt := UndefinedObject.
	"Attribute named <creator> with value from modeller <>"
	creator := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILogEntries
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	createdTS := nil.
	txt := nil.
	creator := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntries
getCreatedTS
	" ^<(DateAndTime | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^createdTS
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntries
setCreatedTS: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aDateAndTime = createdTS) ifTrue:[ ^self ].

	(aDateAndTime notNil and:[ aDateAndTime pumIsTimestamp not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'createdTS';
			className: 'STSAPILogEntries';
			expectedType:'DateAndTime';
			receivedType: aDateAndTime class name asString; 
			signal.
	].

	createdTS := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntries
getTxt
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^txt
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntries
setTxt: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = txt) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'txt';
			className: 'STSAPILogEntries';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	txt := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntries
getCreator
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^creator
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntries
setCreator: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = creator) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'creator';
			className: 'STSAPILogEntries';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	creator := _newValue. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILogEntries
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntries
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'createdTS') ifTrue:[ ^'each.createdTS' ].
	(apiPropertyName = 'txt') ifTrue:[ ^'each.txt' ].
	(apiPropertyName = 'creator') ifTrue:[ ^'each.creator' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntries
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'createdTS') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILogEntries
copyFrom: aSTSLogEntries

	| newInstance temp |

	newInstance := self newInitialized setAllAttributesToNil ; yourself.
	newInstance setSysrev: aSTSLogEntries getSysrev.
	newInstance setGop: aSTSLogEntries getGop.
	newInstance setCreatedTS: aSTSLogEntries getCreatedTS.
	newInstance setTxt: aSTSLogEntries getTxt.
	newInstance setSyscid: aSTSLogEntries getGop.
	newInstance setCreator: aSTSLogEntries getCreator.
	"call-out for user code - please write your own specific primCopyFromDomain:"
	^newInstance primCopyFromDomain: aSTSLogEntries

%
category: 'model-support'
set compile_env: 0
method: STSAPILogEntries
copyTo: aSTSLogEntries

	| temp oldRevision |

	oldRevision := aSTSLogEntries getSysrev.
	(temp := self getGop) ~= UndefinedObject ifTrue: [ aSTSLogEntries setGop: temp].
	(temp := self getCreatedTS) ~= UndefinedObject ifTrue: [ aSTSLogEntries setCreatedTS: temp].
	(temp := self getTxt) ~= UndefinedObject ifTrue: [ aSTSLogEntries setTxt: temp].
	(temp := self getCreator) ~= UndefinedObject ifTrue: [ aSTSLogEntries setCreator: temp].
	"we correct the multiple increment to help Sencha to stay synchronous"
	oldRevision < aSTSLogEntries getSysrev ifTrue:[ aSTSLogEntries setSysrev: (oldRevision + 1) ].
	"call-out for user code - please write your own specific primCopyFromAPIToDomain:"
	^self primCopyFromAPIToDomain: aSTSLogEntries

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntries
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'createdTS') ifTrue:[ ^'getCreatedTS' ].
	(apiPropertyName = 'txt') ifTrue:[ ^'getTxt' ].
	(apiPropertyName = 'creator') ifTrue:[ ^'getCreator' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntries
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntries
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntries
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntries
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #createdTS
			getter: [ :object | | value | ((value := object getCreatedTS) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setCreatedTS: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #txt
		getter: [ :object | object getTxt ]
		setter: [ :object :value | object setTxt: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #creator
		getter: [ :object | object getCreator ]
		setter: [ :object :value | object setCreator: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntries
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #createdTS
			getter: [ :object | | value | ((value := object getCreatedTS) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setCreatedTS: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #txt
		getter: [ :object | object getTxt ]
		setter: [ :object :value | object setTxt: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #creator
		getter: [ :object | object getCreator ]
		setter: [ :object :value | object setCreator: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntries
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCreatedTSSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getTxtSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCreatorSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCreatedTSSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getTxtSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCreatorSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getCreatedTSESAN

	^'STSAPILogEntriesCreatedTS'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getCreatedTSSAN

	^'createdTS'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getTxtESAN

	^'STSAPILogEntriesTxt'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getTxtSAN

	^'txt'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getGopESAN

	^'STSAPILogEntriesGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getGopSAN

	^'gop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getSyscidESAN

	^'STSAPILogEntriesSyscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getSyscidSAN

	^'syscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getSysrevESAN

	^'STSAPILogEntriesSysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getSysrevSAN

	^'sysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getCreatorESAN

	^'STSAPILogEntriesCreator'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getCreatorSAN

	^'creator'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getSyscidSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSyscidSAN;
		description: 'Framework Attribute. Maintains a unique ID - generated on the client side' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getSyscidESAP

	^(self getSyscidSAP)
		name: self getSyscidESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGopSAN;
		description: 'Framework Attribute. Maintains a unique ID' asUnicodeString ;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getGopESAP

	^(self getGopSAP)
		name: self getGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getSysrevSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSysrevSAN;
		description: 'Framework Attribute. Maintains a revision attribute to manage optimistic locking. You must use this attribute when updating an object' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getSysrevESAP

	^(self getSysrevSAP)
		name: self getSysrevESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getCreatedTSSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getCreatedTSSAN;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getCreatedTSESAP

	^(self getCreatedTSSAP)
		name: self getCreatedTSESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getTxtSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTxtSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getTxtESAP

	^(self getTxtSAP)
		name: self getTxtESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getCreatorSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getCreatorSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntries
getCreatorESAP

	^(self getCreatorSAP)
		name: self getCreatorESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPILogEntryListStoreRL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <entries> with value from modeller <>"
	entries := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILogEntryListStoreRL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntryListStoreRL
getEntries
	" ^<Set of: STSAPILogEntries> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^entries
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPILogEntryListStoreRL
mcAddEntries: aSTSAPILogEntries otherSide: otherSideFlagBoolean
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPILogEntries throwMSKNullParameterException:'STSAPILogEntryListStoreRL>mcAddEntries: %1 otherSide: %2'.

	entries add: aSTSAPILogEntries.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPILogEntryListStoreRL
addEntries: aSTSAPILogEntries
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddEntries: aSTSAPILogEntries otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPILogEntryListStoreRL
mcRemoveEntries: aSTSAPILogEntries otherSide: otherSideFlagBoolean
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPILogEntries throwMSKNullParameterException:'STSAPILogEntryListStoreRL>mcRemoveEntries: %1 otherSide: %2'.

	(entries remove: aSTSAPILogEntries ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPILogEntryListStoreRL
removeEntries: aSTSAPILogEntries
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveEntries: aSTSAPILogEntries otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPILogEntryListStoreRL
_getEntries
	" ^<Set of: STSAPILogEntries> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^entries
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPILogEntryListStoreRL
mcSetEntries: aEntries otherSide: otherSideFlagBoolean
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aEntries == entries) ifTrue:[ ^self ].

	entries := aEntries. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntryListStoreRL
setEntries: aSTSAPILogEntries
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntryListStoreRL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetEntries: aSTSAPILogEntries otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
withAPIList: returnedListOfObjects total: totalListOfObjects

		^(super withAPITotalList: totalListOfObjects)
			setEntries: returnedListOfObjects ;
			yourself

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntryListStoreRL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntryListStoreRL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntryListStoreRL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	(mapping
		mapProperty: #entries
		getter: [ :object | object getEntries ]
		setter: [ :object :value | object setEntries: value ]) valueSchema: #ListOfSTSAPILogEntries.
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].
	mapper for: STSAPILogEntries do: [ :mapping | 
		STSAPILogEntries pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPILogEntries customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPILogEntries
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		addProperty: ((MSKJSONProperty named: self getEntriesSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPILogEntries pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getTotalESAN

	^'STSAPILogEntryListStoreRLTotal'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getTotalSAN

	^'total'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getSuccessESAN

	^'STSAPILogEntryListStoreRLSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getErrorESAN

	^'STSAPILogEntryListStoreRLError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgssESAN

	^'STSAPILogEntryListStoreRLDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgapiESAN

	^'STSAPILogEntryListStoreRLDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgmsESAN

	^'STSAPILogEntryListStoreRLDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getEntriesESAN

	^'STSAPILogEntryListStoreRLEntries'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getEntriesSAN

	^'entries'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbglocESAN

	^'STSAPILogEntryListStoreRLDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbtsESAN

	^'STSAPILogEntryListStoreRLDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getTotalSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTotalSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStoreRL
getTotalESAP

	^(self getTotalSAP)
		name: self getTotalESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseOption
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <name> with value from modeller <>"
	name := UndefinedObject.
	"Attribute named <value> with value from modeller <>"
	value := UndefinedObject.
	"Attribute named <licenseGop> with value from modeller <>"
	licenseGop := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseOption
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	name := nil.
	value := nil.
	licenseGop := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOption
getName
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^name
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOption
setName: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = name) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'name';
			className: 'STSAPILicenseOption';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	name := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOption
getValue
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^value
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOption
setValue: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = value) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'value';
			className: 'STSAPILicenseOption';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	value := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOption
getLicenseGop
	" ^<(Integer | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^licenseGop
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOption
setLicenseGop: anInteger
	" 'anInteger' is assumed to be instance of class: 'LargeInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = licenseGop) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'licenseGop';
			className: 'STSAPILicenseOption';
			expectedType:'LargeInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	licenseGop := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILicenseOption
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOption
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'each.name' ].
	(apiPropertyName = 'value') ifTrue:[ ^'each.value' ].
	(apiPropertyName = 'licenseGop') ifTrue:[ ^'each.license.gop' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOption
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILicenseOption
copyFrom: aSTSLicenseOption

	| newInstance temp |

	newInstance := self newInitialized setAllAttributesToNil ; yourself.
	newInstance setLicenseGop: aSTSLicenseOption getLicenseGop.
	newInstance setSysrev: aSTSLicenseOption getSysrev.
	newInstance setValue: aSTSLicenseOption getValue.
	newInstance setGop: aSTSLicenseOption getGop.
	newInstance setName: aSTSLicenseOption getName.
	newInstance setSyscid: aSTSLicenseOption getGop.
	"call-out for user code - please write your own specific primCopyFromDomain:"
	^newInstance primCopyFromDomain: aSTSLicenseOption

%
category: 'model-support'
set compile_env: 0
method: STSAPILicenseOption
copyTo: aSTSLicenseOption

	| temp oldRevision |

	oldRevision := aSTSLicenseOption getSysrev.
	(temp := self getValue) ~= UndefinedObject ifTrue: [ aSTSLicenseOption setValue: temp].
	(temp := self getGop) ~= UndefinedObject ifTrue: [ aSTSLicenseOption setGop: temp].
	(temp := self getName) ~= UndefinedObject ifTrue: [ aSTSLicenseOption setName: temp].
	"we correct the multiple increment to help Sencha to stay synchronous"
	oldRevision < aSTSLicenseOption getSysrev ifTrue:[ aSTSLicenseOption setSysrev: (oldRevision + 1) ].
	"call-out for user code - please write your own specific primCopyFromAPIToDomain:"
	^self primCopyFromAPIToDomain: aSTSLicenseOption

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOption
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'getName' ].
	(apiPropertyName = 'value') ifTrue:[ ^'getValue' ].
	(apiPropertyName = 'licenseGop') ifTrue:[ ^'getLicenseGop' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOption
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOption
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOption
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOption
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #licenseGop
		getter: [ :object | object getLicenseGop ]
		setter: [ :object :value | object setLicenseGop: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #value
		getter: [ :object | object getValue ]
		setter: [ :object :value | object setValue: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #name
		getter: [ :object | object getName ]
		setter: [ :object :value | object setName: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOption
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #name
		getter: [ :object | object getName ]
		setter: [ :object :value | object setName: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #licenseGop
		getter: [ :object | object getLicenseGop ]
		setter: [ :object :value | object setLicenseGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #value
		getter: [ :object | object getValue ]
		setter: [ :object :value | object setValue: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOption
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLicenseGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getValueSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getNameSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getNameSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getValueSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getLicenseGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getNameESAN

	^'STSAPILicenseOptionName'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getNameSAN

	^'name'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getGopESAN

	^'STSAPILicenseOptionGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getGopSAN

	^'gop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getLicenseGopESAN

	^'STSAPILicenseOptionLicenseGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getLicenseGopSAN

	^'licenseGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getSyscidESAN

	^'STSAPILicenseOptionSyscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getSyscidSAN

	^'syscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getSysrevESAN

	^'STSAPILicenseOptionSysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getSysrevSAN

	^'sysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getValueESAN

	^'STSAPILicenseOptionValue'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getValueSAN

	^'value'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getSyscidSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSyscidSAN;
		description: 'Framework Attribute. Maintains a unique ID - generated on the client side' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getSyscidESAP

	^(self getSyscidSAP)
		name: self getSyscidESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGopSAN;
		description: 'Framework Attribute. Maintains a unique ID' asUnicodeString ;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getGopESAP

	^(self getGopSAP)
		name: self getGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getSysrevSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSysrevSAN;
		description: 'Framework Attribute. Maintains a revision attribute to manage optimistic locking. You must use this attribute when updating an object' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getSysrevESAP

	^(self getSysrevSAP)
		name: self getSysrevESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getNameSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getNameSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getNameESAP

	^(self getNameSAP)
		name: self getNameESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getValueSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getValueSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getValueESAP

	^(self getValueSAP)
		name: self getValueESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getLicenseGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLicenseGopSAN;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOption
getLicenseGopESAP

	^(self getLicenseGopSAP)
		name: self getLicenseGopESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRLicenseOptionListStore
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRLicenseOptionListStore
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLicenseOptionListStore
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLicenseOptionListStore
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLicenseOptionListStore
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getLimitESAN

	^'STSAPIPRLicenseOptionListStoreLimit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getLimitSAN

	^'limit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getStartESAN

	^'STSAPIPRLicenseOptionListStoreStart'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getStartSAN

	^'start'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getPageESAN

	^'STSAPIPRLicenseOptionListStorePage'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getPageSAN

	^'page'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getGsqueryESAN

	^'STSAPIPRLicenseOptionListStoreGsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getGsquerySAN

	^'gsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getSortESAN

	^'STSAPIPRLicenseOptionListStoreSort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getSortSAN

	^'sort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getFilterESAN

	^'STSAPIPRLicenseOptionListStoreFilter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getFilterSAN

	^'filter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getLimitSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLimitSAN;
		description: 'Framework Attribute. Answer the maximum number of objects in the returned list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getLimitESAP

	^(self getLimitSAP)
		name: self getLimitESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getStartSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getStartSAN;
		description: 'Framework Attribute. Returns the offset of the first element in the returned list within the total result list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getStartESAP

	^(self getStartSAP)
		name: self getStartESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getPageSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPageSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getPageESAP

	^(self getPageSAP)
		name: self getPageESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getGsquerySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGsquerySAN;
		description: 'When set, this helds a complete gsquery string' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getGsqueryESAP

	^(self getGsquerySAP)
		name: self getGsqueryESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getSortSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSortSAN;
		description: 'Sorting description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getSortESAP

	^(self getSortSAP)
		name: self getSortESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getFilterSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getFilterSAN;
		description: 'Filter description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseOptionListStore
getFilterESAP

	^(self getFilterSAP)
		name: self getFilterESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRLicenseListStore
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRLicenseListStore
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLicenseListStore
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLicenseListStore
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLicenseListStore
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getLimitESAN

	^'STSAPIPRLicenseListStoreLimit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getLimitSAN

	^'limit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getStartESAN

	^'STSAPIPRLicenseListStoreStart'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getStartSAN

	^'start'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getPageESAN

	^'STSAPIPRLicenseListStorePage'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getPageSAN

	^'page'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getGsqueryESAN

	^'STSAPIPRLicenseListStoreGsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getGsquerySAN

	^'gsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getSortESAN

	^'STSAPIPRLicenseListStoreSort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getSortSAN

	^'sort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getFilterESAN

	^'STSAPIPRLicenseListStoreFilter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getFilterSAN

	^'filter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getLimitSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLimitSAN;
		description: 'Framework Attribute. Answer the maximum number of objects in the returned list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getLimitESAP

	^(self getLimitSAP)
		name: self getLimitESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getStartSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getStartSAN;
		description: 'Framework Attribute. Returns the offset of the first element in the returned list within the total result list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getStartESAP

	^(self getStartSAP)
		name: self getStartESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getPageSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPageSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getPageESAP

	^(self getPageSAP)
		name: self getPageESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getGsquerySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGsquerySAN;
		description: 'When set, this helds a complete gsquery string' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getGsqueryESAP

	^(self getGsquerySAP)
		name: self getGsqueryESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getSortSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSortSAN;
		description: 'Sorting description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getSortESAP

	^(self getSortSAP)
		name: self getSortESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getFilterSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getFilterSAN;
		description: 'Filter description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLicenseListStore
getFilterESAP

	^(self getFilterSAP)
		name: self getFilterESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSLogEntries
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <domObject> with value from modeller <>"
	domObject := nil.
	"Attribute named <createdTS> with value from modeller <>"
	createdTS := DateAndTime now asUTC.
	"Attribute named <txt> with value from modeller <>"
	txt := Unicode16 new.
	"Attribute named <creator> with value from modeller <>"
	creator := Unicode16 new.
%
category: 'model-initialize'
set compile_env: 0
method: STSLogEntries
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	domObject := nil.
	createdTS := nil.
	txt := nil.
	creator := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSLogEntries
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLogEntries
getDomObject
	" ^<STSGeneralDomain> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^domObject
%
category: 'model-private-attributes'
set compile_env: 0
method: STSLogEntries
mcSetDomObject: aDomObject otherSide: otherSideFlagBoolean
	" 'aSTSGeneralDomain' is assumed to be instance of class: 'STSGeneralDomain' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aDomObject == domObject) ifTrue:[ ^self ].
	domObject notNil ifTrue:[ domObject mcRemoveLogEntries: self otherSide: false ]. 

	domObject := aDomObject. 
	sysrev := sysrev + 1. 
	(otherSideFlagBoolean and:[ aDomObject notNil ]) ifTrue:[ aDomObject mcAddLogEntries: self otherSide: false ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLogEntries
setDomObject: aSTSGeneralDomain
	" 'aSTSGeneralDomain' is assumed to be instance of class: 'STSLogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetDomObject: aSTSGeneralDomain otherSide: true.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLogEntries
getCreatedTS
	" ^<DateAndTime> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^createdTS
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLogEntries
setCreatedTS: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aDateAndTime throwMSKNullParameterException:'STSLogEntries>setCreatedTS:'.
	(aDateAndTime = createdTS) ifTrue:[ ^self ].
	createdTS := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLogEntries
getTxt
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^txt
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLogEntries
setTxt: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSLogEntries>setTxt:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = txt) ifTrue:[ ^self ].
	txt := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLogEntries
getCreator
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^creator
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLogEntries
setCreator: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSLogEntries>setCreator:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = creator) ifTrue:[ ^self ].
	creator := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSLogEntries
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLogEntries
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'createdTS') ifTrue:[ ^'each.createdTS' ].
	(apiPropertyName = 'txt') ifTrue:[ ^'each.txt' ].
	(apiPropertyName = 'creator') ifTrue:[ ^'each.creator' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLogEntries
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSLogEntries
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSLogEntries
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSLogEntries
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSLogEntries
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'domObject') ifFalse:[ domObject := nil ].
	(oldNames includes: #'createdTS') ifFalse:[ createdTS := DateAndTime now asUTC ].
	(oldNames includes: #'txt') ifFalse:[ txt := Unicode16 new ].
	(oldNames includes: #'creator') ifFalse:[ creator := Unicode16 new ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIResultListWithSingleObject
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <total> with value from modeller <>"
	total := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIResultListWithSingleObject
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	total := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIResultListWithSingleObject
getTotal
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^total
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIResultListWithSingleObject
setTotal: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSAPIResultListWithSingleObject>setTotal:'.
	(anInteger = total) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'total';
			className: 'STSAPIResultListWithSingleObject';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	total := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
withDomainList: list apiClass: apiClass  total: list2

		^self withAPIList:  (list collect:[ :each | apiClass copyFrom: each]) total: list2
%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
withAPITotalList: listOfDomainObjects

		^self new initialize
			setError: nil ;
			setTotal: listOfDomainObjects size
			yourself

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIResultListWithSingleObject
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIResultListWithSingleObject
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIResultListWithSingleObject
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getTotalESAN

	^'STSAPIResultListWithSingleObjectTotal'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getTotalSAN

	^'total'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getSuccessESAN

	^'STSAPIResultListWithSingleObjectSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getErrorESAN

	^'STSAPIResultListWithSingleObjectError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgssESAN

	^'STSAPIResultListWithSingleObjectDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgapiESAN

	^'STSAPIResultListWithSingleObjectDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgmsESAN

	^'STSAPIResultListWithSingleObjectDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbglocESAN

	^'STSAPIResultListWithSingleObjectDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbtsESAN

	^'STSAPIResultListWithSingleObjectDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getTotalSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTotalSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIResultListWithSingleObject
getTotalESAP

	^(self getTotalSAP)
		name: self getTotalESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSLicenseOption
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <name> with value from modeller <>"
	name := Unicode16 new.
	"Attribute named <value> with value from modeller <>"
	value := Unicode16 new.
	"Attribute named <license> with value from modeller <>"
	license := nil.
%
category: 'model-initialize'
set compile_env: 0
method: STSLicenseOption
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	name := nil.
	value := nil.
	license := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSLicenseOption
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicenseOption
getName
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^name
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicenseOption
setName: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSLicenseOption>setName:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = name) ifTrue:[ ^self ].
	name := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicenseOption
getValue
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^value
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicenseOption
setValue: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSLicenseOption>setValue:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = value) ifTrue:[ ^self ].
	value := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicenseOption
getLicense
	" ^<STSLicense> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^license
%
category: 'model-private-attributes'
set compile_env: 0
method: STSLicenseOption
mcSetLicense: aLicense otherSide: otherSideFlagBoolean
	" 'aSTSLicense' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aLicense == license) ifTrue:[ ^self ].
	license notNil ifTrue:[ license mcRemoveOptions: self otherSide: false ]. 

	license := aLicense. 
	sysrev := sysrev + 1. 
	(otherSideFlagBoolean and:[ aLicense notNil ]) ifTrue:[ aLicense mcAddOptions: self otherSide: false ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicenseOption
setLicense: aSTSLicense
	" 'aSTSLicense' is assumed to be instance of class: 'STSLicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetLicense: aSTSLicense otherSide: true.
%
category: 'model-public-attributes-derived'
set compile_env: 0
method: STSLicenseOption
getLicenseGop
	| temp |


	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(temp :=  self getLicense) isNil ifTrue:[ ^temp ].
	(temp :=  temp getGop) isNil ifTrue:[ ^temp ].
	^temp

%
category: 'model-support'
set compile_env: 0
classmethod: STSLicenseOption
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLicenseOption
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'each.name' ].
	(apiPropertyName = 'value') ifTrue:[ ^'each.value' ].
	(apiPropertyName = 'licenseGop') ifTrue:[ ^'each.license.gop' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLicenseOption
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSLicenseOption
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSLicenseOption
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSLicenseOption
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSLicenseOption
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'name') ifFalse:[ name := Unicode16 new ].
	(oldNames includes: #'value') ifFalse:[ value := Unicode16 new ].
	(oldNames includes: #'license') ifFalse:[ license := nil ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILogEntryListStorePL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <entries> with value from modeller <>"
	entries := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILogEntryListStorePL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntryListStorePL
getEntries
	" ^<Set of: STSAPILogEntries> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^entries
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPILogEntryListStorePL
mcAddEntries: aSTSAPILogEntries otherSide: otherSideFlagBoolean
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPILogEntries throwMSKNullParameterException:'STSAPILogEntryListStorePL>mcAddEntries: %1 otherSide: %2'.

	entries add: aSTSAPILogEntries.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPILogEntryListStorePL
addEntries: aSTSAPILogEntries
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddEntries: aSTSAPILogEntries otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPILogEntryListStorePL
mcRemoveEntries: aSTSAPILogEntries otherSide: otherSideFlagBoolean
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPILogEntries throwMSKNullParameterException:'STSAPILogEntryListStorePL>mcRemoveEntries: %1 otherSide: %2'.

	(entries remove: aSTSAPILogEntries ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPILogEntryListStorePL
removeEntries: aSTSAPILogEntries
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveEntries: aSTSAPILogEntries otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPILogEntryListStorePL
_getEntries
	" ^<Set of: STSAPILogEntries> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^entries
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPILogEntryListStorePL
mcSetEntries: aEntries otherSide: otherSideFlagBoolean
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntries' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aEntries == entries) ifTrue:[ ^self ].

	entries := aEntries. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILogEntryListStorePL
setEntries: aSTSAPILogEntries
	" 'aSTSAPILogEntries' is assumed to be instance of class: 'STSAPILogEntryListStorePL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetEntries: aSTSAPILogEntries otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntryListStorePL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntryListStorePL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILogEntryListStorePL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(mapping
		mapProperty: #entries
		getter: [ :object | object getEntries ]
		setter: [ :object :value | object setEntries: value ]) valueSchema: #ListOfSTSAPILogEntries.


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPILogEntries do: [ :mapping | 
		STSAPILogEntries pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPILogEntries customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPILogEntries
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getEntriesSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPILogEntries pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
getEntriesESAN

	^'STSAPILogEntryListStorePLEntries'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILogEntryListStorePL
getEntriesSAN

	^'entries'

%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <options> with value from modeller <>"
	options := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
getOptions
	" ^<Set of: STSAPILicenseOption> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^options
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
mcAddOptions: aSTSAPILicenseOption otherSide: otherSideFlagBoolean
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPILicenseOption throwMSKNullParameterException:'STSAPILicenseOptionListStoreRL>mcAddOptions: %1 otherSide: %2'.

	options add: aSTSAPILicenseOption.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
addOptions: aSTSAPILicenseOption
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddOptions: aSTSAPILicenseOption otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
mcRemoveOptions: aSTSAPILicenseOption otherSide: otherSideFlagBoolean
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPILicenseOption throwMSKNullParameterException:'STSAPILicenseOptionListStoreRL>mcRemoveOptions: %1 otherSide: %2'.

	(options remove: aSTSAPILicenseOption ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
removeOptions: aSTSAPILicenseOption
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveOptions: aSTSAPILicenseOption otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
_getOptions
	" ^<Set of: STSAPILicenseOption> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^options
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
mcSetOptions: aOptions otherSide: otherSideFlagBoolean
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aOptions == options) ifTrue:[ ^self ].

	options := aOptions. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
setOptions: aSTSAPILicenseOption
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOptionListStoreRL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetOptions: aSTSAPILicenseOption otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
withAPIList: returnedListOfObjects total: totalListOfObjects

		^(super withAPITotalList: totalListOfObjects)
			setOptions: returnedListOfObjects ;
			yourself

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOptionListStoreRL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	(mapping
		mapProperty: #options
		getter: [ :object | object getOptions ]
		setter: [ :object :value | object setOptions: value ]) valueSchema: #ListOfSTSAPILicenseOption.
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].
	mapper for: STSAPILicenseOption do: [ :mapping | 
		STSAPILicenseOption pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPILicenseOption customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPILicenseOption
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		addProperty: ((MSKJSONProperty named: self getOptionsSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPILicenseOption pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getTotalESAN

	^'STSAPILicenseOptionListStoreRLTotal'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getTotalSAN

	^'total'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getSuccessESAN

	^'STSAPILicenseOptionListStoreRLSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getErrorESAN

	^'STSAPILicenseOptionListStoreRLError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgssESAN

	^'STSAPILicenseOptionListStoreRLDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgapiESAN

	^'STSAPILicenseOptionListStoreRLDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgmsESAN

	^'STSAPILicenseOptionListStoreRLDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getOptionsESAN

	^'STSAPILicenseOptionListStoreRLOptions'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getOptionsSAN

	^'options'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbglocESAN

	^'STSAPILicenseOptionListStoreRLDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbtsESAN

	^'STSAPILicenseOptionListStoreRLDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getTotalSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTotalSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStoreRL
getTotalESAP

	^(self getTotalSAP)
		name: self getTotalESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseListStorePL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <licenses> with value from modeller <>"
	licenses := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseListStorePL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseListStorePL
getLicenses
	" ^<Set of: STSAPILicense> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^licenses
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPILicenseListStorePL
mcAddLicenses: aSTSAPILicense otherSide: otherSideFlagBoolean
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPILicense throwMSKNullParameterException:'STSAPILicenseListStorePL>mcAddLicenses: %1 otherSide: %2'.

	licenses add: aSTSAPILicense.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPILicenseListStorePL
addLicenses: aSTSAPILicense
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddLicenses: aSTSAPILicense otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPILicenseListStorePL
mcRemoveLicenses: aSTSAPILicense otherSide: otherSideFlagBoolean
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPILicense throwMSKNullParameterException:'STSAPILicenseListStorePL>mcRemoveLicenses: %1 otherSide: %2'.

	(licenses remove: aSTSAPILicense ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPILicenseListStorePL
removeLicenses: aSTSAPILicense
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveLicenses: aSTSAPILicense otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPILicenseListStorePL
_getLicenses
	" ^<Set of: STSAPILicense> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^licenses
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPILicenseListStorePL
mcSetLicenses: aLicenses otherSide: otherSideFlagBoolean
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aLicenses == licenses) ifTrue:[ ^self ].

	licenses := aLicenses. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseListStorePL
setLicenses: aSTSAPILicense
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicenseListStorePL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetLicenses: aSTSAPILicense otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseListStorePL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseListStorePL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseListStorePL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(mapping
		mapProperty: #licenses
		getter: [ :object | object getLicenses ]
		setter: [ :object :value | object setLicenses: value ]) valueSchema: #ListOfSTSAPILicense.


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPILicense do: [ :mapping | 
		STSAPILicense pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPILicense customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPILicense
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLicensesSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPILicense pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
getLicensesESAN

	^'STSAPILicenseListStorePLLicenses'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStorePL
getLicensesSAN

	^'licenses'

%
category: 'model-initialize'
set compile_env: 0
method: STSAPICustomer
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <name> with value from modeller <>"
	name := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPICustomer
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	name := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPICustomer
getName
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^name
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPICustomer
setName: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = name) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'name';
			className: 'STSAPICustomer';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	name := _newValue. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPICustomer
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomer
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'each.name' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomer
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPICustomer
copyFrom: aSTSCustomer

	| newInstance temp |

	newInstance := self newInitialized setAllAttributesToNil ; yourself.
	newInstance setGop: aSTSCustomer getGop.
	newInstance setName: aSTSCustomer getName.
	newInstance setSyscid: aSTSCustomer getGop.
	newInstance setSysrev: aSTSCustomer getSysrev.
	"call-out for user code - please write your own specific primCopyFromDomain:"
	^newInstance primCopyFromDomain: aSTSCustomer

%
category: 'model-support'
set compile_env: 0
method: STSAPICustomer
copyTo: aSTSCustomer

	| temp oldRevision |

	oldRevision := aSTSCustomer getSysrev.
	(temp := self getGop) ~= UndefinedObject ifTrue: [ aSTSCustomer setGop: temp].
	(temp := self getName) ~= UndefinedObject ifTrue: [ aSTSCustomer setName: temp].
	"we correct the multiple increment to help Sencha to stay synchronous"
	oldRevision < aSTSCustomer getSysrev ifTrue:[ aSTSCustomer setSysrev: (oldRevision + 1) ].
	"call-out for user code - please write your own specific primCopyFromAPIToDomain:"
	^self primCopyFromAPIToDomain: aSTSCustomer

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomer
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'getName' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomer
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomer
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomer
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomer
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #name
		getter: [ :object | object getName ]
		setter: [ :object :value | object setName: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomer
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #name
		getter: [ :object | object getName ]
		setter: [ :object :value | object setName: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomer
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getNameSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getNameSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getGopESAN

	^'STSAPICustomerGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getGopSAN

	^'gop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getNameESAN

	^'STSAPICustomerName'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getNameSAN

	^'name'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getSyscidESAN

	^'STSAPICustomerSyscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getSyscidSAN

	^'syscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getSysrevESAN

	^'STSAPICustomerSysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getSysrevSAN

	^'sysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getSyscidSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSyscidSAN;
		description: 'Framework Attribute. Maintains a unique ID - generated on the client side' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getSyscidESAP

	^(self getSyscidSAP)
		name: self getSyscidESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGopSAN;
		description: 'Framework Attribute. Maintains a unique ID' asUnicodeString ;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getGopESAP

	^(self getGopSAP)
		name: self getGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getSysrevSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSysrevSAN;
		description: 'Framework Attribute. Maintains a revision attribute to manage optimistic locking. You must use this attribute when updating an object' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getSysrevESAP

	^(self getSysrevSAP)
		name: self getSysrevESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getNameSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getNameSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomer
getNameESAP

	^(self getNameSAP)
		name: self getNameESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIApplicationSession
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <lastActivity> with value from modeller <>"
	lastActivity := UndefinedObject.
	"Attribute named <defaultTimeout> with value from modeller <>"
	defaultTimeout := UndefinedObject.
	"Attribute named <expiration> with value from modeller <>"
	expiration := UndefinedObject.
	"Attribute named <createdTS> with value from modeller <>"
	createdTS := UndefinedObject.
	"Attribute named <currentLocale> with value from modeller <>"
	currentLocale := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIApplicationSession
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	lastActivity := nil.
	defaultTimeout := nil.
	expiration := nil.
	createdTS := nil.
	currentLocale := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
getLastActivity
	" ^<(DateAndTime | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^lastActivity
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
setLastActivity: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aDateAndTime = lastActivity) ifTrue:[ ^self ].

	(aDateAndTime notNil and:[ aDateAndTime pumIsTimestamp not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'lastActivity';
			className: 'STSAPIApplicationSession';
			expectedType:'DateAndTime';
			receivedType: aDateAndTime class name asString; 
			signal.
	].

	lastActivity := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
getDefaultTimeout
	" ^<(Integer | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^defaultTimeout
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
setDefaultTimeout: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = defaultTimeout) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'defaultTimeout';
			className: 'STSAPIApplicationSession';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	defaultTimeout := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
getExpiration
	" ^<(DateAndTime | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^expiration
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
setExpiration: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aDateAndTime = expiration) ifTrue:[ ^self ].

	(aDateAndTime notNil and:[ aDateAndTime pumIsTimestamp not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'expiration';
			className: 'STSAPIApplicationSession';
			expectedType:'DateAndTime';
			receivedType: aDateAndTime class name asString; 
			signal.
	].

	expiration := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
getCreatedTS
	" ^<(DateAndTime | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^createdTS
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
setCreatedTS: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aDateAndTime = createdTS) ifTrue:[ ^self ].

	(aDateAndTime notNil and:[ aDateAndTime pumIsTimestamp not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'createdTS';
			className: 'STSAPIApplicationSession';
			expectedType:'DateAndTime';
			receivedType: aDateAndTime class name asString; 
			signal.
	].

	createdTS := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
getCurrentLocale
	" ^<(String | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^currentLocale
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationSession
setCurrentLocale: aString
	" 'aString' is assumed to be instance of class: 'String' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (aString == nil) ifTrue:[ nil ] ifFalse:[ aString asString ].
	(_newValue = currentLocale) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'currentLocale';
			className: 'STSAPIApplicationSession';
			expectedType:'String';
			receivedType: _newValue class name asString; 
			signal.
	].

	currentLocale := _newValue .
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'lastActivity') ifTrue:[ ^'each.lastActivity' ].
	(apiPropertyName = 'defaultTimeout') ifTrue:[ ^'each.defaultTimeout' ].
	(apiPropertyName = 'expiration') ifTrue:[ ^'each.expiration' ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^'each.createdTS' ].
	(apiPropertyName = 'currentLocale') ifTrue:[ ^'each.currentLocale' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'lastActivity') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].
	(apiPropertyName = 'expiration') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
copyFrom: aSTSApplicationSession

	| newInstance temp |

	newInstance := self newInitialized setAllAttributesToNil ; yourself.
	newInstance setSyscid: aSTSApplicationSession getGop.
	newInstance setSysrev: aSTSApplicationSession getSysrev.
	newInstance setLastActivity: aSTSApplicationSession getLastActivity.
	newInstance setCreatedTS: aSTSApplicationSession getCreatedTS.
	newInstance setGop: aSTSApplicationSession getGop.
	newInstance setExpiration: aSTSApplicationSession getExpiration.
	newInstance setCurrentLocale: aSTSApplicationSession getCurrentLocale.
	newInstance setDefaultTimeout: aSTSApplicationSession getDefaultTimeout.
	"call-out for user code - please write your own specific primCopyFromDomain:"
	^newInstance primCopyFromDomain: aSTSApplicationSession

%
category: 'model-support'
set compile_env: 0
method: STSAPIApplicationSession
copyTo: aSTSApplicationSession

	| temp oldRevision |

	oldRevision := aSTSApplicationSession getSysrev.
	(temp := self getLastActivity) ~= UndefinedObject ifTrue: [ aSTSApplicationSession setLastActivity: temp].
	(temp := self getCreatedTS) ~= UndefinedObject ifTrue: [ aSTSApplicationSession setCreatedTS: temp].
	(temp := self getGop) ~= UndefinedObject ifTrue: [ aSTSApplicationSession setGop: temp].
	(temp := self getExpiration) ~= UndefinedObject ifTrue: [ aSTSApplicationSession setExpiration: temp].
	(temp := self getCurrentLocale) ~= UndefinedObject ifTrue: [ aSTSApplicationSession setCurrentLocale: temp].
	(temp := self getDefaultTimeout) ~= UndefinedObject ifTrue: [ aSTSApplicationSession setDefaultTimeout: temp].
	"we correct the multiple increment to help Sencha to stay synchronous"
	oldRevision < aSTSApplicationSession getSysrev ifTrue:[ aSTSApplicationSession setSysrev: (oldRevision + 1) ].
	"call-out for user code - please write your own specific primCopyFromAPIToDomain:"
	^self primCopyFromAPIToDomain: aSTSApplicationSession

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'lastActivity') ifTrue:[ ^'getLastActivity' ].
	(apiPropertyName = 'defaultTimeout') ifTrue:[ ^'getDefaultTimeout' ].
	(apiPropertyName = 'expiration') ifTrue:[ ^'getExpiration' ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^'getCreatedTS' ].
	(apiPropertyName = 'currentLocale') ifTrue:[ ^'getCurrentLocale' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIApplicationSession
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIApplicationSession
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIApplicationSession
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #lastActivity
			getter: [ :object | | value | ((value := object getLastActivity) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setLastActivity: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #createdTS
			getter: [ :object | | value | ((value := object getCreatedTS) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setCreatedTS: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #expiration
			getter: [ :object | | value | ((value := object getExpiration) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setExpiration: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #currentLocale
		getter: [ :object | object getCurrentLocale ]
		setter: [ :object :value | object setCurrentLocale: value ].
	mapping
		mapProperty: #defaultTimeout
		getter: [ :object | object getDefaultTimeout ]
		setter: [ :object :value | object setDefaultTimeout: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #createdTS
			getter: [ :object | | value | ((value := object getCreatedTS) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setCreatedTS: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #expiration
			getter: [ :object | | value | ((value := object getExpiration) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setExpiration: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #lastActivity
			getter: [ :object | | value | ((value := object getLastActivity) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setLastActivity: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #currentLocale
		getter: [ :object | object getCurrentLocale ]
		setter: [ :object :value | object setCurrentLocale: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #defaultTimeout
		getter: [ :object | object getDefaultTimeout ]
		setter: [ :object :value | object setDefaultTimeout: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIApplicationSession
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getLastActivitySAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getCreatedTSSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getExpirationSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getCurrentLocaleSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDefaultTimeoutSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getLastActivitySAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDefaultTimeoutSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getExpirationSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getCreatedTSSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getCurrentLocaleSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getCreatedTSESAN

	^'STSAPIApplicationSessionCreatedTS'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getCreatedTSSAN

	^'createdTS'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getExpirationESAN

	^'STSAPIApplicationSessionExpiration'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getExpirationSAN

	^'expiration'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getLastActivityESAN

	^'STSAPIApplicationSessionLastActivity'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getLastActivitySAN

	^'lastActivity'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getCurrentLocaleESAN

	^'STSAPIApplicationSessionCurrentLocale'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getCurrentLocaleSAN

	^'currentLocale'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getGopESAN

	^'STSAPIApplicationSessionGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getGopSAN

	^'gop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getSyscidESAN

	^'STSAPIApplicationSessionSyscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getSyscidSAN

	^'syscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getSysrevESAN

	^'STSAPIApplicationSessionSysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getSysrevSAN

	^'sysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDefaultTimeoutESAN

	^'STSAPIApplicationSessionDefaultTimeout'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDefaultTimeoutSAN

	^'defaultTimeout'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getSyscidSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSyscidSAN;
		description: 'Framework Attribute. Maintains a unique ID - generated on the client side' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getSyscidESAP

	^(self getSyscidSAP)
		name: self getSyscidESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGopSAN;
		description: 'Framework Attribute. Maintains a unique ID' asUnicodeString ;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getGopESAP

	^(self getGopSAP)
		name: self getGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getSysrevSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSysrevSAN;
		description: 'Framework Attribute. Maintains a revision attribute to manage optimistic locking. You must use this attribute when updating an object' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getSysrevESAP

	^(self getSysrevSAP)
		name: self getSysrevESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getLastActivitySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLastActivitySAN;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getLastActivityESAP

	^(self getLastActivitySAP)
		name: self getLastActivityESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDefaultTimeoutSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDefaultTimeoutSAN;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getDefaultTimeoutESAP

	^(self getDefaultTimeoutSAP)
		name: self getDefaultTimeoutESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getExpirationSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getExpirationSAN;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getExpirationESAP

	^(self getExpirationSAP)
		name: self getExpirationESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getCreatedTSSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getCreatedTSSAN;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getCreatedTSESAP

	^(self getCreatedTSSAP)
		name: self getCreatedTSESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getCurrentLocaleSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getCurrentLocaleSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationSession
getCurrentLocaleESAP

	^(self getCurrentLocaleSAP)
		name: self getCurrentLocaleESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIObjectWithIDs
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <syscid> with value from modeller <>"
	syscid := UndefinedObject.
	"Attribute named <gop> with value from modeller <>"
	gop := UndefinedObject.
	"Attribute named <sysrev> with value from modeller <>"
	sysrev := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIObjectWithIDs
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	syscid := nil.
	gop := nil.
	sysrev := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIObjectWithIDs
getSyscid
	" ^<(String | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^syscid
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIObjectWithIDs
setSyscid: aStringOrNil
	" 'aStringOrNil' is assumed to be instance of class: 'String' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (aStringOrNil == nil) ifTrue:[ nil ] ifFalse:[ aStringOrNil asString ].
	(_newValue = syscid) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'syscid';
			className: 'STSAPIObjectWithIDs';
			expectedType:'String';
			receivedType: _newValue class name asString; 
			signal.
	].

	syscid := _newValue .
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIObjectWithIDs
getGop
	" ^<(Integer | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^gop
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIObjectWithIDs
setGop: anInteger
	" 'anInteger' is assumed to be instance of class: 'LargeInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = gop) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'gop';
			className: 'STSAPIObjectWithIDs';
			expectedType:'LargeInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	gop := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIObjectWithIDs
getSysrev
	" ^<(Integer | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^sysrev
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIObjectWithIDs
setSysrev: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = sysrev) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'sysrev';
			className: 'STSAPIObjectWithIDs';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	sysrev := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'gop') ifTrue:[ ^'each.gop' ].
	(apiPropertyName = 'sysrev') ifTrue:[ ^'each.sysrev' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
copyFrom: aSTSGeneralDomain

	| newInstance temp |

	newInstance := self newInitialized setAllAttributesToNil ; yourself.
	newInstance setGop: aSTSGeneralDomain getGop.
	newInstance setSyscid: aSTSGeneralDomain getGop.
	newInstance setSysrev: aSTSGeneralDomain getSysrev.
	"call-out for user code - please write your own specific primCopyFromDomain:"
	^newInstance primCopyFromDomain: aSTSGeneralDomain

%
category: 'model-support'
set compile_env: 0
method: STSAPIObjectWithIDs
copyTo: aSTSGeneralDomain

	| temp oldRevision |

	oldRevision := aSTSGeneralDomain getSysrev.
	(temp := self getGop) ~= UndefinedObject ifTrue: [ aSTSGeneralDomain setGop: temp].
	"we correct the multiple increment to help Sencha to stay synchronous"
	oldRevision < aSTSGeneralDomain getSysrev ifTrue:[ aSTSGeneralDomain setSysrev: (oldRevision + 1) ].
	"call-out for user code - please write your own specific primCopyFromAPIToDomain:"
	^self primCopyFromAPIToDomain: aSTSGeneralDomain

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'gop') ifTrue:[ ^'getGop' ].
	(apiPropertyName = 'sysrev') ifTrue:[ ^'getSysrev' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIObjectWithIDs
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIObjectWithIDs
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIObjectWithIDs
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-support'
set compile_env: 0
method: STSAPIObjectWithIDs
primCopyFromDomain: domainObject 

	^self

%
category: 'model-support'
set compile_env: 0
method: STSAPIObjectWithIDs
primCopyFromAPIToDomain: domainObject

	^nil
%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getGopESAN

	^'STSAPIObjectWithIDsGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getGopSAN

	^'gop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getSyscidESAN

	^'STSAPIObjectWithIDsSyscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getSyscidSAN

	^'syscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getSysrevESAN

	^'STSAPIObjectWithIDsSysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getSysrevSAN

	^'sysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getSyscidSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSyscidSAN;
		description: 'Framework Attribute. Maintains a unique ID - generated on the client side' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getSyscidESAP

	^(self getSyscidSAP)
		name: self getSyscidESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGopSAN;
		description: 'Framework Attribute. Maintains a unique ID' asUnicodeString ;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getGopESAP

	^(self getGopSAP)
		name: self getGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getSysrevSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSysrevSAN;
		description: 'Framework Attribute. Maintains a revision attribute to manage optimistic locking. You must use this attribute when updating an object' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectWithIDs
getSysrevESAP

	^(self getSysrevSAP)
		name: self getSysrevESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSLicense
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <validTo> with value from modeller <>"
	validTo := DateAndTime now asUTC.
	"Attribute named <createdTS> with value from modeller <>"
	createdTS := DateAndTime now asUTC.
	"Attribute named <options> with value from modeller <>"
	options := Set new.
	"Attribute named <key> with value from modeller <>"
	key := Unicode16 new.
	"Attribute named <product> with value from modeller <>"
	product := nil.
%
category: 'model-initialize'
set compile_env: 0
method: STSLicense
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	description := nil.
	validTo := nil.
	createdTS := nil.
	key := nil.
	product := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSLicense
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
getDescription
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^description
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
setDescription: anUnicode16OrNil
	" 'anUnicode16OrNil' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16OrNil == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16OrNil asUnicodeString ].
	(_newValue = description) ifTrue:[ ^self ].
	description := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
getValidTo
	" ^<DateAndTime> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^validTo
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
setValidTo: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aDateAndTime throwMSKNullParameterException:'STSLicense>setValidTo:'.
	(aDateAndTime = validTo) ifTrue:[ ^self ].
	validTo := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
getCreatedTS
	" ^<DateAndTime> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^createdTS
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
setCreatedTS: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aDateAndTime throwMSKNullParameterException:'STSLicense>setCreatedTS:'.
	(aDateAndTime = createdTS) ifTrue:[ ^self ].
	createdTS := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
getOptions
	" ^<Set of: STSLicenseOption> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^options
%
category: 'model-public-testing'
set compile_env: 0
method: STSLicense
includesOptions: aSTSLicenseOption
	" 'aSTSLicenseOption' is assumed to be instance of class: 'STSLicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^(options includes: aSTSLicenseOption)

%
category: 'model-private-adding'
set compile_env: 0
method: STSLicense
mcAddOptions: aSTSLicenseOption otherSide: otherSideFlagBoolean
	" 'aSTSLicenseOption' is assumed to be instance of class: 'STSLicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSLicenseOption throwMSKNullParameterException:'STSLicense>mcAddOptions: %1 otherSide: %2'.

	options add: aSTSLicenseOption.
	otherSideFlagBoolean ifTrue:[ aSTSLicenseOption mcSetLicense: self otherSide: false ].
%
category: 'model-public-adding'
set compile_env: 0
method: STSLicense
addOptions: aSTSLicenseOption
	" 'aSTSLicenseOption' is assumed to be instance of class: 'STSLicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddOptions: aSTSLicenseOption otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSLicense
mcRemoveOptions: aSTSLicenseOption otherSide: otherSideFlagBoolean
	" 'aSTSLicenseOption' is assumed to be instance of class: 'STSLicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSLicenseOption throwMSKNullParameterException:'STSLicense>mcRemoveOptions: %1 otherSide: %2'.

	(options remove: aSTSLicenseOption ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
	otherSideFlagBoolean ifTrue:[ aSTSLicenseOption mcSetLicense: nil otherSide: false ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSLicense
removeOptions: aSTSLicenseOption
	" 'aSTSLicenseOption' is assumed to be instance of class: 'STSLicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveOptions: aSTSLicenseOption otherSide: true
%
category: 'model-public-searching'
set compile_env: 0
method: STSLicense
searchViaKeyOptions: keyValue


	^options detect: [ :each | each  getGop =  keyValue] ifNone:[ nil ]. 
%
category: 'model-public-searching'
set compile_env: 0
method: STSLicense
searchOptions: anObject


	^self searchViaKeyOptions: anObject getGop
%
category: 'model-public-accessing'
set compile_env: 0
method: STSLicense
_getOptions
	" ^<Set of: STSLicenseOption> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^options
%
category: 'model-private-attributes'
set compile_env: 0
method: STSLicense
mcSetOptions: aOptions otherSide: otherSideFlagBoolean
	" 'aSTSLicenseOption' is assumed to be instance of class: 'STSLicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aOptions == options) ifTrue:[ ^self ].
	(otherSideFlagBoolean and:[ options notNil ]) ifTrue:[ options mcSetLicense: nil otherSide: false ]. 

	options := aOptions. 
	sysrev := sysrev + 1. 
	(otherSideFlagBoolean and:[ aOptions notNil ]) ifTrue:[ aOptions mcSetLicense: self otherSide: false ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
setOptions: aSTSLicenseOption
	" 'aSTSLicenseOption' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetOptions: aSTSLicenseOption otherSide: true.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
getKey
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^key
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
setKey: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSLicense>setKey:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = key) ifTrue:[ ^self ].
	key := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
getProduct
	" ^<STSProduct> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^product
%
category: 'model-private-attributes'
set compile_env: 0
method: STSLicense
mcSetProduct: aProduct otherSide: otherSideFlagBoolean
	" 'aSTSProduct' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aProduct == product) ifTrue:[ ^self ].
	product notNil ifTrue:[ product mcRemoveLicense: self otherSide: false ]. 

	product := aProduct. 
	sysrev := sysrev + 1. 
	(otherSideFlagBoolean and:[ aProduct notNil ]) ifTrue:[ aProduct mcAddLicense: self otherSide: false ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSLicense
setProduct: aSTSProduct
	" 'aSTSProduct' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetProduct: aSTSProduct otherSide: true.
%
category: 'model-public-attributes-derived'
set compile_env: 0
method: STSLicense
getCustomerGop
	| temp |


	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(temp :=  self getProduct) isNil ifTrue:[ ^temp ].
	(temp :=  temp getCustomer) isNil ifTrue:[ ^temp ].
	(temp :=  temp getGop) isNil ifTrue:[ ^temp ].
	^temp

%
category: 'model-public-attributes-derived'
set compile_env: 0
method: STSLicense
getProductGop
	| temp |


	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(temp :=  self getProduct) isNil ifTrue:[ ^temp ].
	(temp :=  temp getGop) isNil ifTrue:[ ^temp ].
	^temp

%
category: 'model-support'
set compile_env: 0
classmethod: STSLicense
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLicense
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'description') ifTrue:[ ^'each.description' ].
	(apiPropertyName = 'validTo') ifTrue:[ ^'each.validTo' ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^'each.createdTS' ].
	(apiPropertyName = 'key') ifTrue:[ ^'each.key' ].
	(apiPropertyName = 'customerGop') ifTrue:[ ^'each.product.customer.gop' ].
	(apiPropertyName = 'productGop') ifTrue:[ ^'each.product.gop' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSLicense
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSLicense
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSLicense
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSLicense
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSLicense
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'description') ifFalse:[ description := nil ].
	(oldNames includes: #'validTo') ifFalse:[ validTo := DateAndTime now asUTC ].
	(oldNames includes: #'createdTS') ifFalse:[ createdTS := DateAndTime now asUTC ].
	(oldNames includes: #'options') ifFalse:[ options := Set new ].
	(oldNames includes: #'key') ifFalse:[ key := Unicode16 new ].
	(oldNames includes: #'product') ifFalse:[ product := nil ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <options> with value from modeller <>"
	options := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
getOptions
	" ^<Set of: STSAPILicenseOption> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^options
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
mcAddOptions: aSTSAPILicenseOption otherSide: otherSideFlagBoolean
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPILicenseOption throwMSKNullParameterException:'STSAPILicenseOptionListStorePL>mcAddOptions: %1 otherSide: %2'.

	options add: aSTSAPILicenseOption.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
addOptions: aSTSAPILicenseOption
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddOptions: aSTSAPILicenseOption otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
mcRemoveOptions: aSTSAPILicenseOption otherSide: otherSideFlagBoolean
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPILicenseOption throwMSKNullParameterException:'STSAPILicenseOptionListStorePL>mcRemoveOptions: %1 otherSide: %2'.

	(options remove: aSTSAPILicenseOption ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
removeOptions: aSTSAPILicenseOption
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveOptions: aSTSAPILicenseOption otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
_getOptions
	" ^<Set of: STSAPILicenseOption> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^options
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
mcSetOptions: aOptions otherSide: otherSideFlagBoolean
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOption' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aOptions == options) ifTrue:[ ^self ].

	options := aOptions. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
setOptions: aSTSAPILicenseOption
	" 'aSTSAPILicenseOption' is assumed to be instance of class: 'STSAPILicenseOptionListStorePL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetOptions: aSTSAPILicenseOption otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseOptionListStorePL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(mapping
		mapProperty: #options
		getter: [ :object | object getOptions ]
		setter: [ :object :value | object setOptions: value ]) valueSchema: #ListOfSTSAPILicenseOption.


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPILicenseOption do: [ :mapping | 
		STSAPILicenseOption pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPILicenseOption customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPILicenseOption
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getOptionsSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPILicenseOption pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
getOptionsESAN

	^'STSAPILicenseOptionListStorePLOptions'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseOptionListStorePL
getOptionsSAN

	^'options'

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRCustomerListStore
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRCustomerListStore
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRCustomerListStore
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRCustomerListStore
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRCustomerListStore
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getLimitESAN

	^'STSAPIPRCustomerListStoreLimit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getLimitSAN

	^'limit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getStartESAN

	^'STSAPIPRCustomerListStoreStart'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getStartSAN

	^'start'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getPageESAN

	^'STSAPIPRCustomerListStorePage'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getPageSAN

	^'page'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getGsqueryESAN

	^'STSAPIPRCustomerListStoreGsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getGsquerySAN

	^'gsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getSortESAN

	^'STSAPIPRCustomerListStoreSort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getSortSAN

	^'sort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getFilterESAN

	^'STSAPIPRCustomerListStoreFilter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getFilterSAN

	^'filter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getLimitSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLimitSAN;
		description: 'Framework Attribute. Answer the maximum number of objects in the returned list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getLimitESAP

	^(self getLimitSAP)
		name: self getLimitESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getStartSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getStartSAN;
		description: 'Framework Attribute. Returns the offset of the first element in the returned list within the total result list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getStartESAP

	^(self getStartSAP)
		name: self getStartESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getPageSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPageSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getPageESAP

	^(self getPageSAP)
		name: self getPageESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getGsquerySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGsquerySAN;
		description: 'When set, this helds a complete gsquery string' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getGsqueryESAP

	^(self getGsquerySAP)
		name: self getGsqueryESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getSortSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSortSAN;
		description: 'Sorting description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getSortESAP

	^(self getSortSAP)
		name: self getSortESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getFilterSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getFilterSAN;
		description: 'Filter description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRCustomerListStore
getFilterESAP

	^(self getFilterSAP)
		name: self getFilterESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIUserListStoreRL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <users> with value from modeller <>"
	users := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIUserListStoreRL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIUserListStoreRL
getUsers
	" ^<Set of: STSAPIApplicationUser> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^users
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPIUserListStoreRL
mcAddUsers: aSTSAPIApplicationUser otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPIApplicationUser throwMSKNullParameterException:'STSAPIUserListStoreRL>mcAddUsers: %1 otherSide: %2'.

	users add: aSTSAPIApplicationUser.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPIUserListStoreRL
addUsers: aSTSAPIApplicationUser
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddUsers: aSTSAPIApplicationUser otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPIUserListStoreRL
mcRemoveUsers: aSTSAPIApplicationUser otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPIApplicationUser throwMSKNullParameterException:'STSAPIUserListStoreRL>mcRemoveUsers: %1 otherSide: %2'.

	(users remove: aSTSAPIApplicationUser ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPIUserListStoreRL
removeUsers: aSTSAPIApplicationUser
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveUsers: aSTSAPIApplicationUser otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPIUserListStoreRL
_getUsers
	" ^<Set of: STSAPIApplicationUser> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^users
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPIUserListStoreRL
mcSetUsers: aUsers otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aUsers == users) ifTrue:[ ^self ].

	users := aUsers. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIUserListStoreRL
setUsers: aSTSAPIApplicationUser
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIUserListStoreRL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetUsers: aSTSAPIApplicationUser otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
withAPIList: returnedListOfObjects total: totalListOfObjects

		^(super withAPITotalList: totalListOfObjects)
			setUsers: returnedListOfObjects ;
			yourself

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIUserListStoreRL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIUserListStoreRL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIUserListStoreRL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	(mapping
		mapProperty: #users
		getter: [ :object | object getUsers ]
		setter: [ :object :value | object setUsers: value ]) valueSchema: #ListOfSTSAPIApplicationUser.
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].
	mapper for: STSAPIApplicationUser do: [ :mapping | 
		STSAPIApplicationUser pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIApplicationUser customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIApplicationUser
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		addProperty: ((MSKJSONProperty named: self getUsersSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPIApplicationUser pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getTotalESAN

	^'STSAPIUserListStoreRLTotal'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getTotalSAN

	^'total'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getSuccessESAN

	^'STSAPIUserListStoreRLSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getErrorESAN

	^'STSAPIUserListStoreRLError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgssESAN

	^'STSAPIUserListStoreRLDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgapiESAN

	^'STSAPIUserListStoreRLDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgmsESAN

	^'STSAPIUserListStoreRLDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getUsersESAN

	^'STSAPIUserListStoreRLUsers'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getUsersSAN

	^'users'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbglocESAN

	^'STSAPIUserListStoreRLDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbtsESAN

	^'STSAPIUserListStoreRLDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getTotalSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTotalSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStoreRL
getTotalESAP

	^(self getTotalSAP)
		name: self getTotalESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRUserListStore
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRUserListStore
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIPRUserListStore
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRUserListStore
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRUserListStore
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRUserListStore
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRUserListStore
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRUserListStore
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRUserListStore
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getLimitESAN

	^'STSAPIPRUserListStoreLimit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getLimitSAN

	^'limit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getStartESAN

	^'STSAPIPRUserListStoreStart'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getStartSAN

	^'start'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getPageESAN

	^'STSAPIPRUserListStorePage'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getPageSAN

	^'page'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getGsqueryESAN

	^'STSAPIPRUserListStoreGsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getGsquerySAN

	^'gsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getSortESAN

	^'STSAPIPRUserListStoreSort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getSortSAN

	^'sort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getFilterESAN

	^'STSAPIPRUserListStoreFilter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getFilterSAN

	^'filter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getLimitSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLimitSAN;
		description: 'Framework Attribute. Answer the maximum number of objects in the returned list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getLimitESAP

	^(self getLimitSAP)
		name: self getLimitESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getStartSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getStartSAN;
		description: 'Framework Attribute. Returns the offset of the first element in the returned list within the total result list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getStartESAP

	^(self getStartSAP)
		name: self getStartESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getPageSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPageSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getPageESAP

	^(self getPageSAP)
		name: self getPageESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getGsquerySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGsquerySAN;
		description: 'When set, this helds a complete gsquery string' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getGsqueryESAP

	^(self getGsquerySAP)
		name: self getGsqueryESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getSortSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSortSAN;
		description: 'Sorting description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getSortESAP

	^(self getSortSAP)
		name: self getSortESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getFilterSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getFilterSAN;
		description: 'Filter description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRUserListStore
getFilterESAP

	^(self getFilterSAP)
		name: self getFilterESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseListStoreRL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <licenses> with value from modeller <>"
	licenses := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicenseListStoreRL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseListStoreRL
getLicenses
	" ^<Set of: STSAPILicense> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^licenses
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPILicenseListStoreRL
mcAddLicenses: aSTSAPILicense otherSide: otherSideFlagBoolean
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPILicense throwMSKNullParameterException:'STSAPILicenseListStoreRL>mcAddLicenses: %1 otherSide: %2'.

	licenses add: aSTSAPILicense.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPILicenseListStoreRL
addLicenses: aSTSAPILicense
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddLicenses: aSTSAPILicense otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPILicenseListStoreRL
mcRemoveLicenses: aSTSAPILicense otherSide: otherSideFlagBoolean
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPILicense throwMSKNullParameterException:'STSAPILicenseListStoreRL>mcRemoveLicenses: %1 otherSide: %2'.

	(licenses remove: aSTSAPILicense ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPILicenseListStoreRL
removeLicenses: aSTSAPILicense
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveLicenses: aSTSAPILicense otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPILicenseListStoreRL
_getLicenses
	" ^<Set of: STSAPILicense> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^licenses
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPILicenseListStoreRL
mcSetLicenses: aLicenses otherSide: otherSideFlagBoolean
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aLicenses == licenses) ifTrue:[ ^self ].

	licenses := aLicenses. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicenseListStoreRL
setLicenses: aSTSAPILicense
	" 'aSTSAPILicense' is assumed to be instance of class: 'STSAPILicenseListStoreRL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetLicenses: aSTSAPILicense otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
withAPIList: returnedListOfObjects total: totalListOfObjects

		^(super withAPITotalList: totalListOfObjects)
			setLicenses: returnedListOfObjects ;
			yourself

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseListStoreRL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseListStoreRL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicenseListStoreRL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	(mapping
		mapProperty: #licenses
		getter: [ :object | object getLicenses ]
		setter: [ :object :value | object setLicenses: value ]) valueSchema: #ListOfSTSAPILicense.
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].
	mapper for: STSAPILicense do: [ :mapping | 
		STSAPILicense pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPILicense customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPILicense
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		addProperty: ((MSKJSONProperty named: self getLicensesSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPILicense pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getTotalESAN

	^'STSAPILicenseListStoreRLTotal'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getTotalSAN

	^'total'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getSuccessESAN

	^'STSAPILicenseListStoreRLSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getErrorESAN

	^'STSAPILicenseListStoreRLError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgssESAN

	^'STSAPILicenseListStoreRLDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgapiESAN

	^'STSAPILicenseListStoreRLDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgmsESAN

	^'STSAPILicenseListStoreRLDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getLicensesESAN

	^'STSAPILicenseListStoreRLLicenses'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getLicensesSAN

	^'licenses'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbglocESAN

	^'STSAPILicenseListStoreRLDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbtsESAN

	^'STSAPILicenseListStoreRLDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getTotalSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTotalSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicenseListStoreRL
getTotalESAP

	^(self getTotalSAP)
		name: self getTotalESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIApplicationUser
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <role> with value from modeller <>"
	role := UndefinedObject.
	"Attribute named <password> with value from modeller <>"
	password := UndefinedObject.
	"Attribute named <login> with value from modeller <>"
	login := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIApplicationUser
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	role := nil.
	password := nil.
	login := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationUser
getRole
	" ^<(Integer | UndefinedObject)>  Value is assumed to be enum value of class: 'STSUserRole'"
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^role
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationUser
setRole: anInteger
	" 'anInteger' is assumed to be enum value of class: 'STSUserRole' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = role) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger pumIsSuitableEnumerationValue not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'role';
			className: 'STSAPIApplicationUser';
			expectedType:'Integer';
			receivedType: anInteger class name asString; 
			signal.
	].

	role := anInteger ifNotNil:[ anInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationUser
getPassword
	" ^<(Integer | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^password
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationUser
setPassword: anInteger
	" 'anInteger' is assumed to be instance of class: 'LargeInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = password) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'password';
			className: 'STSAPIApplicationUser';
			expectedType:'LargeInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	password := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationUser
getLogin
	" ^<(String | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^login
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIApplicationUser
setLogin: aString
	" 'aString' is assumed to be instance of class: 'String' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (aString == nil) ifTrue:[ nil ] ifFalse:[ aString asString ].
	(_newValue = login) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'login';
			className: 'STSAPIApplicationUser';
			expectedType:'String';
			receivedType: _newValue class name asString; 
			signal.
	].

	login := _newValue .
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'role') ifTrue:[ ^'each.role' ].
	(apiPropertyName = 'password') ifTrue:[ ^'each.password' ].
	(apiPropertyName = 'login') ifTrue:[ ^'each.login' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'role') ifTrue:[ ^[ :each | STSUserRole stringToValue: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
copyFrom: aSTSApplicationUser

	| newInstance temp |

	newInstance := self newInitialized setAllAttributesToNil ; yourself.
	newInstance setRole: aSTSApplicationUser getRole.
	newInstance setSysrev: aSTSApplicationUser getSysrev.
	newInstance setLogin: aSTSApplicationUser getLogin.
	newInstance setPassword: aSTSApplicationUser getPassword.
	newInstance setGop: aSTSApplicationUser getGop.
	newInstance setSyscid: aSTSApplicationUser getGop.
	"call-out for user code - please write your own specific primCopyFromDomain:"
	^newInstance primCopyFromDomain: aSTSApplicationUser

%
category: 'model-support'
set compile_env: 0
method: STSAPIApplicationUser
copyTo: aSTSApplicationUser

	| temp oldRevision |

	oldRevision := aSTSApplicationUser getSysrev.
	(temp := self getRole) isNil ifTrue: [ ^'Enumeration Attribute value invalid: role' ].
	(temp := self getRole) ~= UndefinedObject ifTrue: [ aSTSApplicationUser setRole: temp].
	(temp := self getLogin) ~= UndefinedObject ifTrue: [ aSTSApplicationUser setLogin: temp].
	(temp := self getPassword) ~= UndefinedObject ifTrue: [ aSTSApplicationUser setPassword: temp].
	(temp := self getGop) ~= UndefinedObject ifTrue: [ aSTSApplicationUser setGop: temp].
	"we correct the multiple increment to help Sencha to stay synchronous"
	oldRevision < aSTSApplicationUser getSysrev ifTrue:[ aSTSApplicationUser setSysrev: (oldRevision + 1) ].
	"call-out for user code - please write your own specific primCopyFromAPIToDomain:"
	^self primCopyFromAPIToDomain: aSTSApplicationUser

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'role') ifTrue:[ ^'getRole' ].
	(apiPropertyName = 'password') ifTrue:[ ^'getPassword' ].
	(apiPropertyName = 'login') ifTrue:[ ^'getLogin' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIApplicationUser
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIApplicationUser
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIApplicationUser
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #role
			getter: [ :object | | value | (value := object getRole) ifNotNil:[ STSUserRole valueToString: value ]]
			setter: [ :object :value | value ifNotNil:[ object setRole: (STSUserRole stringToValue: value) ]].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #login
		getter: [ :object | object getLogin ]
		setter: [ :object :value | object setLogin: value ].
	mapping
		mapProperty: #password
		getter: [ :object | object getPassword ]
		setter: [ :object :value | object setPassword: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #login
		getter: [ :object | object getLogin ]
		setter: [ :object :value | object setLogin: value ].
	mapping
		mapProperty: #role
			getter: [ :object | | value | (value := object getRole) ifNotNil:[ STSUserRole valueToString: value ]]
			setter: [ :object :value | value ifNotNil:[ object setRole: (STSUserRole stringToValue: value) ]].
	mapping
		mapProperty: #password
		getter: [ :object | object getPassword ]
		setter: [ :object :value | object setPassword: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIApplicationUser
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getRoleSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getLoginSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPasswordSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getRoleSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getPasswordSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getLoginSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getLoginESAN

	^'STSAPIApplicationUserLogin'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getLoginSAN

	^'login'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getRoleESAN

	^'STSAPIApplicationUserRole'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getRoleSAN

	^'role'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getPasswordESAN

	^'STSAPIApplicationUserPassword'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getPasswordSAN

	^'password'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getGopESAN

	^'STSAPIApplicationUserGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getGopSAN

	^'gop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getSyscidESAN

	^'STSAPIApplicationUserSyscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getSyscidSAN

	^'syscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getSysrevESAN

	^'STSAPIApplicationUserSysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getSysrevSAN

	^'sysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getSyscidSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSyscidSAN;
		description: 'Framework Attribute. Maintains a unique ID - generated on the client side' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getSyscidESAP

	^(self getSyscidSAP)
		name: self getSyscidESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGopSAN;
		description: 'Framework Attribute. Maintains a unique ID' asUnicodeString ;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getGopESAP

	^(self getGopSAP)
		name: self getGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getSysrevSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSysrevSAN;
		description: 'Framework Attribute. Maintains a revision attribute to manage optimistic locking. You must use this attribute when updating an object' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getSysrevESAP

	^(self getSysrevSAP)
		name: self getSysrevESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getRoleSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getRoleSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getRoleESAP

	^(self getRoleSAP)
		name: self getRoleESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getPasswordSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPasswordSAN;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getPasswordESAP

	^(self getPasswordSAP)
		name: self getPasswordESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getLoginSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLoginSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIApplicationUser
getLoginESAP

	^(self getLoginSAP)
		name: self getLoginESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIProductListStorePL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <products> with value from modeller <>"
	products := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIProductListStorePL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProductListStorePL
getProducts
	" ^<Set of: STSAPIProduct> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^products
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPIProductListStorePL
mcAddProducts: aSTSAPIProduct otherSide: otherSideFlagBoolean
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPIProduct throwMSKNullParameterException:'STSAPIProductListStorePL>mcAddProducts: %1 otherSide: %2'.

	products add: aSTSAPIProduct.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPIProductListStorePL
addProducts: aSTSAPIProduct
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddProducts: aSTSAPIProduct otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPIProductListStorePL
mcRemoveProducts: aSTSAPIProduct otherSide: otherSideFlagBoolean
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPIProduct throwMSKNullParameterException:'STSAPIProductListStorePL>mcRemoveProducts: %1 otherSide: %2'.

	(products remove: aSTSAPIProduct ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPIProductListStorePL
removeProducts: aSTSAPIProduct
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveProducts: aSTSAPIProduct otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPIProductListStorePL
_getProducts
	" ^<Set of: STSAPIProduct> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^products
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPIProductListStorePL
mcSetProducts: aProducts otherSide: otherSideFlagBoolean
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aProducts == products) ifTrue:[ ^self ].

	products := aProducts. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProductListStorePL
setProducts: aSTSAPIProduct
	" 'aSTSAPIProduct' is assumed to be instance of class: 'STSAPIProductListStorePL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetProducts: aSTSAPIProduct otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIProductListStorePL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProductListStorePL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProductListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProductListStorePL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProductListStorePL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProductListStorePL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProductListStorePL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProductListStorePL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(mapping
		mapProperty: #products
		getter: [ :object | object getProducts ]
		setter: [ :object :value | object setProducts: value ]) valueSchema: #ListOfSTSAPIProduct.


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProductListStorePL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIProduct do: [ :mapping | 
		STSAPIProduct pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIProduct customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIProduct
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStorePL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStorePL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStorePL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStorePL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getProductsSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPIProduct pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStorePL
getProductsESAN

	^'STSAPIProductListStorePLProducts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProductListStorePL
getProductsSAN

	^'products'

%
category: 'model-initialize'
set compile_env: 0
method: STSCustomer
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <name> with value from modeller <>"
	name := Unicode16 new.
	"Attribute named <products> with value from modeller <>"
	products := IdentitySet new.
%
category: 'model-initialize'
set compile_env: 0
method: STSCustomer
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	name := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSCustomer
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSCustomer
getName
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^name
%
category: 'model-public-attributes'
set compile_env: 0
method: STSCustomer
setName: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSCustomer>setName:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = name) ifTrue:[ ^self ].
	name := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSCustomer
getProducts
	" ^<IdentitySet of: STSProduct> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^products
%
category: 'model-public-testing'
set compile_env: 0
method: STSCustomer
includesProducts: aSTSProduct
	" 'aSTSProduct' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^(products includesIdentical: aSTSProduct)

%
category: 'model-private-adding'
set compile_env: 0
method: STSCustomer
mcAddProducts: aSTSProduct otherSide: otherSideFlagBoolean
	" 'aSTSProduct' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSProduct throwMSKNullParameterException:'STSCustomer>mcAddProducts: %1 otherSide: %2'.

	products add: aSTSProduct.
	otherSideFlagBoolean ifTrue:[ aSTSProduct mcSetCustomer: self otherSide: false ].
%
category: 'model-public-adding'
set compile_env: 0
method: STSCustomer
addProducts: aSTSProduct
	" 'aSTSProduct' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddProducts: aSTSProduct otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSCustomer
mcRemoveProducts: aSTSProduct otherSide: otherSideFlagBoolean
	" 'aSTSProduct' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSProduct throwMSKNullParameterException:'STSCustomer>mcRemoveProducts: %1 otherSide: %2'.

	(products remove: aSTSProduct ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
	otherSideFlagBoolean ifTrue:[ aSTSProduct mcSetCustomer: nil otherSide: false ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSCustomer
removeProducts: aSTSProduct
	" 'aSTSProduct' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveProducts: aSTSProduct otherSide: true
%
category: 'model-public-searching'
set compile_env: 0
method: STSCustomer
searchViaKeyProducts: keyValue


	^products detect: [ :each | each  getGop =  keyValue] ifNone:[ nil ]. 
%
category: 'model-public-searching'
set compile_env: 0
method: STSCustomer
searchProducts: anObject


	^self searchViaKeyProducts: anObject getGop
%
category: 'model-public-accessing'
set compile_env: 0
method: STSCustomer
_getProducts
	" ^<IdentitySet of: STSProduct> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^products
%
category: 'model-private-attributes'
set compile_env: 0
method: STSCustomer
mcSetProducts: aProducts otherSide: otherSideFlagBoolean
	" 'aSTSProduct' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aProducts == products) ifTrue:[ ^self ].
	(otherSideFlagBoolean and:[ products notNil ]) ifTrue:[ products mcSetCustomer: nil otherSide: false ]. 

	products := aProducts. 
	sysrev := sysrev + 1. 
	(otherSideFlagBoolean and:[ aProducts notNil ]) ifTrue:[ aProducts mcSetCustomer: self otherSide: false ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSCustomer
setProducts: aSTSProduct
	" 'aSTSProduct' is assumed to be instance of class: 'STSCustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetProducts: aSTSProduct otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSCustomer
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSCustomer
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'each.name' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSCustomer
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSCustomer
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSCustomer
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSCustomer
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSCustomer
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'name') ifFalse:[ name := Unicode16 new ].
	(oldNames includes: #'products') ifFalse:[ products := IdentitySet new ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPISessionCreationParameter
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <login> with value from modeller <>"
	login := UndefinedObject.
	"Attribute named <password> with value from modeller <>"
	password := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPISessionCreationParameter
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	login := nil.
	password := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPISessionCreationParameter
getLogin
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^login
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPISessionCreationParameter
setLogin: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSAPISessionCreationParameter>setLogin:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = login) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'login';
			className: 'STSAPISessionCreationParameter';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	login := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPISessionCreationParameter
getPassword
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^password
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPISessionCreationParameter
setPassword: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSAPISessionCreationParameter>setPassword:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = password) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'password';
			className: 'STSAPISessionCreationParameter';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	password := _newValue. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionCreationParameter
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionCreationParameter
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionCreationParameter
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #password
		getter: [ :object | object getPassword ]
		setter: [ :object :value | object setPassword: value ].
	mapping
		mapProperty: #login
		getter: [ :object | object getLogin ]
		setter: [ :object :value | object setLogin: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #password
		getter: [ :object | object getPassword ]
		setter: [ :object :value | object setPassword: value ].
	mapping
		mapProperty: #login
		getter: [ :object | object getLogin ]
		setter: [ :object :value | object setLogin: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getPasswordSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getLoginSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLoginSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPasswordSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getPasswordESAN

	^'STSAPISessionCreationParameterPassword'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getPasswordSAN

	^'password'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getLoginESAN

	^'STSAPISessionCreationParameterLogin'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getLoginSAN

	^'login'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getLoginSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLoginSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getLoginESAP

	^(self getLoginSAP)
		name: self getLoginESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getPasswordSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPasswordSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionCreationParameter
getPasswordESAP

	^(self getPasswordSAP)
		name: self getPasswordESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIUserListStorePL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <users> with value from modeller <>"
	users := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIUserListStorePL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIUserListStorePL
getUsers
	" ^<Set of: STSAPIApplicationUser> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^users
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPIUserListStorePL
mcAddUsers: aSTSAPIApplicationUser otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPIApplicationUser throwMSKNullParameterException:'STSAPIUserListStorePL>mcAddUsers: %1 otherSide: %2'.

	users add: aSTSAPIApplicationUser.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPIUserListStorePL
addUsers: aSTSAPIApplicationUser
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddUsers: aSTSAPIApplicationUser otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPIUserListStorePL
mcRemoveUsers: aSTSAPIApplicationUser otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPIApplicationUser throwMSKNullParameterException:'STSAPIUserListStorePL>mcRemoveUsers: %1 otherSide: %2'.

	(users remove: aSTSAPIApplicationUser ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPIUserListStorePL
removeUsers: aSTSAPIApplicationUser
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveUsers: aSTSAPIApplicationUser otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPIUserListStorePL
_getUsers
	" ^<Set of: STSAPIApplicationUser> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^users
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPIUserListStorePL
mcSetUsers: aUsers otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aUsers == users) ifTrue:[ ^self ].

	users := aUsers. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIUserListStorePL
setUsers: aSTSAPIApplicationUser
	" 'aSTSAPIApplicationUser' is assumed to be instance of class: 'STSAPIUserListStorePL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetUsers: aSTSAPIApplicationUser otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIUserListStorePL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIUserListStorePL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIUserListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIUserListStorePL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIUserListStorePL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIUserListStorePL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIUserListStorePL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIUserListStorePL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(mapping
		mapProperty: #users
		getter: [ :object | object getUsers ]
		setter: [ :object :value | object setUsers: value ]) valueSchema: #ListOfSTSAPIApplicationUser.


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIUserListStorePL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIApplicationUser do: [ :mapping | 
		STSAPIApplicationUser pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIApplicationUser customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIApplicationUser
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStorePL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStorePL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStorePL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStorePL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getUsersSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPIApplicationUser pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStorePL
getUsersESAN

	^'STSAPIUserListStorePLUsers'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIUserListStorePL
getUsersSAN

	^'users'

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIObjectsWithoutIDs
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIObjectsWithoutIDs
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIObjectsWithoutIDs
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIObjectsWithoutIDs
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIObjectsWithoutIDs
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIObjectsWithoutIDs
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRSessionListStore
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRSessionListStore
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRSessionListStore
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRSessionListStore
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRSessionListStore
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getLimitESAN

	^'STSAPIPRSessionListStoreLimit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getLimitSAN

	^'limit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getStartESAN

	^'STSAPIPRSessionListStoreStart'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getStartSAN

	^'start'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getPageESAN

	^'STSAPIPRSessionListStorePage'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getPageSAN

	^'page'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getGsqueryESAN

	^'STSAPIPRSessionListStoreGsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getGsquerySAN

	^'gsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getSortESAN

	^'STSAPIPRSessionListStoreSort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getSortSAN

	^'sort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getFilterESAN

	^'STSAPIPRSessionListStoreFilter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getFilterSAN

	^'filter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getLimitSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLimitSAN;
		description: 'Framework Attribute. Answer the maximum number of objects in the returned list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getLimitESAP

	^(self getLimitSAP)
		name: self getLimitESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getStartSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getStartSAN;
		description: 'Framework Attribute. Returns the offset of the first element in the returned list within the total result list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getStartESAP

	^(self getStartSAP)
		name: self getStartESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getPageSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPageSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getPageESAP

	^(self getPageSAP)
		name: self getPageESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getGsquerySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGsquerySAN;
		description: 'When set, this helds a complete gsquery string' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getGsqueryESAP

	^(self getGsquerySAP)
		name: self getGsqueryESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getSortSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSortSAN;
		description: 'Sorting description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getSortESAP

	^(self getSortSAP)
		name: self getSortESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getFilterSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getFilterSAN;
		description: 'Filter description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRSessionListStore
getFilterESAP

	^(self getFilterSAP)
		name: self getFilterESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPISessionListStoreRL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <sessions> with value from modeller <>"
	sessions := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPISessionListStoreRL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPISessionListStoreRL
getSessions
	" ^<Set of: STSAPIApplicationSession> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^sessions
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPISessionListStoreRL
mcAddSessions: aSTSAPIApplicationSession otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPIApplicationSession throwMSKNullParameterException:'STSAPISessionListStoreRL>mcAddSessions: %1 otherSide: %2'.

	sessions add: aSTSAPIApplicationSession.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPISessionListStoreRL
addSessions: aSTSAPIApplicationSession
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddSessions: aSTSAPIApplicationSession otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPISessionListStoreRL
mcRemoveSessions: aSTSAPIApplicationSession otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPIApplicationSession throwMSKNullParameterException:'STSAPISessionListStoreRL>mcRemoveSessions: %1 otherSide: %2'.

	(sessions remove: aSTSAPIApplicationSession ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPISessionListStoreRL
removeSessions: aSTSAPIApplicationSession
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveSessions: aSTSAPIApplicationSession otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPISessionListStoreRL
_getSessions
	" ^<Set of: STSAPIApplicationSession> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^sessions
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPISessionListStoreRL
mcSetSessions: aSessions otherSide: otherSideFlagBoolean
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPIApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aSessions == sessions) ifTrue:[ ^self ].

	sessions := aSessions. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPISessionListStoreRL
setSessions: aSTSAPIApplicationSession
	" 'aSTSAPIApplicationSession' is assumed to be instance of class: 'STSAPISessionListStoreRL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetSessions: aSTSAPIApplicationSession otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
withAPIList: returnedListOfObjects total: totalListOfObjects

		^(super withAPITotalList: totalListOfObjects)
			setSessions: returnedListOfObjects ;
			yourself

%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionListStoreRL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionListStoreRL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPISessionListStoreRL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	(mapping
		mapProperty: #sessions
		getter: [ :object | object getSessions ]
		setter: [ :object :value | object setSessions: value ]) valueSchema: #ListOfSTSAPIApplicationSession.
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].
	mapper for: STSAPIApplicationSession do: [ :mapping | 
		STSAPIApplicationSession pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIApplicationSession customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIApplicationSession
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		addProperty: ((MSKJSONProperty named: self getSessionsSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPIApplicationSession pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getTotalESAN

	^'STSAPISessionListStoreRLTotal'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getTotalSAN

	^'total'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getSuccessESAN

	^'STSAPISessionListStoreRLSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getErrorESAN

	^'STSAPISessionListStoreRLError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgssESAN

	^'STSAPISessionListStoreRLDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgapiESAN

	^'STSAPISessionListStoreRLDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgmsESAN

	^'STSAPISessionListStoreRLDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getSessionsESAN

	^'STSAPISessionListStoreRLSessions'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getSessionsSAN

	^'sessions'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbglocESAN

	^'STSAPISessionListStoreRLDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbtsESAN

	^'STSAPISessionListStoreRLDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getTotalSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTotalSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPISessionListStoreRL
getTotalESAP

	^(self getTotalSAP)
		name: self getTotalESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSProject
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <applicationSession> with value from modeller <>"
	applicationSession := Array new.
	"Attribute named <applicationUser> with value from modeller <>"
	applicationUser := Array new.
	"Attribute named <sessionTimeoutInMS> with value from modeller <30 * 60 * 1000>"
	sessionTimeoutInMS := 30 * 60 * 1000.
	"Attribute named <debugMode> with value from modeller <true>"
	debugMode := true.
	"Attribute named <unhandledUsageMessages> with value from modeller <>"
	unhandledUsageMessages := RcQueue new.
%
category: 'model-initialize'
set compile_env: 0
method: STSProject
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	sessionTimeoutInMS := nil.
	debugMode := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSProject
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
getApplicationSession
	" ^<Array of: STSApplicationSession> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^applicationSession
%
category: 'model-public-testing'
set compile_env: 0
method: STSProject
includesApplicationSession: aSTSApplicationSession
	" 'aSTSApplicationSession' is assumed to be instance of class: 'STSApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^(applicationSession includes: aSTSApplicationSession)

%
category: 'model-private-adding'
set compile_env: 0
method: STSProject
mcAddApplicationSession: aSTSApplicationSession otherSide: otherSideFlagBoolean
	" 'aSTSApplicationSession' is assumed to be instance of class: 'STSApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSApplicationSession throwMSKNullParameterException:'STSProject>mcAddApplicationSession: %1 otherSide: %2'.

	applicationSession add: aSTSApplicationSession.
%
category: 'model-public-adding'
set compile_env: 0
method: STSProject
addApplicationSession: aSTSApplicationSession
	" 'aSTSApplicationSession' is assumed to be instance of class: 'STSApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddApplicationSession: aSTSApplicationSession otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSProject
mcRemoveApplicationSession: aSTSApplicationSession otherSide: otherSideFlagBoolean
	" 'aSTSApplicationSession' is assumed to be instance of class: 'STSApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSApplicationSession throwMSKNullParameterException:'STSProject>mcRemoveApplicationSession: %1 otherSide: %2'.

	(applicationSession remove: aSTSApplicationSession ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSProject
removeApplicationSession: aSTSApplicationSession
	" 'aSTSApplicationSession' is assumed to be instance of class: 'STSApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveApplicationSession: aSTSApplicationSession otherSide: true
%
category: 'model-public-searching'
set compile_env: 0
method: STSProject
searchViaKeyApplicationSession: keyValue


	^applicationSession detect: [ :each | each  getGop =  keyValue] ifNone:[ nil ]. 
%
category: 'model-public-searching'
set compile_env: 0
method: STSProject
searchApplicationSession: anObject


	^self searchViaKeyApplicationSession: anObject getGop
%
category: 'model-public-accessing'
set compile_env: 0
method: STSProject
_getApplicationSession
	" ^<Array of: STSApplicationSession> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^applicationSession
%
category: 'model-private-attributes'
set compile_env: 0
method: STSProject
mcSetApplicationSession: aApplicationSession otherSide: otherSideFlagBoolean
	" 'aSTSApplicationSession' is assumed to be instance of class: 'STSApplicationSession' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aApplicationSession == applicationSession) ifTrue:[ ^self ].

	applicationSession := aApplicationSession. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
setApplicationSession: aSTSApplicationSession
	" 'aSTSApplicationSession' is assumed to be instance of class: 'STSProject' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetApplicationSession: aSTSApplicationSession otherSide: true.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
getApplicationUser
	" ^<Array of: STSApplicationUser> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^applicationUser
%
category: 'model-public-testing'
set compile_env: 0
method: STSProject
includesApplicationUser: aSTSApplicationUser
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^(applicationUser includes: aSTSApplicationUser)

%
category: 'model-private-adding'
set compile_env: 0
method: STSProject
mcAddApplicationUser: aSTSApplicationUser otherSide: otherSideFlagBoolean
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSApplicationUser throwMSKNullParameterException:'STSProject>mcAddApplicationUser: %1 otherSide: %2'.

	applicationUser add: aSTSApplicationUser.
%
category: 'model-public-adding'
set compile_env: 0
method: STSProject
addApplicationUser: aSTSApplicationUser
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddApplicationUser: aSTSApplicationUser otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSProject
mcRemoveApplicationUser: aSTSApplicationUser otherSide: otherSideFlagBoolean
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSApplicationUser throwMSKNullParameterException:'STSProject>mcRemoveApplicationUser: %1 otherSide: %2'.

	(applicationUser remove: aSTSApplicationUser ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSProject
removeApplicationUser: aSTSApplicationUser
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveApplicationUser: aSTSApplicationUser otherSide: true
%
category: 'model-public-searching'
set compile_env: 0
method: STSProject
searchViaKeyApplicationUser: keyValue


	^applicationUser detect: [ :each | each  getGop =  keyValue] ifNone:[ nil ]. 
%
category: 'model-public-searching'
set compile_env: 0
method: STSProject
searchApplicationUser: anObject


	^self searchViaKeyApplicationUser: anObject getGop
%
category: 'model-public-accessing'
set compile_env: 0
method: STSProject
_getApplicationUser
	" ^<Array of: STSApplicationUser> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^applicationUser
%
category: 'model-private-attributes'
set compile_env: 0
method: STSProject
mcSetApplicationUser: aApplicationUser otherSide: otherSideFlagBoolean
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSApplicationUser' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aApplicationUser == applicationUser) ifTrue:[ ^self ].

	applicationUser := aApplicationUser. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
setApplicationUser: aSTSApplicationUser
	" 'aSTSApplicationUser' is assumed to be instance of class: 'STSProject' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetApplicationUser: aSTSApplicationUser otherSide: true.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
getSessionTimeoutInMS
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^sessionTimeoutInMS
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
setSessionTimeoutInMS: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSProject>setSessionTimeoutInMS:'.
	(anInteger = sessionTimeoutInMS) ifTrue:[ ^self ].
	sessionTimeoutInMS := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
getDebugMode
	" ^<Boolean> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^debugMode
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
setDebugMode: aBoolean
	" 'aBoolean' is assumed to be instance of class: 'Boolean' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aBoolean throwMSKNullParameterException:'STSProject>setDebugMode:'.
	(aBoolean = debugMode) ifTrue:[ ^self ].
	debugMode := aBoolean ifNotNil:[ aBoolean  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProject
getUnhandledUsageMessages
	" ^<RcQueue of: STSUsageMessage> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^unhandledUsageMessages
%
category: 'model-public-testing'
set compile_env: 0
method: STSProject
removeAllUnhandledUsageMessages
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	| temp |

	temp := unhandledUsageMessages removeAll.
	^temp

%
category: 'model-public-testing'
set compile_env: 0
method: STSProject
removeUnhandledUsageMessages
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	| temp |

	temp := unhandledUsageMessages remove.
	^temp

%
category: 'model-public-testing'
set compile_env: 0
method: STSProject
addUnhandledUsageMessages: aSTSUsageMessage
	" 'aSTSUsageMessage' is assumed to be instance of class: 'STSUsageMessage' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSUsageMessage throwMSKNullParameterException:'STSProject>addUnhandledUsageMessages: %1'.

	unhandledUsageMessages add: aSTSUsageMessage.

%
category: 'model-support'
set compile_env: 0
classmethod: STSProject
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSProject
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'sessionTimeoutInMS') ifTrue:[ ^'each.sessionTimeoutInMS' ].
	(apiPropertyName = 'debugMode') ifTrue:[ ^'each.debugMode' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSProject
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSProject
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSProject
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSProject
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSProject
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'applicationSession') ifFalse:[ applicationSession := Array new ].
	(oldNames includes: #'applicationUser') ifFalse:[ applicationUser := Array new ].
	(oldNames includes: #'sessionTimeoutInMS') ifFalse:[ sessionTimeoutInMS := 30 * 60 * 1000 ].
	(oldNames includes: #'debugMode') ifFalse:[ debugMode := true ].
	(oldNames includes: #'unhandledUsageMessages') ifFalse:[ unhandledUsageMessages := RcQueue new ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIGeneralParameterObject
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIGeneralParameterObject
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralParameterObject
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralParameterObject
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralParameterObject
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralParameterObject
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPagedRequest
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <limit> with value from modeller <>"
	limit := UndefinedObject.
	"Attribute named <start> with value from modeller <>"
	start := UndefinedObject.
	"Attribute named <page> with value from modeller <>"
	page := UndefinedObject.
	"Attribute named <gsquery> with value from modeller <>"
	gsquery := UndefinedObject.
	"Attribute named <sort> with value from modeller <>"
	sort := UndefinedObject.
	"Attribute named <filter> with value from modeller <>"
	filter := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPagedRequest
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	limit := nil.
	start := nil.
	page := nil.
	gsquery := nil.
	sort := nil.
	filter := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
getLimit
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^limit
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
setLimit: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSAPIPagedRequest>setLimit:'.
	(anInteger = limit) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'limit';
			className: 'STSAPIPagedRequest';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	limit := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
getStart
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^start
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
setStart: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSAPIPagedRequest>setStart:'.
	(anInteger = start) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'start';
			className: 'STSAPIPagedRequest';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	start := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
getPage
	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^page
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
setPage: anInteger
	" 'anInteger' is assumed to be instance of class: 'SmallInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSAPIPagedRequest>setPage:'.
	(anInteger = page) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'page';
			className: 'STSAPIPagedRequest';
			expectedType:'SmallInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	page := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
getGsquery
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^gsquery
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
setGsquery: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSAPIPagedRequest>setGsquery:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = gsquery) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'gsquery';
			className: 'STSAPIPagedRequest';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	gsquery := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
getSort
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^sort
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
setSort: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSAPIPagedRequest>setSort:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = sort) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'sort';
			className: 'STSAPIPagedRequest';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	sort := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
getFilter
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^filter
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIPagedRequest
setFilter: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSAPIPagedRequest>setFilter:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = filter) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'filter';
			className: 'STSAPIPagedRequest';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	filter := _newValue. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIPagedRequest
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPagedRequest
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPagedRequest
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPagedRequest
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPagedRequest
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPagedRequest
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-helpers'
set compile_env: 0
method: STSAPIPagedRequest
getFilteringDescription

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| partialString |
	((partialString := self getFilter) isString and:[ partialString notEmpty ]) ifTrue:[ ^NeoJSONReader fromString: partialString ].
		^nil

%
category: 'framework-helpers'
set compile_env: 0
method: STSAPIPagedRequest
filterViaGsQuery: knownItems options: aMSKRestCallOptions

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| aGsQuery filteredItems |
	(self getGsquery isString and:[ self getGsquery notEmpty ]) ifFalse:[ ^knownItems ].
	[
		filteredItems := (knownItems pumIsSequenceable and:[ knownItems pumIsSortedCollection not ]) ifTrue:[ knownItems ] ifFalse:[ knownItems asArray ].
		aGsQuery := (GsQuery fromString: self getGsquery) on: filteredItems.
		filteredItems := aGsQuery asArray
	]
	on: Exception
	do: [ :ex |
		STSEnumErrorDefinitionLocaleErrorDefinition errCodeGeneralErrorThrowSignal: aMSKRestCallOptions  with1Args: (Array with: ('Parsing Error (Filter): ', ex printString))
	].
	^filteredItems

%
category: 'framework-helpers'
set compile_env: 0
method: STSAPIPagedRequest
filterViaFilterBlocks: knownItems apiClass: aClass options: aMSKRestCallOptions

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| filterArray |
	(filterArray := self buildFilterBlocksFor: aClass options: aMSKRestCallOptions ) isNil ifTrue:[ ^knownItems ].
	^knownItems select:[ :each | filterArray pumCheckBlocks: each ].

%
category: 'framework-helpers'
set compile_env: 0
method: STSAPIPagedRequest
buildFilterBlocksFor: aClass options: aMSKRestCallOptions

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| filterDescriptions   |
	(aClass isNil or:[ (filterDescriptions := self getFilteringDescription) isNil or:[ filterDescriptions isEmpty ]  ]) ifTrue:[ ^nil	].
	^filterDescriptions collect: [ :eachFilterDictionary |
		| operator propertyName propertyAccessor value blockSourceStream  conversionBlock convertedValue |
		operator := eachFilterDictionary at: 'operator' ifAbsent:[ '=' ].
		propertyName := eachFilterDictionary at: 'property' ifAbsent:[ ^nil ].
		(propertyAccessor := aClass getDomainPropertyAccessor: propertyName) isNil ifTrue:[ ^nil ]. 
		conversionBlock := aClass getDomainPropertyConversionSourcetext: propertyName.
		value := eachFilterDictionary at: 'value' ifAbsent:[ ^nil ].
		convertedValue := value pumConvertClientValue: conversionBlock.
		blockSourceStream := WriteStream on: String new.
		blockSourceStream nextPutAll: '[ :a :b |' ;  nextPutAll: ' a ' ; nextPutAll: propertyAccessor. 
		operator = '<' ifTrue:[ blockSourceStream nextPutAll: ' pumIsSmallerThan: b ]' ].
		operator = '<=' ifTrue:[blockSourceStream nextPutAll: ' pumIsSmallerOrEqualTo: b ]' ].
		operator = '=' ifTrue:[ blockSourceStream nextPutAll: ' pumIsEqualTo: b ]' ].
		operator = '==' ifTrue:[ blockSourceStream nextPutAll: ' pumIsEqualTo: b ]' ].
		operator = '>=' ifTrue:[ blockSourceStream nextPutAll: ' pumIsLargerOrEqualTo: b ]' ].
		operator = '>' ifTrue:[ blockSourceStream nextPutAll: ' pumIsLargerThan: b ]' ].
		operator = '!=' ifTrue:[ blockSourceStream nextPutAll: ' pumIsNotEqualTo: b ]' ].
		operator = 'in' ifTrue:[ blockSourceStream nextPutAll: ' pumIsIn: b ]' ].
		operator = 'notin' ifTrue:[ blockSourceStream nextPutAll: ' pumIsNotIn: b ]' ].
		operator = 'like' ifTrue:[ blockSourceStream nextPutAll: ' pumIsLike: b ]' ].
		operator = '/=' ifTrue:[ blockSourceStream nextPutAll: ' pumMatches: b ]'. convertedValue := convertedValue asRegex ].
		Array with: blockSourceStream contents evaluate with: convertedValue
	].

%
category: 'framework-helpers'
set compile_env: 0
method: STSAPIPagedRequest
getSortingDescription

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| partialString |
	((partialString := self getSort) isString and:[ partialString notEmpty ]) ifTrue:[ ^NeoJSONReader fromString: partialString ].
		^nil

%
category: 'framework-helpers'
set compile_env: 0
method: STSAPIPagedRequest
sort: knownItems apiClass: aClass defaultBlock: sortBlockNotNil options: aMSKRestCallOptions

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| sortedCollection |
	(sortedCollection := self buildSortingCollectionFor: aClass defaultBlock: sortBlockNotNil) isNil ifTrue:[ ^knownItems isSequenceable ifTrue:[ knownItems] ifFalse:[ knownItems asOrderedCollection ]].
	^sortedCollection addAll: knownItems ; yourself

%
category: 'framework-helpers'
set compile_env: 0
method: STSAPIPagedRequest
buildSortingCollectionFor: domainClass defaultBlock: defaultBlock

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	|  sortingDescription blockSourceStream firstDescription propertyAccessor propertyName direction |
	(domainClass isNil or:[ (sortingDescription := self getSortingDescription) isNil or:[ sortingDescription isEmpty ]  ]) 
		ifTrue:[ ^defaultBlock isNil ifTrue:[ nil ] ifFalse:[ SortedCollection sortBlock: defaultBlock ]	].
	firstDescription := sortingDescription first.
	direction := firstDescription at: 'direction' ifAbsent:[  'ASC' ].
	propertyName :=  firstDescription at: 'property' ifAbsent:[ ^defaultBlock isNil ifTrue:[ nil ] ifFalse:[ SortedCollection sortBlock: defaultBlock ] ].
	(propertyAccessor := domainClass getDomainPropertyAccessor: propertyName) isNil ifTrue:[  ^SortedCollection sortBlock: defaultBlock ]. 
	blockSourceStream := WriteStream on: String new.
	blockSourceStream nextPutAll: '[ :a :b |' ;  nextPutAll: ' a  '; nextPutAll: propertyAccessor ; nextPutAll: ((direction = 'ASC') ifTrue:[ ' pumIsSmallerThan: ' ] ifFalse:[ ' pumIsLargerThan: ' ]) ; nextPutAll: ' b ' ; nextPutAll: propertyAccessor ;  nextPutAll: ' ]'.  
	^SortedCollection sortBlock: blockSourceStream contents evaluate.

%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPagedRequest
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPagedRequest
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPagedRequest
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getLimitESAN

	^'STSAPIPagedRequestLimit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getLimitSAN

	^'limit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getStartESAN

	^'STSAPIPagedRequestStart'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getStartSAN

	^'start'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getPageESAN

	^'STSAPIPagedRequestPage'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getPageSAN

	^'page'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getGsqueryESAN

	^'STSAPIPagedRequestGsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getGsquerySAN

	^'gsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getSortESAN

	^'STSAPIPagedRequestSort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getSortSAN

	^'sort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getFilterESAN

	^'STSAPIPagedRequestFilter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getFilterSAN

	^'filter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getLimitSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLimitSAN;
		description: 'Framework Attribute. Answer the maximum number of objects in the returned list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getLimitESAP

	^(self getLimitSAP)
		name: self getLimitESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getStartSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getStartSAN;
		description: 'Framework Attribute. Returns the offset of the first element in the returned list within the total result list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getStartESAP

	^(self getStartSAP)
		name: self getStartESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getPageSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPageSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getPageESAP

	^(self getPageSAP)
		name: self getPageESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getGsquerySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGsquerySAN;
		description: 'When set, this helds a complete gsquery string' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getGsqueryESAP

	^(self getGsquerySAP)
		name: self getGsqueryESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getSortSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSortSAN;
		description: 'Sorting description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getSortESAP

	^(self getSortSAP)
		name: self getSortESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getFilterSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getFilterSAN;
		description: 'Filter description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPagedRequest
getFilterESAP

	^(self getFilterSAP)
		name: self getFilterESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPICustomerListStoreRL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <customers> with value from modeller <>"
	customers := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPICustomerListStoreRL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPICustomerListStoreRL
getCustomers
	" ^<Set of: STSAPICustomer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^customers
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPICustomerListStoreRL
mcAddCustomers: aSTSAPICustomer otherSide: otherSideFlagBoolean
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPICustomer throwMSKNullParameterException:'STSAPICustomerListStoreRL>mcAddCustomers: %1 otherSide: %2'.

	customers add: aSTSAPICustomer.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPICustomerListStoreRL
addCustomers: aSTSAPICustomer
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddCustomers: aSTSAPICustomer otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPICustomerListStoreRL
mcRemoveCustomers: aSTSAPICustomer otherSide: otherSideFlagBoolean
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPICustomer throwMSKNullParameterException:'STSAPICustomerListStoreRL>mcRemoveCustomers: %1 otherSide: %2'.

	(customers remove: aSTSAPICustomer ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPICustomerListStoreRL
removeCustomers: aSTSAPICustomer
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveCustomers: aSTSAPICustomer otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPICustomerListStoreRL
_getCustomers
	" ^<Set of: STSAPICustomer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^customers
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPICustomerListStoreRL
mcSetCustomers: aCustomers otherSide: otherSideFlagBoolean
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aCustomers == customers) ifTrue:[ ^self ].

	customers := aCustomers. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPICustomerListStoreRL
setCustomers: aSTSAPICustomer
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomerListStoreRL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetCustomers: aSTSAPICustomer otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-instance-creation'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
withAPIList: returnedListOfObjects total: totalListOfObjects

		^(super withAPITotalList: totalListOfObjects)
			setCustomers: returnedListOfObjects ;
			yourself

%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomerListStoreRL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomerListStoreRL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomerListStoreRL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #total
		getter: [ :object | object getTotal ]
		setter: [ :object :value | object setTotal: value ].
	mapping
		mapProperty: #success
		getter: [ :object | object getSuccess ]
		setter: [ :object :value | object setSuccess: value ].
	(mapping
		mapProperty: #error
		getter: [ :object | object getError ]
		setter: [ :object :value | object setError: value ]) valueSchema: STSAPIError.
	(mapping
		mapProperty: #customers
		getter: [ :object | object getCustomers ]
		setter: [ :object :value | object setCustomers: value ]) valueSchema: #ListOfSTSAPICustomer.
	mapping
		mapProperty: #dbgss
		getter: [ :object | object getDbgss ]
		setter: [ :object :value | object setDbgss: value ].
	mapping
		mapProperty: #dbgapi
		getter: [ :object | object getDbgapi ]
		setter: [ :object :value | object setDbgapi: value ].
	mapping
		mapProperty: #dbgms
		getter: [ :object | object getDbgms ]
		setter: [ :object :value | object setDbgms: value ].
	mapping
		mapProperty: #dbgloc
		getter: [ :object | object getDbgloc ]
		setter: [ :object :value | object setDbgloc: value ].
	mapping
		mapProperty: #dbts
			getter: [ :object | | value | ((value := object getDbts) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setDbts: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPIError do: [ :mapping | 
		STSAPIError pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPIError customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPIError
	].
	mapper for: STSAPICustomer do: [ :mapping | 
		STSAPICustomer pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPICustomer customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPICustomer
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getDbgapiSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbglocSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgssSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbgmsSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDbtsSAN)
						required: true;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSuccessSAN)
						required: true;
						generalType: MSKJSONBooleanType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getTotalSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getErrorSAN)
						required: false;
						generalType: (MSKJSONReferenceType with: STSAPIError pumFullSwaggerModel);
						yourself);
		addProperty: ((MSKJSONProperty named: self getCustomersSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPICustomer pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getTotalESAN

	^'STSAPICustomerListStoreRLTotal'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getTotalSAN

	^'total'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getSuccessESAN

	^'STSAPICustomerListStoreRLSuccess'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getSuccessSAN

	^'success'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getErrorESAN

	^'STSAPICustomerListStoreRLError'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getErrorSAN

	^'error'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getCustomersESAN

	^'STSAPICustomerListStoreRLCustomers'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getCustomersSAN

	^'customers'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgssESAN

	^'STSAPICustomerListStoreRLDbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgssSAN

	^'dbgss'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgapiESAN

	^'STSAPICustomerListStoreRLDbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgapiSAN

	^'dbgapi'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgmsESAN

	^'STSAPICustomerListStoreRLDbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgmsSAN

	^'dbgms'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbglocESAN

	^'STSAPICustomerListStoreRLDbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbglocSAN

	^'dbgloc'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbtsESAN

	^'STSAPICustomerListStoreRLDbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbtsSAN

	^'dbts'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgapiSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgapiSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgapiESAP

	^(self getDbgapiSAP)
		name: self getDbgapiESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbglocSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbglocSAN;
		description: 'Framework Attribute. Execution path of the request' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbglocESAP

	^(self getDbglocSAP)
		name: self getDbglocESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgssSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgssSAN;
		description: 'Framework Attribute. Gemstone session number creating this answer' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgssESAP

	^(self getDbgssSAP)
		name: self getDbgssESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgmsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbgmsSAN;
		description: 'Framework Attribute. Milliseconds this request had run on the server' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbgmsESAP

	^(self getDbgmsSAP)
		name: self getDbgmsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbtsSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDbtsSAN;
		description: 'Framework Attribute. Timestamp when the request ran at the server' asUnicodeString ;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getDbtsESAP

	^(self getDbtsSAP)
		name: self getDbtsESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getSuccessSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSuccessSAN;
		description: 'Framework Attribute. Returns true if the operation works with success' asUnicodeString ;
		dataType: 'boolean';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getSuccessESAP

	^(self getSuccessSAP)
		name: self getSuccessESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getTotalSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getTotalSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStoreRL
getTotalESAP

	^(self getTotalSAP)
		name: self getTotalESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPICustomerListStorePL
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <customers> with value from modeller <>"
	customers := Set new.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPICustomerListStorePL
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPICustomerListStorePL
getCustomers
	" ^<Set of: STSAPICustomer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^customers
%
category: 'model-private-adding'
set compile_env: 0
method: STSAPICustomerListStorePL
mcAddCustomers: aSTSAPICustomer otherSide: otherSideFlagBoolean
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSAPICustomer throwMSKNullParameterException:'STSAPICustomerListStorePL>mcAddCustomers: %1 otherSide: %2'.

	customers add: aSTSAPICustomer.
%
category: 'model-public-adding'
set compile_env: 0
method: STSAPICustomerListStorePL
addCustomers: aSTSAPICustomer
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddCustomers: aSTSAPICustomer otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSAPICustomerListStorePL
mcRemoveCustomers: aSTSAPICustomer otherSide: otherSideFlagBoolean
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSAPICustomer throwMSKNullParameterException:'STSAPICustomerListStorePL>mcRemoveCustomers: %1 otherSide: %2'.

	(customers remove: aSTSAPICustomer ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSAPICustomerListStorePL
removeCustomers: aSTSAPICustomer
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveCustomers: aSTSAPICustomer otherSide: true
%
category: 'model-public-accessing'
set compile_env: 0
method: STSAPICustomerListStorePL
_getCustomers
	" ^<Set of: STSAPICustomer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^customers
%
category: 'model-private-attributes'
set compile_env: 0
method: STSAPICustomerListStorePL
mcSetCustomers: aCustomers otherSide: otherSideFlagBoolean
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aCustomers == customers) ifTrue:[ ^self ].

	customers := aCustomers. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPICustomerListStorePL
setCustomers: aSTSAPICustomer
	" 'aSTSAPICustomer' is assumed to be instance of class: 'STSAPICustomerListStorePL' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetCustomers: aSTSAPICustomer otherSide: true.
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomerListStorePL
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomerListStorePL
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPICustomerListStorePL
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(mapping
		mapProperty: #customers
		getter: [ :object | object getCustomers ]
		setter: [ :object :value | object setCustomers: value ]) valueSchema: #ListOfSTSAPICustomer.


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].
	mapper for: STSAPICustomer do: [ :mapping | 
		STSAPICustomer pumFullSwaggerModelNeoJsonMapping: mapping
	].
	mapper for: #ListOfSTSAPICustomer customDo: [ :mapping | 
		mapping listOfType: OrderedCollection andElementSchema: STSAPICustomer
	].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getCustomersSAN)
						required: false;
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: STSAPICustomer pumFullSwaggerModel));
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
getCustomersESAN

	^'STSAPICustomerListStorePLCustomers'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPICustomerListStorePL
getCustomersSAN

	^'customers'

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIGeneralObject
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIGeneralObject
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^self getDomainPropertyAccessorPathManual: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
getDomainPropertyAccessorPathManual: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^nil 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^[ :each | each ] 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralObject
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralObject
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIGeneralObject
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSAPIGeneralObject
neoJsonMapping: mapper

	self pumFullNeoJsonMapping: mapper
%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "



%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIGeneralObject
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralObject
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralObject
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralObject
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIGeneralObject
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRLogEntryListStore
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

%
category: 'model-initialize'
set compile_env: 0
method: STSAPIPRLogEntryListStore
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLogEntryListStore
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLogEntryListStore
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIPRLogEntryListStore
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #limit
		getter: [ :object | object getLimit ]
		setter: [ :object :value | object setLimit: value ].
	mapping
		mapProperty: #start
		getter: [ :object | object getStart ]
		setter: [ :object :value | object setStart: value ].
	mapping
		mapProperty: #page
		getter: [ :object | object getPage ]
		setter: [ :object :value | object setPage: value ].
	mapping
		mapProperty: #gsquery
		getter: [ :object | object getGsquery ]
		setter: [ :object :value | object setGsquery: value ].
	mapping
		mapProperty: #sort
		getter: [ :object | object getSort ]
		setter: [ :object :value | object setSort: value ].
	mapping
		mapProperty: #filter
		getter: [ :object | object getFilter ]
		setter: [ :object :value | object setFilter: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getLimitSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getStartSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getPageSAN)
						required: true;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGsquerySAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSortSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getFilterSAN)
						required: true;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getLimitESAN

	^'STSAPIPRLogEntryListStoreLimit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getLimitSAN

	^'limit'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getStartESAN

	^'STSAPIPRLogEntryListStoreStart'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getStartSAN

	^'start'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getPageESAN

	^'STSAPIPRLogEntryListStorePage'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getPageSAN

	^'page'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getGsqueryESAN

	^'STSAPIPRLogEntryListStoreGsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getGsquerySAN

	^'gsquery'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getSortESAN

	^'STSAPIPRLogEntryListStoreSort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getSortSAN

	^'sort'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getFilterESAN

	^'STSAPIPRLogEntryListStoreFilter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getFilterSAN

	^'filter'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getLimitSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getLimitSAN;
		description: 'Framework Attribute. Answer the maximum number of objects in the returned list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getLimitESAP

	^(self getLimitSAP)
		name: self getLimitESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getStartSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getStartSAN;
		description: 'Framework Attribute. Returns the offset of the first element in the returned list within the total result list' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getStartESAP

	^(self getStartSAP)
		name: self getStartESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getPageSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getPageSAN;
		description: 'Framework Attribute. Returns the total number of entries in the list ' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getPageESAP

	^(self getPageSAP)
		name: self getPageESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getGsquerySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGsquerySAN;
		description: 'When set, this helds a complete gsquery string' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getGsqueryESAP

	^(self getGsquerySAP)
		name: self getGsqueryESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getSortSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSortSAN;
		description: 'Sorting description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getSortESAP

	^(self getSortSAP)
		name: self getSortESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getFilterSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getFilterSAN;
		description: 'Filter description as a json based string - definition follows extjs definition' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIPRLogEntryListStore
getFilterESAP

	^(self getFilterSAP)
		name: self getFilterESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicense
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <customerGop> with value from modeller <>"
	customerGop := UndefinedObject.
	"Attribute named <validTo> with value from modeller <>"
	validTo := UndefinedObject.
	"Attribute named <productGop> with value from modeller <>"
	productGop := UndefinedObject.
	"Attribute named <key> with value from modeller <>"
	key := UndefinedObject.
	"Attribute named <description> with value from modeller <>"
	description := UndefinedObject.
	"Attribute named <createdTS> with value from modeller <>"
	createdTS := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPILicense
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	customerGop := nil.
	validTo := nil.
	productGop := nil.
	key := nil.
	description := nil.
	createdTS := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
getCustomerGop
	" ^<(Integer | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^customerGop
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
setCustomerGop: anInteger
	" 'anInteger' is assumed to be instance of class: 'LargeInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = customerGop) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'customerGop';
			className: 'STSAPILicense';
			expectedType:'LargeInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	customerGop := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
getValidTo
	" ^<(DateAndTime | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^validTo
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
setValidTo: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aDateAndTime = validTo) ifTrue:[ ^self ].

	(aDateAndTime notNil and:[ aDateAndTime pumIsTimestamp not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'validTo';
			className: 'STSAPILicense';
			expectedType:'DateAndTime';
			receivedType: aDateAndTime class name asString; 
			signal.
	].

	validTo := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
getProductGop
	" ^<(Integer | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^productGop
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
setProductGop: anInteger
	" 'anInteger' is assumed to be instance of class: 'LargeInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = productGop) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'productGop';
			className: 'STSAPILicense';
			expectedType:'LargeInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	productGop := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
getKey
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^key
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
setKey: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = key) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'key';
			className: 'STSAPILicense';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	key := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
getDescription
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^description
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
setDescription: anUnicode16OrNil
	" 'anUnicode16OrNil' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16OrNil == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16OrNil asUnicodeString ].
	(_newValue = description) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'description';
			className: 'STSAPILicense';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	description := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
getCreatedTS
	" ^<(DateAndTime | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^createdTS
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPILicense
setCreatedTS: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aDateAndTime = createdTS) ifTrue:[ ^self ].

	(aDateAndTime notNil and:[ aDateAndTime pumIsTimestamp not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'createdTS';
			className: 'STSAPILicense';
			expectedType:'DateAndTime';
			receivedType: aDateAndTime class name asString; 
			signal.
	].

	createdTS := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILicense
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicense
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'customerGop') ifTrue:[ ^'each.product.customer.gop' ].
	(apiPropertyName = 'validTo') ifTrue:[ ^'each.validTo' ].
	(apiPropertyName = 'productGop') ifTrue:[ ^'each.product.gop' ].
	(apiPropertyName = 'key') ifTrue:[ ^'each.key' ].
	(apiPropertyName = 'description') ifTrue:[ ^'each.description' ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^'each.createdTS' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicense
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'validTo') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^[ :each | MSKTimeStampConverter dateAndTimeUTCFromRFC3339: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPILicense
copyFrom: aSTSLicense

	| newInstance temp |

	newInstance := self newInitialized setAllAttributesToNil ; yourself.
	newInstance setValidTo: aSTSLicense getValidTo.
	newInstance setSyscid: aSTSLicense getGop.
	newInstance setProductGop: aSTSLicense getProductGop.
	newInstance setGop: aSTSLicense getGop.
	newInstance setCustomerGop: aSTSLicense getCustomerGop.
	newInstance setKey: aSTSLicense getKey.
	newInstance setDescription: aSTSLicense getDescription.
	newInstance setSysrev: aSTSLicense getSysrev.
	newInstance setCreatedTS: aSTSLicense getCreatedTS.
	"call-out for user code - please write your own specific primCopyFromDomain:"
	^newInstance primCopyFromDomain: aSTSLicense

%
category: 'model-support'
set compile_env: 0
method: STSAPILicense
copyTo: aSTSLicense

	| temp oldRevision |

	oldRevision := aSTSLicense getSysrev.
	(temp := self getValidTo) ~= UndefinedObject ifTrue: [ aSTSLicense setValidTo: temp].
	(temp := self getGop) ~= UndefinedObject ifTrue: [ aSTSLicense setGop: temp].
	(temp := self getKey) ~= UndefinedObject ifTrue: [ aSTSLicense setKey: temp].
	(temp := self getDescription) ~= UndefinedObject ifTrue: [ aSTSLicense setDescription: temp].
	(temp := self getCreatedTS) ~= UndefinedObject ifTrue: [ aSTSLicense setCreatedTS: temp].
	"we correct the multiple increment to help Sencha to stay synchronous"
	oldRevision < aSTSLicense getSysrev ifTrue:[ aSTSLicense setSysrev: (oldRevision + 1) ].
	"call-out for user code - please write your own specific primCopyFromAPIToDomain:"
	^self primCopyFromAPIToDomain: aSTSLicense

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPILicense
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'customerGop') ifTrue:[ ^'getCustomerGop' ].
	(apiPropertyName = 'validTo') ifTrue:[ ^'getValidTo' ].
	(apiPropertyName = 'productGop') ifTrue:[ ^'getProductGop' ].
	(apiPropertyName = 'key') ifTrue:[ ^'getKey' ].
	(apiPropertyName = 'description') ifTrue:[ ^'getDescription' ].
	(apiPropertyName = 'createdTS') ifTrue:[ ^'getCreatedTS' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicense
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicense
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPILicense
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicense
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #validTo
			getter: [ :object | | value | ((value := object getValidTo) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setValidTo: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #productGop
		getter: [ :object | object getProductGop ]
		setter: [ :object :value | object setProductGop: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #customerGop
		getter: [ :object | object getCustomerGop ]
		setter: [ :object :value | object setCustomerGop: value ].
	mapping
		mapProperty: #key
		getter: [ :object | object getKey ]
		setter: [ :object :value | object setKey: value ].
	mapping
		mapProperty: #description
		getter: [ :object | object getDescription ]
		setter: [ :object :value | object setDescription: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #createdTS
			getter: [ :object | | value | ((value := object getCreatedTS) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setCreatedTS: (DateAndTime fromRFC3339String: value) ]].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicense
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #createdTS
			getter: [ :object | | value | ((value := object getCreatedTS) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setCreatedTS: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #customerGop
		getter: [ :object | object getCustomerGop ]
		setter: [ :object :value | object setCustomerGop: value ].
	mapping
		mapProperty: #validTo
			getter: [ :object | | value | ((value := object getValidTo) ~= UndefinedObject and:[ value isNil not ]) ifTrue: [ value asRFC3339String ] ifFalse:[ nil ]]
			setter: [ :object :value | value ifNotNil:[ object setValidTo: (DateAndTime fromRFC3339String: value) ]].
	mapping
		mapProperty: #key
		getter: [ :object | object getKey ]
		setter: [ :object :value | object setKey: value ].
	mapping
		mapProperty: #productGop
		getter: [ :object | object getProductGop ]
		setter: [ :object :value | object setProductGop: value ].
	mapping
		mapProperty: #description
		getter: [ :object | object getDescription ]
		setter: [ :object :value | object setDescription: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPILicense
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getValidToSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getProductGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCustomerGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getKeySAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDescriptionSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCreatedTSSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCustomerGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getValidToSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getProductGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getKeySAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getDescriptionSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCreatedTSSAN)
						required: false;
						generalType: MSKJSONDateTimeType newInitialized ; 
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getSysrevESAN

	^'STSAPILicenseSysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getSysrevSAN

	^'sysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getGopESAN

	^'STSAPILicenseGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getGopSAN

	^'gop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getCreatedTSESAN

	^'STSAPILicenseCreatedTS'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getCreatedTSSAN

	^'createdTS'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getSyscidESAN

	^'STSAPILicenseSyscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getSyscidSAN

	^'syscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getCustomerGopESAN

	^'STSAPILicenseCustomerGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getCustomerGopSAN

	^'customerGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getValidToESAN

	^'STSAPILicenseValidTo'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getValidToSAN

	^'validTo'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getKeyESAN

	^'STSAPILicenseKey'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getKeySAN

	^'key'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getProductGopESAN

	^'STSAPILicenseProductGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getProductGopSAN

	^'productGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getDescriptionESAN

	^'STSAPILicenseDescription'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getDescriptionSAN

	^'description'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getSyscidSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSyscidSAN;
		description: 'Framework Attribute. Maintains a unique ID - generated on the client side' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getSyscidESAP

	^(self getSyscidSAP)
		name: self getSyscidESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGopSAN;
		description: 'Framework Attribute. Maintains a unique ID' asUnicodeString ;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getGopESAP

	^(self getGopSAP)
		name: self getGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getSysrevSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSysrevSAN;
		description: 'Framework Attribute. Maintains a revision attribute to manage optimistic locking. You must use this attribute when updating an object' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getSysrevESAP

	^(self getSysrevSAP)
		name: self getSysrevESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getCustomerGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getCustomerGopSAN;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getCustomerGopESAP

	^(self getCustomerGopSAP)
		name: self getCustomerGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getValidToSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getValidToSAN;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getValidToESAP

	^(self getValidToSAP)
		name: self getValidToESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getProductGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getProductGopSAN;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getProductGopESAP

	^(self getProductGopSAP)
		name: self getProductGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getKeySAP

	^MSKSwaggerParameterDescription new initialize
		name: self getKeySAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getKeyESAP

	^(self getKeySAP)
		name: self getKeyESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getDescriptionSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getDescriptionSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getDescriptionESAP

	^(self getDescriptionSAP)
		name: self getDescriptionESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getCreatedTSSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getCreatedTSSAN;
		dataType: 'string';
		format: 'date-time';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPILicense
getCreatedTSESAP

	^(self getCreatedTSSAP)
		name: self getCreatedTSESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSProduct
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <customer> with value from modeller <>"
	customer := nil.
	"Attribute named <license> with value from modeller <>"
	license := Set new.
	"Attribute named <productType> with value from modeller <gesscati>"
	productType := STSEnumProductDefinition gesscati.
%
category: 'model-initialize'
set compile_env: 0
method: STSProduct
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	customer := nil.
	name := nil.
	productType := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSProduct
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProduct
getCustomer
	" ^<STSCustomer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^customer
%
category: 'model-private-attributes'
set compile_env: 0
method: STSProduct
mcSetCustomer: aCustomer otherSide: otherSideFlagBoolean
	" 'aSTSCustomer' is assumed to be instance of class: 'STSCustomer' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aCustomer == customer) ifTrue:[ ^self ].
	customer notNil ifTrue:[ customer mcRemoveProducts: self otherSide: false ]. 

	customer := aCustomer. 
	sysrev := sysrev + 1. 
	(otherSideFlagBoolean and:[ aCustomer notNil ]) ifTrue:[ aCustomer mcAddProducts: self otherSide: false ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProduct
setCustomer: aSTSCustomer
	" 'aSTSCustomer' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetCustomer: aSTSCustomer otherSide: true.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProduct
getName
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^name
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProduct
setName: anUnicode16OrNil
	" 'anUnicode16OrNil' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16OrNil == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16OrNil asUnicodeString ].
	(_newValue = name) ifTrue:[ ^self ].
	name := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes-derived'
set compile_env: 0
method: STSProduct
getCustomerGop
	| temp |


	" ^<Integer> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(temp :=  self getCustomer) isNil ifTrue:[ ^temp ].
	(temp :=  temp getGop) isNil ifTrue:[ ^temp ].
	^temp

%
category: 'model-public-attributes'
set compile_env: 0
method: STSProduct
getLicense
	" ^<Set of: STSLicense> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^license
%
category: 'model-public-testing'
set compile_env: 0
method: STSProduct
includesLicense: aSTSLicense
	" 'aSTSLicense' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^(license includes: aSTSLicense)

%
category: 'model-private-adding'
set compile_env: 0
method: STSProduct
mcAddLicense: aSTSLicense otherSide: otherSideFlagBoolean
	" 'aSTSLicense' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aSTSLicense throwMSKNullParameterException:'STSProduct>mcAddLicense: %1 otherSide: %2'.

	license add: aSTSLicense.
	otherSideFlagBoolean ifTrue:[ aSTSLicense mcSetProduct: self otherSide: false ].
%
category: 'model-public-adding'
set compile_env: 0
method: STSProduct
addLicense: aSTSLicense
	" 'aSTSLicense' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcAddLicense: aSTSLicense otherSide: true
%
category: 'model-private-removing'
set compile_env: 0
method: STSProduct
mcRemoveLicense: aSTSLicense otherSide: otherSideFlagBoolean
	" 'aSTSLicense' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	"parameter checks"
	aSTSLicense throwMSKNullParameterException:'STSProduct>mcRemoveLicense: %1 otherSide: %2'.

	(license remove: aSTSLicense ifAbsent:[ nil ]) isNil ifTrue:[ ^self ].
	otherSideFlagBoolean ifTrue:[ aSTSLicense mcSetProduct: nil otherSide: false ].
%
category: 'model-public-removing'
set compile_env: 0
method: STSProduct
removeLicense: aSTSLicense
	" 'aSTSLicense' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcRemoveLicense: aSTSLicense otherSide: true
%
category: 'model-public-searching'
set compile_env: 0
method: STSProduct
searchViaKeyLicense: keyValue


	^license detect: [ :each | each  getGop =  keyValue] ifNone:[ nil ]. 
%
category: 'model-public-searching'
set compile_env: 0
method: STSProduct
searchLicense: anObject


	^self searchViaKeyLicense: anObject getGop
%
category: 'model-public-accessing'
set compile_env: 0
method: STSProduct
_getLicense
	" ^<Set of: STSLicense> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^license
%
category: 'model-private-attributes'
set compile_env: 0
method: STSProduct
mcSetLicense: aLicense otherSide: otherSideFlagBoolean
	" 'aSTSLicense' is assumed to be instance of class: 'STSLicense' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aLicense == license) ifTrue:[ ^self ].
	(otherSideFlagBoolean and:[ license notNil ]) ifTrue:[ license mcSetProduct: nil otherSide: false ]. 

	license := aLicense. 
	sysrev := sysrev + 1. 
	(otherSideFlagBoolean and:[ aLicense notNil ]) ifTrue:[ aLicense mcSetProduct: self otherSide: false ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProduct
setLicense: aSTSLicense
	" 'aSTSLicense' is assumed to be instance of class: 'STSProduct' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	self mcSetLicense: aSTSLicense otherSide: true.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProduct
getProductType
	" ^<Integer>  Value is assumed to be enum value of class: 'STSEnumProductDefinition'"
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^productType
%
category: 'model-public-attributes'
set compile_env: 0
method: STSProduct
setProductType: anInteger
	" 'anInteger' is assumed to be enum value of class: 'STSEnumProductDefinition' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	anInteger throwMSKNullParameterException:'STSProduct>setProductType:'.
	(anInteger = productType) ifTrue:[ ^self ].
	productType := anInteger ifNotNil:[ anInteger  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSProduct
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSProduct
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'each.name' ].
	(apiPropertyName = 'customerGop') ifTrue:[ ^'each.customer.gop' ].
	(apiPropertyName = 'productType') ifTrue:[ ^'each.productType' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSProduct
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSProduct
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSProduct
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSProduct
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSProduct
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'customer') ifFalse:[ customer := nil ].
	(oldNames includes: #'name') ifFalse:[ name := nil ].
	(oldNames includes: #'license') ifFalse:[ license := Set new ].
	(oldNames includes: #'productType') ifFalse:[ productType := STSEnumProductDefinition gesscati ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIProduct
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <name> with value from modeller <>"
	name := UndefinedObject.
	"Attribute named <customerGop> with value from modeller <>"
	customerGop := UndefinedObject.
	"Attribute named <productType> with value from modeller <>"
	productType := UndefinedObject.
%
category: 'model-initialize'
set compile_env: 0
method: STSAPIProduct
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	name := nil.
	customerGop := nil.
	productType := nil.
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProduct
getName
	" ^<(Unicode16 | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^name
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProduct
setName: anUnicode16OrNil
	" 'anUnicode16OrNil' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	_newValue := (anUnicode16OrNil == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16OrNil asUnicodeString ].
	(_newValue = name) ifTrue:[ ^self ].

	(_newValue notNil and:[ _newValue pumIsUnicodeString not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'name';
			className: 'STSAPIProduct';
			expectedType:'Unicode16';
			receivedType: _newValue class name asString; 
			signal.
	].

	name := _newValue. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProduct
getCustomerGop
	" ^<(Integer | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^customerGop
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProduct
setCustomerGop: anInteger
	" 'anInteger' is assumed to be instance of class: 'LargeInteger' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = customerGop) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger isNumber not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'customerGop';
			className: 'STSAPIProduct';
			expectedType:'LargeInteger';
			receivedType: anInteger class name asString; 
			signal.
	].

	customerGop := anInteger ifNotNil:[ anInteger asInteger  ]. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProduct
getProductType
	" ^<(Integer | UndefinedObject)>  Value is assumed to be enum value of class: 'STSEnumProductDefinition'"
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^productType
%
category: 'model-public-attributes'
set compile_env: 0
method: STSAPIProduct
setProductType: anInteger
	" 'anInteger' is assumed to be enum value of class: 'STSEnumProductDefinition' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(anInteger = productType) ifTrue:[ ^self ].

	(anInteger notNil and:[ anInteger pumIsSuitableEnumerationValue not ]) ifTrue:[ 
		PUMTypeError new
			attributeName: 'productType';
			className: 'STSAPIProduct';
			expectedType:'Integer';
			receivedType: anInteger class name asString; 
			signal.
	].

	productType := anInteger ifNotNil:[ anInteger  ]. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIProduct
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProduct
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'each.name' ].
	(apiPropertyName = 'customerGop') ifTrue:[ ^'each.customer.gop' ].
	(apiPropertyName = 'productType') ifTrue:[ ^'each.productType' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProduct
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(apiPropertyName = 'productType') ifTrue:[ ^[ :each | STSEnumProductDefinition stringToValue: each ] ].

	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'model-support'
set compile_env: 0
classmethod: STSAPIProduct
copyFrom: aSTSProduct

	| newInstance temp |

	newInstance := self newInitialized setAllAttributesToNil ; yourself.
	newInstance setSysrev: aSTSProduct getSysrev.
	newInstance setProductType: aSTSProduct getProductType.
	newInstance setName: aSTSProduct getName.
	newInstance setGop: aSTSProduct getGop.
	newInstance setCustomerGop: aSTSProduct getCustomerGop.
	newInstance setSyscid: aSTSProduct getGop.
	"call-out for user code - please write your own specific primCopyFromDomain:"
	^newInstance primCopyFromDomain: aSTSProduct

%
category: 'model-support'
set compile_env: 0
method: STSAPIProduct
copyTo: aSTSProduct

	| temp oldRevision |

	oldRevision := aSTSProduct getSysrev.
	(temp := self getProductType) isNil ifTrue: [ ^'Enumeration Attribute value invalid: productType' ].
	(temp := self getProductType) ~= UndefinedObject ifTrue: [ aSTSProduct setProductType: temp].
	(temp := self getName) ~= UndefinedObject ifTrue: [ aSTSProduct setName: temp].
	(temp := self getGop) ~= UndefinedObject ifTrue: [ aSTSProduct setGop: temp].
	"we correct the multiple increment to help Sencha to stay synchronous"
	oldRevision < aSTSProduct getSysrev ifTrue:[ aSTSProduct setSysrev: (oldRevision + 1) ].
	"call-out for user code - please write your own specific primCopyFromAPIToDomain:"
	^self primCopyFromAPIToDomain: aSTSProduct

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSAPIProduct
getDomainPropertyAccessor: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'name') ifTrue:[ ^'getName' ].
	(apiPropertyName = 'customerGop') ifTrue:[ ^'getCustomerGop' ].
	(apiPropertyName = 'productType') ifTrue:[ ^'getProductType' ].

	^super getDomainPropertyAccessor: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProduct
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^Array new
%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProduct
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSAPIProduct
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProduct
pumSimpleSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #productType
			getter: [ :object | | value | (value := object getProductType) ifNotNil:[ STSEnumProductDefinition valueToString: value ]]
			setter: [ :object :value | value ifNotNil:[ object setProductType: (STSEnumProductDefinition stringToValue: value) ]].
	mapping
		mapProperty: #name
		getter: [ :object | object getName ]
		setter: [ :object :value | object setName: value ].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #customerGop
		getter: [ :object | object getCustomerGop ]
		setter: [ :object :value | object setCustomerGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProduct
pumFullSwaggerModelNeoJsonMapping: mapping

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	mapping
		mapProperty: #customerGop
		getter: [ :object | object getCustomerGop ]
		setter: [ :object :value | object setCustomerGop: value ].
	mapping
		mapProperty: #productType
			getter: [ :object | | value | (value := object getProductType) ifNotNil:[ STSEnumProductDefinition valueToString: value ]]
			setter: [ :object :value | value ifNotNil:[ object setProductType: (STSEnumProductDefinition stringToValue: value) ]].
	mapping
		mapProperty: #gop
		getter: [ :object | object getGop ]
		setter: [ :object :value | object setGop: value ].
	mapping
		mapProperty: #syscid
		getter: [ :object | object getSyscid ]
		setter: [ :object :value | object setSyscid: value ].
	mapping
		mapProperty: #sysrev
		getter: [ :object | object getSysrev ]
		setter: [ :object :value | object setSysrev: value ].
	mapping
		mapProperty: #name
		getter: [ :object | object getName ]
		setter: [ :object :value | object setName: value ].


%
category: 'model-json-support'
set compile_env: 0
classmethod: STSAPIProduct
pumFullNeoJsonMapping: mapper


	mapper for: self do: [ :mapping | self pumFullSwaggerModelNeoJsonMapping: mapping ].

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
pumSimpleSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getProductTypeSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized ; 
						yourself);
		addProperty: ((MSKJSONProperty named: self getNameSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCustomerGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
pumSimpleSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumSimpleSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
pumFullSwaggerSenchaListModel

	^(MSKJSONType named: self name asString,'List')
		type: 'object' ;
		description: 'Sencha suitable list structure';
		addProperty: ((MSKJSONProperty named: 'total')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'offset')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: 'items')
						required: true; 
						generalType: (MSKJSONContainer with: (MSKJSONReferenceType with: self pumFullSwaggerModel));
						yourself);
		addProperty: ((MSKJSONProperty named: 'limit')
						required: true; 
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
pumFullSwaggerModel

	^(MSKJSONType named: self name asString)
		type: 'object' ;
		addProperty: ((MSKJSONProperty named: self getSyscidSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getSysrevSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt32;
						yourself);
		addProperty: ((MSKJSONProperty named: self getNameSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized;
						yourself);
		addProperty: ((MSKJSONProperty named: self getCustomerGopSAN)
						required: false;
						generalType: MSKJSONIntegerType newInt64;
						yourself);
		addProperty: ((MSKJSONProperty named: self getProductTypeSAN)
						required: false;
						generalType: MSKJSONStringType newInitialized ; 
						yourself);
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getCustomerGopESAN

	^'STSAPIProductCustomerGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getCustomerGopSAN

	^'customerGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getProductTypeESAN

	^'STSAPIProductProductType'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getProductTypeSAN

	^'productType'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getGopESAN

	^'STSAPIProductGop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getGopSAN

	^'gop'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getSyscidESAN

	^'STSAPIProductSyscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getSyscidSAN

	^'syscid'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getSysrevESAN

	^'STSAPIProductSysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getSysrevSAN

	^'sysrev'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getNameESAN

	^'STSAPIProductName'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getNameSAN

	^'name'

%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getSyscidSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSyscidSAN;
		description: 'Framework Attribute. Maintains a unique ID - generated on the client side' asUnicodeString ;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getSyscidESAP

	^(self getSyscidSAP)
		name: self getSyscidESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getGopSAN;
		description: 'Framework Attribute. Maintains a unique ID' asUnicodeString ;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getGopESAP

	^(self getGopSAP)
		name: self getGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getSysrevSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getSysrevSAN;
		description: 'Framework Attribute. Maintains a revision attribute to manage optimistic locking. You must use this attribute when updating an object' asUnicodeString ;
		dataType: 'integer';
		format: 'int32';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getSysrevESAP

	^(self getSysrevSAP)
		name: self getSysrevESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getNameSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getNameSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getNameESAP

	^(self getNameSAP)
		name: self getNameESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getCustomerGopSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getCustomerGopSAN;
		dataType: 'integer';
		format: 'int64';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getCustomerGopESAP

	^(self getCustomerGopSAP)
		name: self getCustomerGopESAN;
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getProductTypeSAP

	^MSKSwaggerParameterDescription new initialize
		name: self getProductTypeSAN;
		dataType: 'string';
		yourself.


%
category: 'model-swagger'
set compile_env: 0
classmethod: STSAPIProduct
getProductTypeESAP

	^(self getProductTypeSAP)
		name: self getProductTypeESAN;
		yourself.


%
category: 'model-initialize'
set compile_env: 0
method: STSUsageMessage
modelInitialize

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super modelInitialize.

	"Attribute named <content> with value from modeller <>"
	content := Unicode16 new.
	"Attribute named <accepted> with value from modeller <>"
	accepted := DateAndTime now asUTC.
%
category: 'model-initialize'
set compile_env: 0
method: STSUsageMessage
setAllAttributesToNil

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	super setAllAttributesToNil.

	content := nil.
	accepted := nil.
	handled := nil.
%
category: 'model-public-attributes-changeable'
set compile_env: 0
method: STSUsageMessage
getCalculatedChangeableAttributeList
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^ super getCalculatedChangeableAttributeList
		yourself
%
category: 'model-public-attributes'
set compile_env: 0
method: STSUsageMessage
getContent
	" ^<Unicode16> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^content
%
category: 'model-public-attributes'
set compile_env: 0
method: STSUsageMessage
setContent: anUnicode16
	" 'anUnicode16' is assumed to be instance of class: 'Unicode16' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| _newValue |
	anUnicode16 throwMSKNullParameterException:'STSUsageMessage>setContent:'.
	_newValue := (anUnicode16 == nil) ifTrue:[ nil ] ifFalse:[ anUnicode16 asUnicodeString ].
	(_newValue = content) ifTrue:[ ^self ].
	content := _newValue. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSUsageMessage
getAccepted
	" ^<DateAndTime> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^accepted
%
category: 'model-public-attributes'
set compile_env: 0
method: STSUsageMessage
setAccepted: aDateAndTime
	" 'aDateAndTime' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	aDateAndTime throwMSKNullParameterException:'STSUsageMessage>setAccepted:'.
	(aDateAndTime = accepted) ifTrue:[ ^self ].
	accepted := aDateAndTime ifNotNil:[ aDateAndTime  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-public-attributes'
set compile_env: 0
method: STSUsageMessage
getHandled
	" ^<(DateAndTime | UndefinedObject)> "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^handled
%
category: 'model-public-attributes'
set compile_env: 0
method: STSUsageMessage
setHandled: aDateAndTimeOrNil
	" 'aDateAndTimeOrNil' is assumed to be instance of class: 'DateAndTime' "
	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	(aDateAndTimeOrNil = handled) ifTrue:[ ^self ].
	handled := aDateAndTimeOrNil ifNotNil:[ aDateAndTimeOrNil  ]. 
	sysrev := sysrev + 1. 
%
category: 'model-support'
set compile_env: 0
classmethod: STSUsageMessage
projectVersion

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	^'0.006'

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSUsageMessage
getDomainPropertyAccessorPath: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	(apiPropertyName = 'content') ifTrue:[ ^'each.content' ].
	(apiPropertyName = 'accepted') ifTrue:[ ^'each.accepted' ].
	(apiPropertyName = 'handled') ifTrue:[ ^'each.handled' ].

	^super getDomainPropertyAccessorPath: apiPropertyName 

%
category: 'model-meta-support'
set compile_env: 0
classmethod: STSUsageMessage
getDomainPropertyConversionSourcetext: apiPropertyName

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


	^super getDomainPropertyConversionSourcetext: apiPropertyName 

%
category: 'framework-indices'
set compile_env: 0
method: STSUsageMessage
auditAllIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	| __results __temp |

	__results := Array new.
	^__results
%
category: 'framework-indices'
set compile_env: 0
method: STSUsageMessage
createIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-indices'
set compile_env: 0
method: STSUsageMessage
removeIndices

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "


%
category: 'framework-migration-support'
set compile_env: 0
method: STSUsageMessage
migrateFrom: _oldValue instVarMap: _unusedParameter

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	|  oldNames  |

	oldNames := _oldValue class allInstVarNames.

	(oldNames includes: #'content') ifFalse:[ content := Unicode16 new ].
	(oldNames includes: #'accepted') ifFalse:[ accepted := DateAndTime now asUTC ].
	(oldNames includes: #'handled') ifFalse:[ handled := nil ].

	super migrateFrom: _oldValue instVarMap: _unusedParameter.
%
doit
MSKRESTAPIAnswerV2 subclass: 'STSRESTAnswerClass'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSRESTAnswerClass includesCategory: eachName ) ifTrue:[ STSRESTAnswerClass removeCategory: eachName ].
( STSRESTAnswerClass class includesCategory: eachName ) ifTrue:[ STSRESTAnswerClass class removeCategory: eachName ]
].

%
doit
PUMGeneralServiceClass subclass: 'STSServiceClass'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSServiceClass includesCategory: eachName ) ifTrue:[ STSServiceClass removeCategory: eachName ].
( STSServiceClass class includesCategory: eachName ) ifTrue:[ STSServiceClass class removeCategory: eachName ]
].

%
doit
MSKRestCall subclass: 'STSAPIManualRestCall'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIManualRestCall includesCategory: eachName ) ifTrue:[ STSAPIManualRestCall removeCategory: eachName ].
( STSAPIManualRestCall class includesCategory: eachName ) ifTrue:[ STSAPIManualRestCall class removeCategory: eachName ]
].

%
doit
MSKSpecificAPIJsonData subclass: 'STSSpecificAPIJsonData'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSSpecificAPIJsonData includesCategory: eachName ) ifTrue:[ STSSpecificAPIJsonData removeCategory: eachName ].
( STSSpecificAPIJsonData class includesCategory: eachName ) ifTrue:[ STSSpecificAPIJsonData class removeCategory: eachName ]
].

%
doit
MSKAPIJsonData subclass: 'STSAPIJSONData'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIJSONData includesCategory: eachName ) ifTrue:[ STSAPIJSONData removeCategory: eachName ].
( STSAPIJSONData class includesCategory: eachName ) ifTrue:[ STSAPIJSONData class removeCategory: eachName ]
].

%
doit
MSKRestCallV2 subclass: 'STSRestClass'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSRestClass includesCategory: eachName ) ifTrue:[ STSRestClass removeCategory: eachName ].
( STSRestClass class includesCategory: eachName ) ifTrue:[ STSRestClass class removeCategory: eachName ]
].

%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
restBaseErrorClass

	^STSAPIGeneralResult
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRESTAnswerClass
baseResultStructureClass

	^STSAPIGeneralResult
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
restBaseErrorClass

	^STSAPIGeneralResult
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
errorMessageClass

	^STSEnumErrorDefinitionLocaleErrorDefinition
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
restAnswerClass

	^STSRESTAnswerClass
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
projectClass

	^STSProject
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
dataRootInstance

	^(StatisticsServerData at: #'DataRootInstance')
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
clearDataRootInstance

	StatisticsServerData at: #'DataRootInstance' put: self projectClass new initialize
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
searchSessionViaID: sessionID

	^self dataRootInstance searchViaKeyApplicationSession: sessionID asNumber
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
throwParameterNotDefinedBlock

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^[ :pName :options | STSEnumErrorDefinitionLocaleErrorDefinition errCodeParameterNotDefinedThrowSignal: options with1Args: (Array with: pName) ]
%
category: 'framework-maintenance'
set compile_env: 0
classmethod: STSServiceClass
cleanupRCClasses
	"First simple code to cleanup all instances of Rc* classes - be aware of the prerequisites when executing this code (take down all GEMs). Do not forget to make a commit"

	| array |

	array := (SystemRepository listInstances: { RcQueue. RcIdentityBag.  RcCounter. }). 
	(array at: 1) do: [:each | each cleanupQueue].
	(array at: 2) do: [:each | each cleanupBag].
	(array at: 3) do: [:each | each cleanupCounter].
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSAPIManualRestCall
restAnswerClass

	^STSRESTAnswerClass
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSAPIManualRestCall
projectClass

	^STSProject
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSSpecificAPIJsonData
manualRestCallSuperclass

	^STSAPIManualRestCall

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSSpecificAPIJsonData
autoRestCallSuperclass

	^STSRestClass

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSSpecificAPIJsonData
pattern

	^ Array with: 'sts' with: 'v1' with: 'api-doc' with: '*'

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSAPIJSONData
manualRestCallSuperclass

	^STSAPIManualRestCall

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSAPIJSONData
autoRestCallSuperclass

	^STSRestClass

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSAPIJSONData
pattern

	^ Array with: 'sts' with: 'v1' with: 'api-docs'

%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
restAnswerClass

	^STSRESTAnswerClass
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
projectClass

	^STSProject
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
pattern

	^ Array with: self firstPartOfPath with: self versionPartOfPath with: '{OperationType}' with: 'a' with: '{MessageNickName}'
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
pattern

	^ Array with: self firstPartOfPath with: self versionPartOfPath with: '{OperationType}' with: 'a' with: '{MessageNickName}'
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
restServiceClass

	^STSServiceClass
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
restServiceSessionClass

	^STSApplicationSession
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
firstPartOfPath

	^'sts'
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
versionPartOfPath

	^'v1'
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
saveJSONFiles
	| result |

	self buildAPIDefinitionsStructure.
	result := GsFile isServerDirectory: '/var/www/html/apis'.
	(result isNil or:[ result not ]) ifTrue: [ (GsFile createServerDirectory: '/var/www/html/apis' mode: 8r777) isNil ifTrue:[ ^'Error creating </var/www/html/apis>' ]].
	result := GsFile isServerDirectory: '/var/www/html/apis/sts'.
	(result isNil or:[ result not ])  ifTrue: [ (GsFile createServerDirectory: '/var/www/html/apis/sts' mode: 8r777) isNil ifTrue:[ ^'Error creating </var/www/html/apis/sts>' ]].
	result := GsFile isServerDirectory: '/var/www/html/apis/sts/v1'.
	(result isNil or:[ result not ])  ifTrue: [ (GsFile createServerDirectory: '/var/www/html/apis/sts/v1' mode: 8r777) isNil ifTrue:[ ^'Error creating </var/www/html/apis/sts/v1>' ]].
	result := GsFile isServerDirectory: '/var/www/html/apis/sts/v1/api-doc'.
	(result isNil or:[ result not ])  ifTrue: [ (GsFile createServerDirectory: '/var/www/html/apis/sts/v1/api-doc' mode: 8r777) isNil ifTrue:[ ^'Error creating </var/www/html/apis/sts/v1/api-doc>' ]].
	(GsFile openWriteOnServer: '/var/www/html/apis/sts/v1/api-docs.json')
		nextPutAll: STSAPIJSONData jsonAPIText asString ;
		close ;
		yourself.
	STSRestClass apiDefinitions do: [ :eachMSKSwaggerAPIDeclaration |
		(GsFile openWriteOnServer: ('/var/www/html/apis/sts/v1/api-doc/',eachMSKSwaggerAPIDeclaration jsonName))
			nextPutAll: (STSSpecificAPIJsonData jsonAPIText: eachMSKSwaggerAPIDeclaration jsonName) encodeAsUTF8 ;
			close ;
			yourself.
	].

%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_APIDeclaration

	| newInstance |
	newInstance := MSKSwaggerAPIDeclaration new initialize.

	newInstance description: 'session'.
	newInstance path: 'apis/sts/v1/api-doc/',self session_GroupName,'.{format}'.
	newInstance resourcePath: '/', self session_GroupName.
	newInstance jsonName: self session_JSONName.
	newInstance addJSONProduceSpecification.
	newInstance basePath: './'. 
	newInstance addAllAPI: self session_SessionList_BuildAPI.
	newInstance addAllAPI: self session_CreateSession_BuildAPI.
	newInstance addAllAPI: self session_DeleteOwnSession_BuildAPI.
	newInstance addModel: STSAPIApplicationSession pumFullSwaggerModel.
	newInstance addModel: STSAPIError pumFullSwaggerModel.
	newInstance addModel: STSAPISessionListStoreRL pumFullSwaggerModel.
	newInstance addModel: STSAPISessionCreationParameter pumFullSwaggerModel.
	newInstance addModel: STSAPISessionListStorePL pumFullSwaggerModel.
	newInstance addModel: STSAPIPRSessionListStore pumFullSwaggerModel.
	newInstance addModel: STSAPIGeneralResult pumFullSwaggerModel.

	^newInstance
%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_GroupName

	^'session'
%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_JSONName

	^ 'session.json'
%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_SessionList_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/SessionListCreate';
			addOperation: self session_SessionListCreate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/SessionListDestroy';
			addOperation: self session_SessionListDestroy ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/SessionListUpdate';
			addOperation: self session_SessionListUpdate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/SessionListRead';
			addOperation: self session_SessionListRead ;
			yourself);
		yourself

%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_SessionList_Name

	^'SessionList'

%
category: 'group - session'
set compile_env: 0
classmethod: STSRestClass
session_SessionListCreate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'SessionListCreate'
		pModelName: 'STSAPISessionListStorePL'
		rModelName: 'STSAPISessionListStoreRL'
		pDescription: ''
		summary: 'Bearbeitung der Sessions im System'
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSessionSessionListCreate: aSTSAPISessionListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSessionSessionListCreate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - session'
set compile_env: 0
classmethod: STSRestClass
session_SessionListDestroy


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'SessionListDestroy'
		pModelName: 'STSAPISessionListStorePL'
		rModelName: 'STSAPIGeneralResult'
		pDescription: ''
		summary: 'Bearbeitung der Sessions im System'
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSessionSessionListDestroy: aSTSAPISessionListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSessionSessionListDestroy: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - session'
set compile_env: 0
classmethod: STSRestClass
session_SessionListUpdate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'SessionListUpdate'
		pModelName: 'STSAPISessionListStorePL'
		rModelName: 'STSAPISessionListStoreRL'
		pDescription: ''
		summary: 'Bearbeitung der Sessions im System'
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSessionSessionListUpdate: aSTSAPISessionListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSessionSessionListUpdate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - session'
set compile_env: 0
classmethod: STSRestClass
session_SessionListRead


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'SessionListRead'
		pModelName: 'STSAPIPRSessionListStore'
		rModelName: 'STSAPISessionListStoreRL'
		pDescription: ''
		summary: 'Bearbeitung der Sessions im System'
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSessionSessionListRead: aSTSAPIPRSessionListStore options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSessionSessionListRead: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_CreateSession_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/CreateSession';
			addOperation: self session_CreateSession;
			yourself);
		yourself

%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_CreateSession_Name

	^'CreateSession'

%
category: 'group - session'
set compile_env: 0
classmethod: STSRestClass
session_CreateSession


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'CreateSession'
		pModelName: 'STSAPISessionCreationParameter'
		rModelName: 'STSAPISessionListStoreRL'
		pDescription: 'Erzeugt eine Session'
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSessionCreateSession: aSTSAPISessionCreationParameter options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions |  aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSessionCreateSession: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions  ]]
		sessionNeeded: false
		debugCall: false


%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_DeleteOwnSession_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/DeleteOwnSession';
			addOperation: self session_DeleteOwnSession;
			yourself);
		yourself

%
category: 'group - session-management'
set compile_env: 0
classmethod: STSRestClass
session_DeleteOwnSession_Name

	^'DeleteOwnSession'

%
category: 'group - session'
set compile_env: 0
classmethod: STSRestClass
session_DeleteOwnSession


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'DeleteOwnSession'
		pModelName: 'STSAPISessionListStorePL'
		rModelName: 'STSAPIGeneralResult'
		pDescription: ''
		summary: 'Beendet die eigene Session. Ein Logout sozusagen'
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSessionDeleteOwnSession: aSTSAPISessionListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions |  aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSessionDeleteOwnSession: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions  ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - system-management'
set compile_env: 0
classmethod: STSRestClass
system_APIDeclaration

	| newInstance |
	newInstance := MSKSwaggerAPIDeclaration new initialize.

	newInstance description: 'system'.
	newInstance path: 'apis/sts/v1/api-doc/',self system_GroupName,'.{format}'.
	newInstance resourcePath: '/', self system_GroupName.
	newInstance jsonName: self system_JSONName.
	newInstance addJSONProduceSpecification.
	newInstance basePath: './'. 
	newInstance addAllAPI: self system_LogEntryList_BuildAPI.
	newInstance addModel: STSAPIError pumFullSwaggerModel.
	newInstance addModel: STSAPILogEntries pumFullSwaggerModel.
	newInstance addModel: STSAPILogEntryListStoreRL pumFullSwaggerModel.
	newInstance addModel: STSAPIPRLogEntryListStore pumFullSwaggerModel.
	newInstance addModel: STSAPILogEntryListStorePL pumFullSwaggerModel.
	newInstance addModel: STSAPIGeneralResult pumFullSwaggerModel.

	^newInstance
%
category: 'group - system-management'
set compile_env: 0
classmethod: STSRestClass
system_GroupName

	^'system'
%
category: 'group - system-management'
set compile_env: 0
classmethod: STSRestClass
system_JSONName

	^ 'system.json'
%
category: 'group - system-management'
set compile_env: 0
classmethod: STSRestClass
system_LogEntryList_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LogEntryListCreate';
			addOperation: self system_LogEntryListCreate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LogEntryListDestroy';
			addOperation: self system_LogEntryListDestroy ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LogEntryListUpdate';
			addOperation: self system_LogEntryListUpdate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LogEntryListRead';
			addOperation: self system_LogEntryListRead ;
			yourself);
		yourself

%
category: 'group - system-management'
set compile_env: 0
classmethod: STSRestClass
system_LogEntryList_Name

	^'LogEntryList'

%
category: 'group - system'
set compile_env: 0
classmethod: STSRestClass
system_LogEntryListCreate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LogEntryListCreate'
		pModelName: 'STSAPILogEntryListStorePL'
		rModelName: 'STSAPILogEntryListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSystemLogEntryListCreate: aSTSAPILogEntryListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSystemLogEntryListCreate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - system'
set compile_env: 0
classmethod: STSRestClass
system_LogEntryListDestroy


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LogEntryListDestroy'
		pModelName: 'STSAPILogEntryListStorePL'
		rModelName: 'STSAPIGeneralResult'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSystemLogEntryListDestroy: aSTSAPILogEntryListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSystemLogEntryListDestroy: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - system'
set compile_env: 0
classmethod: STSRestClass
system_LogEntryListUpdate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LogEntryListUpdate'
		pModelName: 'STSAPILogEntryListStorePL'
		rModelName: 'STSAPILogEntryListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSystemLogEntryListUpdate: aSTSAPILogEntryListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSystemLogEntryListUpdate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - system'
set compile_env: 0
classmethod: STSRestClass
system_LogEntryListRead


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LogEntryListRead'
		pModelName: 'STSAPIPRLogEntryListStore'
		rModelName: 'STSAPILogEntryListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiSystemLogEntryListRead: aSTSAPIPRLogEntryListStore options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiSystemLogEntryListRead: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - user-management'
set compile_env: 0
classmethod: STSRestClass
user_APIDeclaration

	| newInstance |
	newInstance := MSKSwaggerAPIDeclaration new initialize.

	newInstance description: 'user'.
	newInstance path: 'apis/sts/v1/api-doc/',self user_GroupName,'.{format}'.
	newInstance resourcePath: '/', self user_GroupName.
	newInstance jsonName: self user_JSONName.
	newInstance addJSONProduceSpecification.
	newInstance basePath: './'. 
	newInstance addAllAPI: self user_UserList_BuildAPI.
	newInstance addModel: STSAPIError pumFullSwaggerModel.
	newInstance addModel: STSAPIUserListStorePL pumFullSwaggerModel.
	newInstance addModel: STSAPIPRUserListStore pumFullSwaggerModel.
	newInstance addModel: STSAPIApplicationUser pumFullSwaggerModel.
	newInstance addModel: STSAPIGeneralResult pumFullSwaggerModel.
	newInstance addModel: STSAPIUserListStoreRL pumFullSwaggerModel.

	^newInstance
%
category: 'group - user-management'
set compile_env: 0
classmethod: STSRestClass
user_GroupName

	^'user'
%
category: 'group - user-management'
set compile_env: 0
classmethod: STSRestClass
user_JSONName

	^ 'user.json'
%
category: 'group - user-management'
set compile_env: 0
classmethod: STSRestClass
user_UserList_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/UserListCreate';
			addOperation: self user_UserListCreate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/UserListDestroy';
			addOperation: self user_UserListDestroy ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/UserListUpdate';
			addOperation: self user_UserListUpdate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/UserListRead';
			addOperation: self user_UserListRead ;
			yourself);
		yourself

%
category: 'group - user-management'
set compile_env: 0
classmethod: STSRestClass
user_UserList_Name

	^'UserList'

%
category: 'group - user'
set compile_env: 0
classmethod: STSRestClass
user_UserListCreate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'UserListCreate'
		pModelName: 'STSAPIUserListStorePL'
		rModelName: 'STSAPIUserListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiUserUserListCreate: aSTSAPIUserListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiUserUserListCreate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - user'
set compile_env: 0
classmethod: STSRestClass
user_UserListDestroy


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'UserListDestroy'
		pModelName: 'STSAPIUserListStorePL'
		rModelName: 'STSAPIGeneralResult'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiUserUserListDestroy: aSTSAPIUserListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiUserUserListDestroy: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - user'
set compile_env: 0
classmethod: STSRestClass
user_UserListUpdate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'UserListUpdate'
		pModelName: 'STSAPIUserListStorePL'
		rModelName: 'STSAPIUserListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiUserUserListUpdate: aSTSAPIUserListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiUserUserListUpdate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - user'
set compile_env: 0
classmethod: STSRestClass
user_UserListRead


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'UserListRead'
		pModelName: 'STSAPIPRUserListStore'
		rModelName: 'STSAPIUserListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiUserUserListRead: aSTSAPIPRUserListStore options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiUserUserListRead: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - product-management'
set compile_env: 0
classmethod: STSRestClass
product_APIDeclaration

	| newInstance |
	newInstance := MSKSwaggerAPIDeclaration new initialize.

	newInstance description: 'product'.
	newInstance path: 'apis/sts/v1/api-doc/',self product_GroupName,'.{format}'.
	newInstance resourcePath: '/', self product_GroupName.
	newInstance jsonName: self product_JSONName.
	newInstance addJSONProduceSpecification.
	newInstance basePath: './'. 
	newInstance addAllAPI: self product_ProductList_BuildAPI.
	newInstance addModel: STSAPIError pumFullSwaggerModel.
	newInstance addModel: STSAPIProductListStorePL pumFullSwaggerModel.
	newInstance addModel: STSAPIPRProductListStore pumFullSwaggerModel.
	newInstance addModel: STSAPIProductListStoreRL pumFullSwaggerModel.
	newInstance addModel: STSAPIGeneralResult pumFullSwaggerModel.
	newInstance addModel: STSAPIProduct pumFullSwaggerModel.

	^newInstance
%
category: 'group - product-management'
set compile_env: 0
classmethod: STSRestClass
product_GroupName

	^'product'
%
category: 'group - product-management'
set compile_env: 0
classmethod: STSRestClass
product_JSONName

	^ 'product.json'
%
category: 'group - product-management'
set compile_env: 0
classmethod: STSRestClass
product_ProductList_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/ProductListCreate';
			addOperation: self product_ProductListCreate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/ProductListDestroy';
			addOperation: self product_ProductListDestroy ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/ProductListUpdate';
			addOperation: self product_ProductListUpdate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/ProductListRead';
			addOperation: self product_ProductListRead ;
			yourself);
		yourself

%
category: 'group - product-management'
set compile_env: 0
classmethod: STSRestClass
product_ProductList_Name

	^'ProductList'

%
category: 'group - product'
set compile_env: 0
classmethod: STSRestClass
product_ProductListCreate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'ProductListCreate'
		pModelName: 'STSAPIProductListStorePL'
		rModelName: 'STSAPIProductListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiProductProductListCreate: aSTSAPIProductListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiProductProductListCreate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - product'
set compile_env: 0
classmethod: STSRestClass
product_ProductListDestroy


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'ProductListDestroy'
		pModelName: 'STSAPIProductListStorePL'
		rModelName: 'STSAPIGeneralResult'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiProductProductListDestroy: aSTSAPIProductListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiProductProductListDestroy: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - product'
set compile_env: 0
classmethod: STSRestClass
product_ProductListUpdate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'ProductListUpdate'
		pModelName: 'STSAPIProductListStorePL'
		rModelName: 'STSAPIProductListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiProductProductListUpdate: aSTSAPIProductListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiProductProductListUpdate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - product'
set compile_env: 0
classmethod: STSRestClass
product_ProductListRead


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'ProductListRead'
		pModelName: 'STSAPIPRProductListStore'
		rModelName: 'STSAPIProductListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiProductProductListRead: aSTSAPIPRProductListStore options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiProductProductListRead: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - license-management'
set compile_env: 0
classmethod: STSRestClass
license_APIDeclaration

	| newInstance |
	newInstance := MSKSwaggerAPIDeclaration new initialize.

	newInstance description: 'license'.
	newInstance path: 'apis/sts/v1/api-doc/',self license_GroupName,'.{format}'.
	newInstance resourcePath: '/', self license_GroupName.
	newInstance jsonName: self license_JSONName.
	newInstance addJSONProduceSpecification.
	newInstance basePath: './'. 
	newInstance addAllAPI: self license_LicenseList_BuildAPI.
	newInstance addAllAPI: self license_LicenseOptionList_BuildAPI.
	newInstance addModel: STSAPIError pumFullSwaggerModel.
	newInstance addModel: STSAPILicenseOptionListStorePL pumFullSwaggerModel.
	newInstance addModel: STSAPIPRLicenseListStore pumFullSwaggerModel.
	newInstance addModel: STSAPILicenseListStoreRL pumFullSwaggerModel.
	newInstance addModel: STSAPILicenseOptionListStoreRL pumFullSwaggerModel.
	newInstance addModel: STSAPILicense pumFullSwaggerModel.
	newInstance addModel: STSAPILicenseListStorePL pumFullSwaggerModel.
	newInstance addModel: STSAPILicenseOption pumFullSwaggerModel.
	newInstance addModel: STSAPIGeneralResult pumFullSwaggerModel.
	newInstance addModel: STSAPIPRLicenseOptionListStore pumFullSwaggerModel.

	^newInstance
%
category: 'group - license-management'
set compile_env: 0
classmethod: STSRestClass
license_GroupName

	^'license'
%
category: 'group - license-management'
set compile_env: 0
classmethod: STSRestClass
license_JSONName

	^ 'license.json'
%
category: 'group - license-management'
set compile_env: 0
classmethod: STSRestClass
license_LicenseList_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LicenseListCreate';
			addOperation: self license_LicenseListCreate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LicenseListDestroy';
			addOperation: self license_LicenseListDestroy ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LicenseListUpdate';
			addOperation: self license_LicenseListUpdate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LicenseListRead';
			addOperation: self license_LicenseListRead ;
			yourself);
		yourself

%
category: 'group - license-management'
set compile_env: 0
classmethod: STSRestClass
license_LicenseList_Name

	^'LicenseList'

%
category: 'group - license'
set compile_env: 0
classmethod: STSRestClass
license_LicenseListCreate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LicenseListCreate'
		pModelName: 'STSAPILicenseListStorePL'
		rModelName: 'STSAPILicenseListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiLicenseLicenseListCreate: aSTSAPILicenseListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiLicenseLicenseListCreate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - license'
set compile_env: 0
classmethod: STSRestClass
license_LicenseListDestroy


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LicenseListDestroy'
		pModelName: 'STSAPILicenseListStorePL'
		rModelName: 'STSAPIGeneralResult'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiLicenseLicenseListDestroy: aSTSAPILicenseListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiLicenseLicenseListDestroy: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - license'
set compile_env: 0
classmethod: STSRestClass
license_LicenseListUpdate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LicenseListUpdate'
		pModelName: 'STSAPILicenseListStorePL'
		rModelName: 'STSAPILicenseListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiLicenseLicenseListUpdate: aSTSAPILicenseListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiLicenseLicenseListUpdate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - license'
set compile_env: 0
classmethod: STSRestClass
license_LicenseListRead


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LicenseListRead'
		pModelName: 'STSAPIPRLicenseListStore'
		rModelName: 'STSAPILicenseListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiLicenseLicenseListRead: aSTSAPIPRLicenseListStore options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiLicenseLicenseListRead: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - license-management'
set compile_env: 0
classmethod: STSRestClass
license_LicenseOptionList_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LicenseOptionListCreate';
			addOperation: self license_LicenseOptionListCreate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LicenseOptionListDestroy';
			addOperation: self license_LicenseOptionListDestroy ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LicenseOptionListUpdate';
			addOperation: self license_LicenseOptionListUpdate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/LicenseOptionListRead';
			addOperation: self license_LicenseOptionListRead ;
			yourself);
		yourself

%
category: 'group - license-management'
set compile_env: 0
classmethod: STSRestClass
license_LicenseOptionList_Name

	^'LicenseOptionList'

%
category: 'group - license'
set compile_env: 0
classmethod: STSRestClass
license_LicenseOptionListCreate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LicenseOptionListCreate'
		pModelName: 'STSAPILicenseOptionListStorePL'
		rModelName: 'STSAPILicenseOptionListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiLicenseLicenseOptionListCreate: aSTSAPILicenseOptionListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiLicenseLicenseOptionListCreate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - license'
set compile_env: 0
classmethod: STSRestClass
license_LicenseOptionListDestroy


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LicenseOptionListDestroy'
		pModelName: 'STSAPILicenseOptionListStorePL'
		rModelName: 'STSAPIGeneralResult'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiLicenseLicenseOptionListDestroy: aSTSAPILicenseOptionListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiLicenseLicenseOptionListDestroy: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - license'
set compile_env: 0
classmethod: STSRestClass
license_LicenseOptionListUpdate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LicenseOptionListUpdate'
		pModelName: 'STSAPILicenseOptionListStorePL'
		rModelName: 'STSAPILicenseOptionListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiLicenseLicenseOptionListUpdate: aSTSAPILicenseOptionListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiLicenseLicenseOptionListUpdate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - license'
set compile_env: 0
classmethod: STSRestClass
license_LicenseOptionListRead


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'LicenseOptionListRead'
		pModelName: 'STSAPIPRLicenseOptionListStore'
		rModelName: 'STSAPILicenseOptionListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiLicenseLicenseOptionListRead: aSTSAPIPRLicenseOptionListStore options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiLicenseLicenseOptionListRead: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - customer-management'
set compile_env: 0
classmethod: STSRestClass
customer_APIDeclaration

	| newInstance |
	newInstance := MSKSwaggerAPIDeclaration new initialize.

	newInstance description: 'customer'.
	newInstance path: 'apis/sts/v1/api-doc/',self customer_GroupName,'.{format}'.
	newInstance resourcePath: '/', self customer_GroupName.
	newInstance jsonName: self customer_JSONName.
	newInstance addJSONProduceSpecification.
	newInstance basePath: './'. 
	newInstance addAllAPI: self customer_CustomerList_BuildAPI.
	newInstance addModel: STSAPIError pumFullSwaggerModel.
	newInstance addModel: STSAPICustomer pumFullSwaggerModel.
	newInstance addModel: STSAPICustomerListStoreRL pumFullSwaggerModel.
	newInstance addModel: STSAPIPRCustomerListStore pumFullSwaggerModel.
	newInstance addModel: STSAPIGeneralResult pumFullSwaggerModel.
	newInstance addModel: STSAPICustomerListStorePL pumFullSwaggerModel.

	^newInstance
%
category: 'group - customer-management'
set compile_env: 0
classmethod: STSRestClass
customer_GroupName

	^'customer'
%
category: 'group - customer-management'
set compile_env: 0
classmethod: STSRestClass
customer_JSONName

	^ 'customer.json'
%
category: 'group - customer-management'
set compile_env: 0
classmethod: STSRestClass
customer_CustomerList_BuildAPI


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^OrderedCollection new
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/CustomerListCreate';
			addOperation: self customer_CustomerListCreate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/CustomerListDestroy';
			addOperation: self customer_CustomerListDestroy ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/CustomerListUpdate';
			addOperation: self customer_CustomerListUpdate ;
			yourself);
		add: ( MSKSwaggerSingleAPIDeclaration new initialize
			path: '/sts/v1/normal/a/CustomerListRead';
			addOperation: self customer_CustomerListRead ;
			yourself);
		yourself

%
category: 'group - customer-management'
set compile_env: 0
classmethod: STSRestClass
customer_CustomerList_Name

	^'CustomerList'

%
category: 'group - customer'
set compile_env: 0
classmethod: STSRestClass
customer_CustomerListCreate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'CustomerListCreate'
		pModelName: 'STSAPICustomerListStorePL'
		rModelName: 'STSAPICustomerListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiCustomerCustomerListCreate: aSTSAPICustomerListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiCustomerCustomerListCreate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - customer'
set compile_env: 0
classmethod: STSRestClass
customer_CustomerListDestroy


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'CustomerListDestroy'
		pModelName: 'STSAPICustomerListStorePL'
		rModelName: 'STSAPIGeneralResult'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiCustomerCustomerListDestroy: aSTSAPICustomerListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiCustomerCustomerListDestroy: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - customer'
set compile_env: 0
classmethod: STSRestClass
customer_CustomerListUpdate


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'CustomerListUpdate'
		pModelName: 'STSAPICustomerListStorePL'
		rModelName: 'STSAPICustomerListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiCustomerCustomerListUpdate: aSTSAPICustomerListStorePL options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiCustomerCustomerListUpdate: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
category: 'group - customer'
set compile_env: 0
classmethod: STSRestClass
customer_CustomerListRead


	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^self
		createPostPutDeleteMessage: 'POST'
		named: 'CustomerListRead'
		pModelName: 'STSAPIPRCustomerListStore'
		rModelName: 'STSAPICustomerListStoreRL'
		pDescription: ''
		summary: ''
		notes: ''
		"		Please implement and change the following method pattern on the class side of your serviceClass <STSServiceClass> according to your needs. Especially the result structures and commit calls.
		apiCustomerCustomerListRead: aSTSAPIPRCustomerListStore options: aMSKRestCallOptions
		 
		^(self restAnswerClass okRequestFor: aMSKRestCallOptions restCallInstance result: (STSAPIGeneralResult with: aSTSAPIObjectWithIDs)) 
			successWithCommitCall;
			yourself
		"
		serviceBlock: [ :restCallInstance :aMSKRestCallOptions | aMSKRestCallOptions executeWithMeDuring: [  STSServiceClass apiCustomerCustomerListRead: aMSKRestCallOptions pumCallParameter options: aMSKRestCallOptions ]]
		sessionNeeded: true
		debugCall: false


%
doit
MSKRESTAPIAnswerV2 subclass: 'STSRESTAnswerClass'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSRESTAnswerClass includesCategory: eachName ) ifTrue:[ STSRESTAnswerClass removeCategory: eachName ].
( STSRESTAnswerClass class includesCategory: eachName ) ifTrue:[ STSRESTAnswerClass class removeCategory: eachName ]
].

%
doit
PUMGeneralServiceClass subclass: 'STSServiceClass'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSServiceClass includesCategory: eachName ) ifTrue:[ STSServiceClass removeCategory: eachName ].
( STSServiceClass class includesCategory: eachName ) ifTrue:[ STSServiceClass class removeCategory: eachName ]
].

%
doit
MSKRestCall subclass: 'STSAPIManualRestCall'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIManualRestCall includesCategory: eachName ) ifTrue:[ STSAPIManualRestCall removeCategory: eachName ].
( STSAPIManualRestCall class includesCategory: eachName ) ifTrue:[ STSAPIManualRestCall class removeCategory: eachName ]
].

%
doit
MSKSpecificAPIJsonData subclass: 'STSSpecificAPIJsonData'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSSpecificAPIJsonData includesCategory: eachName ) ifTrue:[ STSSpecificAPIJsonData removeCategory: eachName ].
( STSSpecificAPIJsonData class includesCategory: eachName ) ifTrue:[ STSSpecificAPIJsonData class removeCategory: eachName ]
].

%
doit
MSKAPIJsonData subclass: 'STSAPIJSONData'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSAPIJSONData includesCategory: eachName ) ifTrue:[ STSAPIJSONData removeCategory: eachName ].
( STSAPIJSONData class includesCategory: eachName ) ifTrue:[ STSAPIJSONData class removeCategory: eachName ]
].

%
doit
MSKRestCallV2 subclass: 'STSRestClass'
	instVarNames: #( )
	classVars: #( )
	classInstVars: #( )
	poolDictionaries: #( )
	inDictionary: 'UserGlobals'
	category: 'StatisticsServer'
	options: #( )
%
doit
#('model' 'model-initialize' 'model-support' 'model-private-attributes' 'model-json-support' 'model-revision' 'model-public-attributes' 'model-public-adding' 'model-public-removing' 'model-private-adding' 'model-private-removing' 'model-public-testing' 'model-public-searching' 'model-swagger' 'model-csv-support' 'model-indices' 'model-public-attributes-derived' 'framework-helpers' 'framework-indices' 'framework-instance-creation' 'framework-migration-support' 'framework-definitions' ) do: [ :eachName | 
( STSRestClass includesCategory: eachName ) ifTrue:[ STSRestClass removeCategory: eachName ].
( STSRestClass class includesCategory: eachName ) ifTrue:[ STSRestClass class removeCategory: eachName ]
].

%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
restBaseErrorClass

	^STSAPIGeneralResult
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRESTAnswerClass
baseResultStructureClass

	^STSAPIGeneralResult
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
restBaseErrorClass

	^STSAPIGeneralResult
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
errorMessageClass

	^STSEnumErrorDefinitionLocaleErrorDefinition
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
restAnswerClass

	^STSRESTAnswerClass
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
projectClass

	^STSProject
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
dataRootInstance

	^(StatisticsServerData at: #'DataRootInstance')
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
clearDataRootInstance

	StatisticsServerData at: #'DataRootInstance' put: self projectClass new initialize
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
searchSessionViaID: sessionID

	^self dataRootInstance searchViaKeyApplicationSession: sessionID asNumber
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSServiceClass
throwParameterNotDefinedBlock

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
	^[ :pName :options | STSEnumErrorDefinitionLocaleErrorDefinition errCodeParameterNotDefinedThrowSignal: options with1Args: (Array with: pName) ]
%
category: 'framework-maintenance'
set compile_env: 0
classmethod: STSServiceClass
cleanupRCClasses
	"First simple code to cleanup all instances of Rc* classes - be aware of the prerequisites when executing this code (take down all GEMs). Do not forget to make a commit"

	| array |

	array := (SystemRepository listInstances: { RcQueue. RcIdentityBag.  RcCounter. }). 
	(array at: 1) do: [:each | each cleanupQueue].
	(array at: 2) do: [:each | each cleanupBag].
	(array at: 3) do: [:each | each cleanupCounter].
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSAPIManualRestCall
restAnswerClass

	^STSRESTAnswerClass
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSAPIManualRestCall
projectClass

	^STSProject
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSSpecificAPIJsonData
manualRestCallSuperclass

	^STSAPIManualRestCall

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSSpecificAPIJsonData
autoRestCallSuperclass

	^STSRestClass

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSSpecificAPIJsonData
pattern

	^ Array with: 'sts' with: 'v1' with: 'api-doc' with: '*'

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSAPIJSONData
manualRestCallSuperclass

	^STSAPIManualRestCall

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSAPIJSONData
autoRestCallSuperclass

	^STSRestClass

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSAPIJSONData
pattern

	^ Array with: 'sts' with: 'v1' with: 'api-docs'

%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
restAnswerClass

	^STSRESTAnswerClass
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
projectClass

	^STSProject
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
pattern

	^ Array with: self firstPartOfPath with: self versionPartOfPath with: '{OperationType}' with: 'a' with: '{MessageNickName}'
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
pattern

	^ Array with: self firstPartOfPath with: self versionPartOfPath with: '{OperationType}' with: 'a' with: '{MessageNickName}'
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
restServiceClass

	^STSServiceClass
%
category: 'framework-definitions'
set compile_env: 0
classmethod: STSRestClass
restServiceSessionClass

	^STSApplicationSession
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
firstPartOfPath

	^'sts'
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
versionPartOfPath

	^'v1'
%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
saveJSONFiles
	| result |

	self buildAPIDefinitionsStructure.
	result := GsFile isServerDirectory: '/var/www/html/apis'.
	(result isNil or:[ result not ]) ifTrue: [ (GsFile createServerDirectory: '/var/www/html/apis' mode: 8r777) isNil ifTrue:[ ^'Error creating </var/www/html/apis>' ]].
	result := GsFile isServerDirectory: '/var/www/html/apis/sts'.
	(result isNil or:[ result not ])  ifTrue: [ (GsFile createServerDirectory: '/var/www/html/apis/sts' mode: 8r777) isNil ifTrue:[ ^'Error creating </var/www/html/apis/sts>' ]].
	result := GsFile isServerDirectory: '/var/www/html/apis/sts/v1'.
	(result isNil or:[ result not ])  ifTrue: [ (GsFile createServerDirectory: '/var/www/html/apis/sts/v1' mode: 8r777) isNil ifTrue:[ ^'Error creating </var/www/html/apis/sts/v1>' ]].
	result := GsFile isServerDirectory: '/var/www/html/apis/sts/v1/api-doc'.
	(result isNil or:[ result not ])  ifTrue: [ (GsFile createServerDirectory: '/var/www/html/apis/sts/v1/api-doc' mode: 8r777) isNil ifTrue:[ ^'Error creating </var/www/html/apis/sts/v1/api-doc>' ]].
	(GsFile openWriteOnServer: '/var/www/html/apis/sts/v1/api-docs.json')
		nextPutAll: STSAPIJSONData jsonAPIText asString ;
		close ;
		yourself.
	STSRestClass apiDefinitions do: [ :eachMSKSwaggerAPIDeclaration |
		(GsFile openWriteOnServer: ('/var/www/html/apis/sts/v1/api-doc/',eachMSKSwaggerAPIDeclaration jsonName))
			nextPutAll: (STSSpecificAPIJsonData jsonAPIText: eachMSKSwaggerAPIDeclaration jsonName) encodeAsUTF8 ;
			close ;
			yourself.
	].

%
category: 'framework-helpers'
set compile_env: 0
classmethod: STSRestClass
addAllAPIDefinitions

	self addAPIDeclaration: self session_APIDeclaration.
	self addAPIDeclaration: self system_APIDeclaration.
	self addAPIDeclaration: self user_APIDeclaration.
	self addAPIDeclaration: self product_APIDeclaration.
	self addAPIDeclaration: self license_APIDeclaration.
	self addAPIDeclaration: self customer_APIDeclaration.
%
category: 'model-support'
set compile_env: 0
classmethod: STSProject
classCreated

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.1'  "

	^(Array new) 
		add: STSAPICustomer;
		add: STSAPIGeneralParameterObject;
		add: STSAPIPRSessionListStore;
		add: STSAPICustomerListStorePL;
		add: STSAPIError;
		add: STSUsageMessage;
		add: STSAPISessionCreationParameter;
		add: STSAPIGeneralResult;
		add: STSAPIProduct;
		add: STSAPIPRUserListStore;
		add: STSAPIApplicationUser;
		add: STSGeneralDomain;
		add: STSAPIUserListStorePL;
		add: STSAPIPRCustomerListStore;
		add: STSAPILicenseListStoreRL;
		add: STSAPILicenseOptionListStoreRL;
		add: STSApplicationSession;
		add: STSAPIProductListStorePL;
		add: STSAPIPRProductListStore;
		add: STSLogEntries;
		add: STSLicenseOption;
		add: STSAPILogEntries;
		add: STSAPILogEntryListStoreRL;
		add: STSAPIPagedRequest;
		add: STSAPIUserListStoreRL;
		add: STSAPICustomerListStoreRL;
		add: STSAPIGeneralParameterObjectList;
		add: STSAPIPRLogEntryListStore;
		add: STSAPIObjectWithIDs;
		add: STSAPILogEntryListStorePL;
		add: STSAPILicenseListStorePL;
		add: STSAPILicenseOption;
		add: STSAPIPRLicenseOptionListStore;
		add: STSAPIApplicationSession;
		add: STSLicense;
		add: STSCustomer;
		add: STSProject;
		add: STSAPIGeneralObject;
		add: STSAPILicense;
		add: STSProduct;
		add: STSApplicationUser;
		add: STSAPILicenseOptionListStorePL;
		add: STSAPIResultListWithSingleObject;
		add: STSAPISessionListStoreRL;
		add: STSAPIObjectsWithoutIDs;
		add: STSAPIProductListStoreRL;
		add: STSAPIPRLicenseListStore;
		add: STSAPISessionListStorePL;
		yourself 

%
category: 'framework-migration-support'
set compile_env: 0
classmethod: STSProject
migrateAllInstances
	"STSProject migrateAllInstances "

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "

	super migrateAllInstances

%
category: 'framework-data-initialize'
set compile_env: 0
classmethod: STSProject
preInitializeDataDictionary
	"STSProject preInitializeDataDictionary "

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
| aSymbol names userProfile symbolDictionary | 
aSymbol := #'StatisticsServerData'.
userProfile := System myUserProfile.
names := userProfile symbolList names.
(names includes: aSymbol) ifFalse: [
	symbolDictionary := SymbolDictionary new name: aSymbol; yourself.
	userProfile insertDictionary: symbolDictionary at: names size + 1.
].

%
category: 'framework-data-initialize'
set compile_env: 0
classmethod: STSProject
postInitializeDataDictionary
	"STSProject postInitializeDataDictionary "

	" Generator: 'Topaz/Gemstone (REST Server Smalltalk)' Version: '9.48' LastRun: '2020_04_15_14_44_24' "
	" Model-Version: '0.006'  "
| userProfile symbolDictionary |
(symbolDictionary := System myUserProfile objectNamed: 'StatisticsServerData') isNil ifFalse:[
	(symbolDictionary includesKey: #'DataRootInstance') ifFalse: [
		| projectClass | 
		(projectClass := System myUserProfile objectNamed: 'STSProject') isNil ifFalse:[
			symbolDictionary at: #'DataRootInstance' put: projectClass new initialize
		].
	].
].

%
run 
| aSymbol names userProfile symbolDictionary | 
aSymbol := #'StatisticsServerData'.
userProfile := System myUserProfile.
names := userProfile symbolList names.
(names includes: aSymbol) ifFalse: [
	symbolDictionary := SymbolDictionary new name: aSymbol; yourself.
	userProfile insertDictionary: symbolDictionary at: names size + 1.
].
(symbolDictionary := System myUserProfile objectNamed: 'StatisticsServerData') isNil ifFalse:[
	(symbolDictionary includesKey: #'DataRootInstance') ifFalse: [
		| projectClass | 
		(projectClass := System myUserProfile objectNamed: 'STSProject') isNil ifFalse:[
			symbolDictionary at: #'DataRootInstance' put: projectClass new initialize
		].
	].
].
%
commit
doit
	STSRestClass saveJSONFiles.
%
EOF
