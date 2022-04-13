@echo off
:start
echo --------------------------------------
echo. 
echo             Assembler Tool
echo. 
echo --------------------------------------
echo.
echo     Light(1)    Dark(2)     Exit(3)
echo.
set /p Input=Selection: 
if /I "%Input%" == "1" goto light
if /I "%Input%" == "2" goto dark
if /I "%Input%" == "3" goto exit
if /I "%Input%" == "exit" goto exit
goto error


:light
mkdir Temp
xcopy /E ..\Slimefun-Networks-Visualizer\ Temp
xcopy /y Light\*.json Temp\assets\minecraft\optifine\cit\gui
xcopy /y Light\pack.mcmeta Temp
if exist "*.zip" (del *.zip)
7z a -tzip "Slimefun Networks Visualizer" ./Temp/*
rmdir /s /q Temp
goto start


:dark
mkdir Temp
xcopy /E ..\Slimefun-Networks-Visualizer\ Temp
xcopy /y Dark\*.json Temp\assets\minecraft\optifine\cit\gui
xcopy /y Dark\pack.mcmeta Temp
if exist "*.zip" (del *.zip)
7z a -tzip "Slimefun Networks Visualizer" ./Temp/*
rmdir /s /q Temp
goto start


:error
echo %Input% is not a valid option
pause
goto :start


:exit
exit