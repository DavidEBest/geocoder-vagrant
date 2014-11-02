#!/usr/bin/env bash

# update and upgrade
apt-get update
apt-get upgrade

# install baseline stuff
apt-get install -y build-essential python-all-dev git vim python-dev python-pip python-software-properties g++ gcc make libssl-dev libreadline6-dev libaio-dev libbz2-dev zlib1g-dev libjpeg62-dev libpcre3-dev libexpat1-dev libxml2 libxml2-dev libjson0 libjson0-dev liblzma-dev libevent-dev wget zip unzip

# add postgres
apt-get install -y postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3 libpq-dev postgresql-server-dev-9.3

# compile GDAL and GEOS libraries from source
apt-get install -y binutils libproj-dev libgeoip1 libgtk2.0 xsltproc docbook-xsl docbook-mathml

wget http://download.osgeo.org/geos/geos-3.4.2.tar.bz2
tar xfj geos-3.4.2.tar.bz2
cd geos-3.4.2
./configure
make
make install
cd ..

wget http://download.osgeo.org/gdal/1.10.1/gdal-1.10.1.tar.gz
tar xfz gdal-1.10.1.tar.gz
cd gdal-1.10.1
./configure --with-python
make
make install
cd ..

apt-get install -y postgresql-9.3-postgis-2.1

