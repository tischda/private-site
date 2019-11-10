@echo off
:: ---------------------------------------------------------------------------
:: dist.cmd - build web site from source
:: ---------------------------------------------------------------------------
setlocal

:: set environment
set SCRIPT_DIR=%~dp0

pushd %SCRIPT_DIR%\..
set PROJECT_HOME=%cd%
popd

set DIST_DIR=%PROJECT_HOME%\dist
set SGML_CATALOG_FILES=%PROJECT_HOME%\catalog.xml

:: start clean
call %SCRIPT_DIR%\clean.cmd

:: compile files
echo Entering %PROJECT_HOME%\xml
cd %PROJECT_HOME%\xml
echo Generating files...

if not exist %DIST_DIR% mkdir %DIST_DIR%

xcopy /T . %DIST_DIR%

%SCRIPT_DIR%\xbuild.exe .xml "%SCRIPT_DIR%\nox.exe --catalogs --nodtdattr -t %DIST_DIR% -d menu.xi %* %PROJECT_HOME%/xslt/common.xsl"

echo.
echo Copying resources to %DIST_DIR%
xcopy %PROJECT_HOME%\res\*.* %DIST_DIR% /E/Q/Y/D

endlocal