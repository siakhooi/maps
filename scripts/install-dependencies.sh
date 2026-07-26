#!/usr/bin/env bash

set -euo pipefail
set -x

sudo apt update 
sudo apt install -y gdal-bin

ogr2ogr --version
