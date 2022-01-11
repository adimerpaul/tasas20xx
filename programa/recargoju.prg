parameters gestion,tasa,ti
public mdesc,mantval,interes,mora,mincu,montodet,tprufv,tdesc,ufvhoy
store 0 to mdesc,mantval,interes,mora,mincu,montodet
do tasaufv

xSql1 = "SELECT *" 
xSql1 = xSql1 + " FROM simat.fecha"
xSql1 = xSql1 + " Order By Fecha"
SQLEXEC(lnHandle,xSql1,"TFecha")
SELECT * FROM TFecha INTO CURSOR T31 READWRITE 
*sele fechven
*use y:\tasas20xx\datos\fechven

*!*	sele 31
*!*	use y:\simat\maestro\fecha
*!*	set order to tag fecha

xSql1 = "SELECT *" 
xSql1 = xSql1 + " FROM simat.ufv"
xSql1 = xSql1 + " Order By Fecha"
SQLEXEC(lnHandle,xSql1,"Tufv")
SELECT Fecha,ROUND(VAL(Coti),5) as coti,Tipodia FROM Tufv INTO CURSOR T32 READWRITE 
LOCATE FOR fecha=DATE()
*!*	sele 32
*!*	use y:\simat\maestro\ufv
*!*	set order to tag fecha
*!*	seek date()
ufvhoy=coti

xSql1 = "SELECT *" 
xSql1 = xSql1 + " FROM tasas20xx.fechven"
xSql1 = xSql1 + " Where gest='"+STR(Gestion)+"'"
SQLEXEC(lnHandle,xSql1,"TFechVen")
SELECT * FROM TFechVen INTO CURSOR FechVen

*!*	sele fechven
*!*	locate for gestion=gest
fvenge=fechaven
tdesc=descuento
if date()>fvenge
	if gestion<2002
		*sele 31
		*seek fvenge
		*if found()
		SELECT * FROM T31 WHERE FECHA=fVENGE INTO CURSOR TT51 READWRITE 
		IF _tally>0 THEN 

			dife=date()-TTOD(fecha)
			mantval1=round(((7.49/coti)-1)*tasa,0)
			mantval2=round(((ufvhoy/1.00821)-1)*(tasa+mantval1),0)
			mantval=mantval1+mantval2
			interes=round((tasa+mantval)*dife*(12.84/36000),0)
			mora=round(interes*0.1,0)
			*IF PERSONA='N'
			*	mincu=50
			*ELSE
				mincu=240
			*ENDIF
			montodet=mantval+tasa+interes+mora+mincu
		else
			wait wind 'No existe cotización del dolar de fecha'+dtoc(fvenge)
		endif
	else
		*sele 32
		*seek fvenge
		*if found()
		SELECT * FROM T32 WHERE FECHA=fVENGE INTO CURSOR TT52
		IF _tally>0
		
			dife=date()-ttod(fecha)
			**** mantenimineto valor tasa ****
			tasaufv=round(tasa/coti,0)
			mvtasa=round((tasaufv*ufvhoy)-tasa,0)
			**** mantenimiento valor interes ***
			interes=round((tasaufv*(1+tprufv/360)^dife)-tasaufv,0)
			mvinteres=round((interes*ufvhoy)-interes,0)
			**** mantenimiento valor mora ***
			mora=round(interes*0.1,0)
			mvmmora=round((mora*ufvhoy)-mora,0)
			**** mantenimiento valor incumplimiento ***
			*IF PERSONA='N'
			*	mincu=tasaufv*.1
			*	mincu=iif(mincu>50,mincu,50)
			*	mincu=iif(mincu>2400,2400,mincu)
			*ELSE
				mincu=tasaufv*.1
				mincu=iif(mincu>240,mincu,240)
				mincu=iif(mincu>2400,2400,mincu)
			*ENDIF
			mvincu=round((mincu*ufvhoy)-mincu,0)
			IF ti=1
				IF exen=1
					mantval=mvincu
				ELSE
					mantval=mvtasa+mvinteres+mvmmora+mvincu
				ENDIF
			ELSE
				mantval=mvtasa+mvinteres+mvmmora+mvincu
			endif
			**mantval=iif(ti=1 and exen=0,mvtasa+mvinteres+mvmmora+mvincu,0)
		else
			wait wind 'No existe '+dtoc(fvenge)
		endif
	endif
else
	mdesc=round(tasa*tdesc/100,0)
endif

procedure tasaufv
*sele 21
*use y:\simat\maestro\tasapare
*locate for month(date())=month(fecha) and year(date())=year(fecha)
*if found()
xSql1 = "SELECT *" 
xSql1 = xSql1 + " FROM tasapare"
xSql1 = xSql1 + " Where MONTH(fecha)='"+STR(MONTH(DATE()))+"' and YEAR(fecha)='"+STR(year(DATE()))+"'"
SQLEXEC(lnHandle,xSql1,"Tasapar")
SELECT * FROM Tasapar INTO CURSOR Tasapares READWRITE 
IF _Tally>0 THEN 
	tprufv=(3+MTON(tasa))/100
ELSE
	MESSAGEBOX('No existe registro de tasa para este periodo',0,"A D V E R T E N C I A ")
	RETURN 	
ENDIF

*	tprufv=(3+tasa)/100
*endif