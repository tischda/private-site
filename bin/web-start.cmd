@echo off
:: ---------------------------------------------------------------------------
:: start.cmd - starts the web server (see http://nginx.org/en/docs/windows.html)
:: ---------------------------------------------------------------------------
setlocal

set SCRIPT_DIR=%~dp0

pushd %SCRIPT_DIR%nginx*
if not exist logs md logs > nul
if not exist logs\nginx.pid start nginx -c ../conf/nginx.conf
popd

endlocal
