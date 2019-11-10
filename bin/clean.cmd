@echo off
:: ---------------------------------------------------------------------------
:: clean.cmd - deletes the target build folder
:: ---------------------------------------------------------------------------
setlocal
set SCRIPT_DIR=%~dp0

pushd %SCRIPT_DIR%\..
set PROJECT_HOME=%cd%
popd

echo Removing: "%PROJECT_HOME%\dist"
if exist "%PROJECT_HOME%\dist" rd /Q /S "%PROJECT_HOME%\dist"

endlocal
