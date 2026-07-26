#!/usr/bin/env bash

set -eou pipefail

target_root=www
source=src
kml_source_root=$source/kml/public-transport/my/klang-valley
geojson_target=$target_root/public-transport/my/klang-valley

rm -rf "$target_root"

if [[ ! -d "$kml_source_root" ]]; then
    echo "Source directory $kml_source_root not found" >&2
    exit 1
fi

source_file_name=brt.kml
target_file_name=brt.geojson
source_file=$kml_source_root/$source_file_name

if [[ ! -f "$source_file" ]]; then
    echo "Source file $source_file not found" >&2
    exit 1
fi

mkdir -p "$geojson_target"

target_file=$geojson_target/$target_file_name

set -x
ogr2ogr -f GeoJSON "$target_file" "$source_file"

cp -v src/www/* www/
