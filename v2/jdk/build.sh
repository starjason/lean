#!/usr/bin/env bash
set -ex

BUILD_HS=http://172.17.0.1:8000
JAVA_VERSION=8u72
JAVA_VERSION_R=1.8.0_72
JRE_DIST=jdk-$JAVA_VERSION-linux-x64.tar.gz

#mkdir /opt
cd /opt
curl -s $BUILD_HS/$JRE_DIST | tar xz
cd -

ln -s /opt/jdk$JAVA_VERSION_R /opt/jdk

cd /opt/jdk/jre/lib/security
/opt/jdk/bin/keytool -keystore cacerts -importcert \
 -noprompt -storepass changeit \
 -alias sap_root -file /etc/ssl/certs/sap_root_ca.pem
cd -

