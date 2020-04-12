@echo off

set inifile=%1
set fparam=%2
set sparam=%3

If Not Exist %inifile% Exit
Set $N=0&
CALL :REPLINE %inifile% %fparam% %sparam%
Exit

:REPLINE
 For /F "eol=; Delims=:" %%i In ('FindStr /BINRC:" *%~2" "%~1"') Do Set $N=%%i
 If %$N% NEQ 0 (@echo Wait...) ELSE exit /B 1
 If Exist "%~dpn1.tmp" DEL /F/Q "%~dpn1.tmp"
 For /F "eol=; Tokens=1* Delims=:" %%i In ('FindStr /ENRC:"$" "%~1"') Do If "%%i"=="%$N%" (
 (Echo %~3)>>"%~dpn1.tmp" ) ELSE Echo.%%j>>"%~dpn1.tmp"
 If Not Exist "%~dpn1.tmp" Exit /B 1
 DEL /F/Q %1
 REN "%~dpn1.tmp" %~nx1
 Exit /B 0