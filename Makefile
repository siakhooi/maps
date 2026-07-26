install:
	sudo apt update
	sudo apt install gdal-bin

	ogr2ogr --version
	gdalinfo --version

info:
	ogrinfo src/public-transport/my/klang-valley/brt.kml

convert:
	ogr2ogr -f GeoJSON out.geojson src/public-transport/my/klang-valley/brt.kml

info2:
	ogrinfo out.geojson

clean:
	rm -rf docs
build:
	scripts/build.sh
