set date to dmy
PUBLIC FECHASYS
RUN net time \\192.168.154.141 >fecha.dat
USE fechaser EXCLUSIVE
zap
APPEND FROM fecha.dat TYPE sdf
GOTO 1
FECHA=SUBSTR(TIME,40,10)
h=AT('/',fecha)
IF h=2
	m=SUBSTR(fecha,1,1)
	m=PADL(m,2,'0')
	fecha1=SUBSTR(fecha,3,2)
ELSE
	m=SUBSTR(fecha,1,2)
	fecha1=SUBSTR(fecha,4,2)
ENDIF
j=AT('/',fecha1)
IF j=2
	d=SUBSTR(fecha1,1,1)
	d=PADL(d,2,'0')
	fecha=LEFT(fecha,9)
else
	d=SUBSTR(fecha1,1,2)
ENDIF
A=RIGHT(ALLTRIM(FECHA),4)
FECHASYS=CTOD(D+'/'+M+'/'+A)
