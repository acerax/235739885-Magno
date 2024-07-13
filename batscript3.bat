@echo off
REM BSCRIPT03.bat - Batch script to execute fundamental Windows utilities

:MAINMENU
cls
echo Fundamental Windows Utilities Menu
echo ================================
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
echo 8. Exit
echo.
set /p choice=Enter your choice (1-8): 

if "%choice%"=="1" goto IPCONFIG
if "%choice%"=="2" goto TASKLIST
if "%choice%"=="3" goto CHKDSK
if "%choice%"=="4" goto FORMAT
if "%choice%"=="5" goto DEFRAG
if "%choice%"=="6" goto FIND
if "%choice%"=="7" goto ATTRIB
if "%choice%"=="8" goto EXIT

:IPCONFIG
cls
echo Executing ipconfig...
ipconfig
pause&goto MAINMENU

:TASKLIST
cls
echo Displaying tasklist...
tasklist
set /p taskkill=Enter task name to kill (or press Enter to skip):
if not "%taskkill%"=="" (
    taskkill /IM "%taskkill%"
    echo Killed task: %taskkill%
)
pause&goto MAINMENU

:CHKDSK
cls
echo Executing chkdsk...
set /p drive=Enter drive letter (e.g., C:):
chkdsk %drive%
pause&goto MAINMENU

:FORMAT
cls
echo WARNING: Formatting will erase all data on the selected drive.
set /p confirm=Are you sure you want to format a drive? (Y/N):
if /i "%confirm%"=="Y" (
    set /p drive=Enter drive letter to format (e.g., D:):
    format %drive% /FS:NTFS
    echo Drive %drive% formatted successfully.
) else (
    echo Format operation aborted.
)
pause&goto MAINMENU

:DEFRAG
cls
echo Executing defrag...
defrag C:
echo Defragmentation completed.
pause&goto MAINMENU

:FIND
cls
echo Executing find...
set /p search=Enter filename to search:
set /p path=Enter path to search (or press Enter for current directory):
if not "%path%"=="" (
    set "path=%path%\%search%"
) else (
    set "path=%search%"
)
find "%path%"
pause&goto MAINMENU

:ATTRIB
cls
echo Executing attrib...
set /p attrib_option=Enter attrib option (e.g., +h, -r):
set /p file=Enter filename:
attrib %attrib_option% "%file%"
echo Attributes modified for file: %file%
pause&goto MAINMENU

:EXIT
cls
echo Exiting BSCRIPT03.bat...
exit
