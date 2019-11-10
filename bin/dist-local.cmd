@echo off
:: ---------------------------------------------------------------------------
:: dist-local.cmd - build web site from source with prefix to local directory
:: ---------------------------------------------------------------------------
setlocal 

set SCRIPT_DIR=%~dp0

:: set build target directory
pushd %SCRIPT_DIR%\..
set DIST_DIR=file://%cd%/dist
popd

:: build site
call %SCRIPT_DIR%\dist.cmd -p prefix %DIST_DIR% %*

endlocal