@echo off
:: ---------------------------------------------------------------------------
:: dist.cmd - build web site from source
:: ---------------------------------------------------------------------------
setlocal

:: set environment
set NOX_BIN=%~dp0
pushd %NOX_BIN%\..
set NOX_HOME=%cd%
popd
set NOX_DIST=%NOX_HOME%\dist
set SGML_CATALOG_FILES=%NOX_HOME%\catalog.xml

:: start clean
call %NOX_BIN%\clean.cmd

:: compile files
echo Entering %NOX_HOME%\xml
cd %NOX_HOME%\xml
echo Generating files...

if not exist %NOX_DIST% mkdir %NOX_DIST%

xcopy /T . %NOX_DIST%

%NOX_BIN%\xbuild.exe .xml "%NOX_BIN%\nox.exe --catalogs --nodtdattr -t %NOX_DIST% -d menu.xi %* %NOX_HOME%/xslt/common.xsl"

echo.
echo Copying resources to %NOX_DIST%
xcopy %NOX_HOME%\res\*.* %NOX_DIST% /E/Q/Y/D

endlocal