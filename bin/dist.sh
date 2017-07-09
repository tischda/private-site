#!/bin/sh

NOX_BIN=$( cd "$(dirname "$0")" && pwd )
NOX_HOME=$( cd "$(dirname "$0")/.." && pwd )
NOX_DIST=$NOX_HOME/dist

export SGML_CATALOG_FILES=$NOX_HOME/catalog.xml

echo "Entering $NOX_HOME/xml"
cd "$NOX_HOME/xml"
echo "Generating files..."

mkdir -p $NOX_DIST

for f in */; do
  if [ ! -d $NOX_DIST/$f ]; then
    mkdir -p $NOX_DIST/$f;
  fi
done

# Using xbuild:
#$NOX_BIN/xbuild .xml "$NOX_BIN/nox --catalogs --nodtdattr -t $NOX_DIST -d menu.xi $* $NOX_HOME/xslt/common.xsl"

# Using find and xargs with batches of 10 and 3 parallel processes
find * -name "*.xml" -print0 | xargs -0r -n 10 -P 3 $NOX_BIN/nox --catalogs --nodtdattr -t $NOX_DIST -d menu.xi $* $NOX_HOME/xslt/common.xsl

echo -e "\nCopying resources to $NOX_DIST"
rsync -a $NOX_HOME/res/ $NOX_DIST
echo -e

