@echo off
:: ---------------------------------------------------------------------------
:: stop.cmd - stops the web server (see http://nginx.org/en/docs/windows.html)
:: ---------------------------------------------------------------------------
setlocal

set NOX_BIN=%~dp0
pushd %NOX_BIN%\nginx*
nginx -s stop
popd
