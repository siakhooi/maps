info:
	ogrinfo src/public-transport/my/klang-valley/brt.kml

convert:
	ogr2ogr -f GeoJSON out.geojson src/public-transport/my/klang-valley/brt.kml

info2:
	ogrinfo out.geojson

clean:
	rm -rf www
build:
	scripts/build.sh
install:
	scripts/install-dependencies.sh
