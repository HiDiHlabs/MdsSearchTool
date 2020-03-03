:: How to Deploy:

set MY_PATH=C:\projects

cd %MY_PATH%/MdsSearchTool

:: %MY_PATH%/MdsSearchTool

set -m GRAILS_OPS -Dhttp.proxyHost=www-int2.inet.dkfz-heidelberg.de -Dhttp.proxyPort=3128 -Dhttps.proxyHost=www-int2.inet.dkfz-heidelberg.de -Dhttps.proxyPort=3128
grails dev war %GRAILS_OPS%
grails dev war
cp %MY_PATH%/MdsSearchTool/target/centralsearch-1.0.war %MY_PATH%/MdsSearchTool/docker

:: .mdsearch.properties must be configured
cp %MY_PATH%/MdsSearchTool/.mdsearch.properties %MY_PATH%/MdsSearchTool/

cd %MY_PATH%/MdsSearchTool/docker


:: %MY_PATH%/MdsSearchTool/docker

docker-compose build
::docker-compose up -d
docker-compose up

