@echo off
:: ---------------------------------------------------------------------------
:: start.cmd - starts the web server (see http://nginx.org/en/docs/windows.html)
:: ---------------------------------------------------------------------------
setlocal

set NOX_BIN=%~dp0
pushd %NOX_BIN%\nginx*
md logs > nul
start nginx
popd
