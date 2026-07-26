#!/usr/bin/env bash

set -eou pipefail

source_root=src/public-transport/my/klang-valley
target_root=docs/public-transport/my/klang-valley

if [[ ! -d "$source_root" ]]; then
    echo "Source directory $source_root not found" >&2
    exit 1
fi

source_file_name=brt.kml
target_file_name=brt.geojson
source_file=$source_root/$source_file_name


if [[ ! -f "$source_file" ]]; then
    echo "Source file $source_file not found" >&2
    exit 1
fi

mkdir -p "$target_root"

target_file=$target_root/$target_file_name

set -x
ogr2ogr -f GeoJSON "$target_file" "$source_file"
