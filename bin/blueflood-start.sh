#!/bin/bash

#
# This is a simple script that can be used to start blueflood service.
# To run this, you must have built the blueflood package by running:
#     mvn clean package -P all-modules
#

# directory where the script is located
SCRIPTDIR=`pwd`/`dirname $0`  

REPODIR=$SCRIPTDIR/..

JAVA=/usr/bin/java

$JAVA \
        -cp $REPODIR/bin/blueflood-all-2.1.0-SNAPSHOT-jar-with-dependencies.jar \
        -Dblueflood.config=file://$REPODIR/config/blueflood.conf \
        -Dlog4j.configuration=file://$REPODIR/config/blueflood-log4j.properties \
         com.rackspacecloud.blueflood.service.BluefloodServiceStarter

