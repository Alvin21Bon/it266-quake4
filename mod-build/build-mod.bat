@echo off 

set mod-target=D:\program-files\Steam\steamapps\common\Quake 4\my-file

for /D %%a in (./mod-files/*) do (
    echo moving "./mod-files/%%a" to "%mod-target%"

    rm -r "%mod-target%/%%a"  2> nul
    Xcopy "./mod-files/%%a" "%mod-target%/%%a" /E/Y/I > nul
)