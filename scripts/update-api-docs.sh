#!/bin/sh

echo "removing old content"
rm -rf static/api
mkdir -p static/api

echo "building documentation"
make -C specs

echo "copying docs into static directory"
for x in marketplace; do
	mkdir -p static/api/api-$x
	cp specs/api-$x.valid static/api/api-$x/api-${x}.json
	cp specs/api-$x.html static/api/api-${x}/index.html
done
