@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

set "SRC=%~dp0Assets\Mods\GoosePlus"
set "TARGET="

if "%~1"=="" (
  echo.
  echo Paste the folder of an existing Desktop Goose install
  echo   ^(the one that contains GooseDesktop.exe^)
  echo You can also drag that folder onto this .bat file.
  echo.
  set /p "TARGET=Path: "
) else (
  set "TARGET=%~1"
)

set "TARGET=!TARGET:"=!"
if "!TARGET!"=="" (
  echo No path given.
  pause
  exit /b 1
)

if not exist "!TARGET!\GooseDesktop.exe" (
  echo ERROR: GooseDesktop.exe not found in "!TARGET!"
  pause
  exit /b 1
)

echo.
echo Installing GoosePlus into: !TARGET!

if not exist "!TARGET!\Assets\Mods\GoosePlus" mkdir "!TARGET!\Assets\Mods\GoosePlus"
copy /y "%SRC%\GoosePlus.dll" "!TARGET!\Assets\Mods\GoosePlus\" >nul
if errorlevel 1 (
  echo ERROR: could not copy GoosePlus.dll
  pause
  exit /b 1
)

set "CFG=!TARGET!\config.ini"
if not exist "%CFG%" (
  > "%CFG%" echo Version_DoNotEdit=1
  >> "%CFG%" echo EnableMods=True
) else (
  findstr /v /i /b "EnableMods=" "%CFG%" > "%CFG%.tmp"
  >> "%CFG%.tmp" echo EnableMods=True
  move /y "%CFG%.tmp" "%CFG%" >nul
)

echo EnableMods=True set in config.ini

rem Your own GooseDesktop.exe has NOT been patched, so the "Mod Enabler Warning"
rem dialog will still pop up on every launch (answer Yes or no mods load).
rem We do NOT touch your exe -- instead we drop the launcher next to it, which
rem clicks Yes for you. Prefer to get rid of the dialog for good? Run
rem dev\patch-exe.py from the GoosePlus repo against your own exe.
if exist "%~dp0GoosePlusLauncher.exe" (
  copy /y "%~dp0GoosePlusLauncher.exe" "!TARGET!\" >nul
  if not errorlevel 1 echo Copied GoosePlusLauncher.exe ^(clicks the warning dialog for you^).
)

echo.
echo Done.
echo   * To start with the dialog auto-answered: run GoosePlusLauncher.exe
echo   * Or start GooseDesktop.exe and click "Yes" yourself
echo   * Either way, look for the goose icon in the tray.
echo.
pause
