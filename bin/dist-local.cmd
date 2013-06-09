@echo off
:: ---------------------------------------------------------------------------
:: dist-local.cmd - build web site from source with prefix to local directory
:: ---------------------------------------------------------------------------

set NOX_BIN=%~dp0
pushd %NOX_BIN%\..
set NOX_DIST=file://%cd%/dist
popd

call %NOX_BIN%\dist.cmd -p prefix %NOX_DIST% %*
