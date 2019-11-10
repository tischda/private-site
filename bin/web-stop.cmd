@echo off
:: ---------------------------------------------------------------------------
:: stop.cmd - stops the web server (see http://nginx.org/en/docs/windows.html)
:: ---------------------------------------------------------------------------
setlocal

set SCRIPT_DIR=%~dp0
pushd %SCRIPT_DIR%\nginx*
nginx -s stop
popd

endlocal