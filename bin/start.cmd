@echo off
:: ---------------------------------------------------------------------------
:: start.cmd - starts the web server (see http://nginx.org/en/docs/windows.html)
:: ---------------------------------------------------------------------------
setlocal

set NOX_BIN=%~dp0

pushd %NOX_BIN%nginx*
if not exist logs md logs > nul
if not exist logs\nginx.pid start nginx
popd

endlocal
