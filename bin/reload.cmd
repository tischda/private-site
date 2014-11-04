@echo off
:: ---------------------------------------------------------------------------
:: reload.cmd - reloads configuration (see http://nginx.org/en/docs/windows.html)
:: ---------------------------------------------------------------------------
setlocal

set NOX_BIN=%~dp0
pushd %NOX_BIN%\nginx*
nginx -s reload
popd
