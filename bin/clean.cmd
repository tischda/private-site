@echo off
:: ---------------------------------------------------------------------------
:: clean.cmd - deletes the target build folder
:: ---------------------------------------------------------------------------
setlocal
set NOX_BIN=%~dp0
pushd %NOX_BIN%\..
set NOX_HOME=%cd%
popd

echo Removing: "%NOX_HOME%\dist"
if exist "%NOX_HOME%\dist" rd /Q /S "%NOX_HOME%\dist"

endlocal
