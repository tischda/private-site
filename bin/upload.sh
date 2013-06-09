#!/bin/sh

NOX_BIN=$( cd "$( dirname "$0" )" && pwd )
NOX_HOME=$( cd "$(dirname "$0")/.." && pwd )
NOX_DIST=$NOX_HOME/dist

source ~/passwords.txt

/usr/bin/lftp -e "mirror -R --only-newer --delete $NOX_DIST /" -u $SITE_USER,$SITE_PASS $SITE_URL

