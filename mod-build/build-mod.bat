@echo off 

set mod-target=D:\program-files\Steam\steamapps\common\Quake 4\my-file

:: delete every folder named in folder-cache 
echo ---DELETING FOLDERS IN QUAKE MOD FOLDER---
for /F "tokens=*" %%b in (folder-cache.txt) do (
    echo deleting "%%b" ...
    rmdir "%mod-target%/%%b" /Q /S 1>nul
)
echo:

:: reset folder-cache 
break>folder-cache.txt
echo ---TRANSFERRING FILES FROM ./mod-files TO QUAKE MOD FOLDER---
for /D %%a in (./mod-files/*) do (
    echo moving "./mod-files/%%a"
    echo %%a>> folder-cache.txt

    Xcopy "./mod-files/%%a" "%mod-target%/%%a" /E/Y/I > nul
)

pause