close tables all
SET TALK OFF
set excl off
set dele on
set escape oFF
SET SAFETY OFF
*SET PROCEDURE TO funciones
	SET PROCEDURE TO LOCFILE("\tasas20xx\programa\foxbarcodeqr.prg") ADDITIVE
with _screen
	.WINDOWSTATE=2
	.picture='TASAS-2019.JPG'
	.AUTOCENTER=.T.
	.Caption = 'Sistema de Liquidación de Tasas por Alcantarillado-[@rjgm] v.2019-20'
	.ShowTips = .T.
endwith
set excl off
set cent on
SET DATE TO french
editwork=HOME(7)
sortwork=home(7)
progwork=home(7)
tmpfile=HOME(7)
*resource=off

SET STATUS Off
SET STATUS bar off
*suspend

CREATE CURSOR MyCampos(campo CHR(10))
SET COMPATIBLE  OFF 
SET EXCLUSIVE ON  
USE Y:\TASAS20XX\DATOS\PLAN_PAG IN 0 EXCLUSIVE  
SELECT PLAN_PAG

FOR gnContador=1 TO FCOUNT()
Miscampos=FIELD(gnContador)
INSERT INTO Mycampos(campo) values(Miscampos)
NEXT 
SELECT * FROM MyCampos WHERE ALLTRIM(campo)=='TIPO' INTO CURSOR MyComp
IF _tally>0  THEN 
ELSE 
	ALTER TABLE Y:\TASAS20XX\DATOS\PLAN_PAG ADD COLUMN TIPO INT(2)
ENDIF 

PUBLIC FECHASYS
RUN net time \\192.168.154.35 >fecha.dat
USE \tasas20xx\programa\fechaser EXCLUSIVE
zap
APPEND FROM \tasas20xx\programa\fecha.dat TYPE sdf
GOTO 1
f1=AT('/',time)
FECHA=SUBSTR(TIME,f1-2,10)
fh=AT('/',fecha)
IF fh=2
	m=SUBSTR(fecha,1,1)
	m=PADL(m,2,'0')
	fecha1=SUBSTR(fecha,3,2)
ELSE
	m=SUBSTR(fecha,1,2)
	fecha1=SUBSTR(fecha,4,2)
ENDIF
fj=AT('/',fecha1)
IF fj=2
	d=SUBSTR(fecha1,1,1)
	d=PADL(d,2,'0')
	fecha=LEFT(fecha,9)
else
	d=SUBSTR(fecha1,1,2)
ENDIF
A=RIGHT(ALLTRIM(FECHA),4)
FECHASYS=CTOD(D+'/'+M+'/'+A)
WAIT WINDOW fechasys

do form \tasas20xx\programa\clave
do \tasas20xx\programa\meprinc.mpr
CLOSE TABLES ALL
read event