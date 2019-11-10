@echo off
:: ---------------------------------------------------------------------------
:: reload.cmd - reloads configuration (see http://nginx.org/en/docs/windows.html)
:: ---------------------------------------------------------------------------
setlocal

set SCRIPT_DIR=%~dp0
pushd %SCRIPT_DIR%\nginx*
nginx -s reload
popd

endlocal
