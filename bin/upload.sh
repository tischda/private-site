#!/bin/sh
# ---------------------------------------------------------------------------
# Publishes private site to dtischer.free.fr via FTP
# ---------------------------------------------------------------------------

NOX_BIN=$( cd "$( dirname "$0" )" && pwd )
NOX_HOME=$( cd "$(dirname "$0")/.." && pwd )
NOX_DIST=$NOX_HOME/dist

# ~/passwords.txt
#
# SITE_USER=...
# SITE_PASS=...
# SITE_URL=ftpperso.free.fr

source ~/passwords.txt

/usr/bin/lftp -e "mirror -R --only-newer --delete $NOX_DIST /" -u $SITE_USER,$SITE_PASS $SITE_URL

