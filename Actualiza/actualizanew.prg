*****
set talk off
clear
close all
clear all
set sysmenu off
Set Multilocks ON
Set confir ON
Set Exclusive OFF
set safety off
set century ON
SET DATE YMD
SET LOCK ON
SET REFRESH TO 5
set century on
SET REPROCES TO AUTOMATIC
Set exclusive OFF
Close database
CLOSE tables
*****
set talk off
SET CONSOLE OFF 
close all
clear all
SET SYSMENU OFF
SET SAFETY OFF
Application.Visible=.F.
*MESSAGEBOX("Hasta aca renombra el aron antiguo")
WAIT "LA ACTUALIZACION EMPEZARA DE UNOS 5 SEGUNDOS . . . . " WINDOW AT 20,45 TIMEOUT 5
RENAME "\tasas20xx\programa\tasas2020.exe" TO "\tasas20xx\programa\tasas2020old.exe"
COPY FILE  \\192.168.154.35\tasas20xx\tasas2020.exe to \tasas20xx\programa\tasas2020.exe

DECLARE INTEGER FindWindow IN WIN32API ; 
STRING cNULL, ; 
STRING cWinName 
DECLARE SetForegroundWindow IN WIN32API ; 
INTEGER nHandle 

nHWD = FindWindow(0, _screen.caption)
SetForegroundWindow(nHWD)

MESSAGEBOX("El sistema se ha actualizado correctamente", 48, "Fin de actualización")
RUN /N "\tasas20xx\programa\tasas2020.exe"
QUIT 
ON SHUTDOWN