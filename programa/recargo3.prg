parameters gestion,tasa,ti
public mdesc,mantval,interes,mora,mincu,montodet,tprufv,tdesc,ufvhoy,mvtasa
store 0 to mdesc,mantval,interes,mora,mincu,montodet,mvtasa
SET DATE DMY
*SET STEP ON 
*SUSPEND 
do tasaufv
*sele fechven
*!*	xSql1 = "SELECT *" 
*!*	xSql1 = xSql1 + " FROM Tasas20xx.Fechven"
*!*	SQLEXEC(lnHandle,xSql1,"TFechVen")
*!*	SELECT * FROM TFechVen INTO CURSOR FechVen

*sele 51
*use y:\simat\maestro\fecha
*set order to tag fecha
xSql1 = "SELECT *" 
xSql1 = xSql1 + " FROM fecha"
xSql1 = xSql1 + " Order By Fecha"
SQLEXEC(lnHandle,xSql1,"TFecha")
SELECT * FROM TFecha INTO CURSOR T51

xSql1 = "SELECT *" 
xSql1 = xSql1 + " FROM simat.ufv"
xSql1 = xSql1 + " Order By Fecha"
SQLEXEC(lnHandle,xSql1,"TFecha")
*xSql1 = xSql1 + " Where fecha='"+DTOS(DATE())+"'"
SELECT Fecha,ROUND(val(Coti),6) as coti,Tipodia FROM TFecha INTO CURSOR T52
LOCATE FOR fecha=DATE()
*xSql1 = xSql1 + " Where fecha='"+DTOC(DATE())+"'"
*!*	sele 52
*!*	use y:\simat\maestro\ufv
*!*	set order to tag fecha
*!*	seek date()
*!*	SELECT 52
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
mantval=0
if date()>fvenge
	if gestion<2002
*!*			sele T51
*!*			seek fvenge
		SELECT * FROM T51 WHERE FECHA=fVENGE INTO CURSOR TT51
		IF _tally>0 THEN 
			dife=date()-TTOD(fecha)
			mantval1=round(((7.49/coti)-1)*tasa,0)
			mantval2=round(((ufvhoy/1.00821)-1)*(tasa+mantval1),0)
			mantval=mantval1+mantval2
			interes=round((((tasa+mantval)*dife)*(12.84))/36000,0)
			mora=round(interes*0.1,0)
			IF PERSONA='N'
				mincu=50
			ELSE
				mincu=240
			ENDIF
			montodet=mantval+tasa+interes+mora+mincu
		else
			wait wind 'No existe cotización del dolar de fecha'+dtoc(fvenge)
			RETURN 
		endif
	ELSE
		
		*sele T52 
		*LOCATE FOR fecha=fvenge 
		*seek fvenge
		
		SELECT * FROM T52 WHERE FECHA=fVENGE INTO CURSOR TT52
		IF _tally>0
		*if found()
			dife=date()-ttod(fecha)
			**** mantenimineto valor tasa ****
			tasaufv=round(MTON(tasa)/MTON(coti),0)
			mvtasa=round((MTON(tasaufv)*MTON(ufvhoy))-MTON(tasa),0)
			IF mvtasa<0 THEN
				mvtasa=0 
			ENDIF 
			**** mantenimiento valor interes ***
			*SUSPEND 
			interes=round((MTON(tasaufv)*(1+MTON(tprufv)/360)^dife)-MTON(tasaufv),0)
			mvinteres=round((interes*ufvhoy)-interes,0)
			INTERES=INTERES+MVINTERES
			**** mantenimiento valor mora ***
			mora=0
			mvmmora=round((mora*ufvhoy)-mora,0)
			**** mantenimiento valor incumplimiento ***
			IF PERSONA='N'
				mincu=tasaufv*.1
				mincu=iif(mincu>50,mincu,50)
				mincu=iif(mincu>2400,2400,mincu)
			ELSE
				mincu=tasaufv*.1
				mincu=iif(mincu>240,mincu,240)
				mincu=iif(mincu>2400,2400,mincu)
			ENDIF
			mincu=ROUND(mincu*ufvhoy,0)
			mvincu=0
			IF ti=1
				IF exen=1
					mantval=mvincu
				ELSE
					mantval=mvtasa
					*+mvinteres+mvmmora+mvincu
				ENDIF
			ELSE
				mantval=mvtasa
				*+mvinteres+mvmmora+mvincu
			endif
*			mantval=iif(ti=1 and exen=0,mvtasa+mvinteres+mvmmora+mvincu,0)
		else
			wait wind 'No existe esta fecha '+dtoc(fvenge)
		endif
	endif
else
	mdesc=round(tasa*tdesc/100,0)
endif
***************************** error de impresion ultima gestión *****************
procedure tasaufv
*sele 38  &&& incrementar cada año
*use y:\simat\maestro\tasapare
*locate for month(date())=month(fecha) and year(date())=year(fecha)
xSql1 = "SELECT *" 
xSql1 = xSql1 + " FROM tasapare"
xSql1 = xSql1 + " Where MONTH(fecha)='"+STR(MONTH(DATE()))+"' and YEAR(fecha)='"+STR(year(DATE()))+"'"
SQLEXEC(lnHandle,xSql1,"Tasapar")
SELECT * FROM Tasapar INTO CURSOR Tasapare
IF _Tally>0 THEN 
	tprufv=(3+MTON(tasa))/100
ELSE
	MESSAGEBOX('No existe registro de tasa para este periodo',0,"A D V E R T E N C I A ")
	RETURN 	
ENDIF
