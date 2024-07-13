@echo off

REM Sort text files on Drive C: by date
cd /d C:\
for /f "delims=" %%a in ('dir /b /o:d *.txt') do (
    echo Sorting file: %%a
    REM You can perform sorting operations here
)

REM Archive older files to a folder on Drive Z:
cd /d Z:\
mkdir Archive

for /f "delims=" %%b in ('dir /b /o:d C:\*.txt') do (
    echo Archiving file: %%b
    copy C:\%%b Z:\Archive
)

REM Sort the archived files by size
cd /d Z:\Archive
echo Sorting archived files by size...
dir /os

REM Prompt the user for permission to delete old, large files
set /p delete="Do you want to delete the old, large files? (Y/N): "
if /i "%delete%" equ "Y" (
    del /q /s *.txt
    echo Old, large files deleted.
) else (
    echo Files not deleted.
)
