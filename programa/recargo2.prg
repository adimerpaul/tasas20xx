parameters gestion,tasa,ti
public mdesc,mantval,interes,mora,mincu,montodet,tprufv,tdesc,ufvhoy,mvtasa
store 0 to mdesc,mantval,interes,mora,mincu,montodet,mvtasa
do tasaufv
sele fechven
*use y:\tasas20xx\datos\fechven
sele 51
use y:\simat\maestro\fecha
set order to tag fecha
sele 52
use y:\simat\maestro\ufv
set order to tag fecha
seek date()
ufvhoy=coti
sele fechven
locate for gestion=gest
fvenge=fechaven
tdesc=descuento
mantval=0
if date()>fvenge
	if gestion<2002
		sele 51
		seek fvenge
		if found()
			dife=date()-fecha
			mantval1=round(((7.49/coti)-1)*tasa,0)
			mantval2=round(((ufvhoy/1.00821)-1)*(tasa+mantval1),0)
			mantval=mantval1+mantval2
			interes=round((tasa+mantval)*dife*(12.84/36000),0)
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
	else
		sele 52
		seek fvenge
		if found()
			dife=date()-fecha
			**** mantenimineto valor tasa ****
			tasaufv=round(tasa/coti,0)
			mvtasa=round((tasaufv*ufvhoy)-tasa,0)
			**** mantenimiento valor interes ***
			interes=round((tasaufv*(1+tprufv/360)^dife)-tasaufv,0)
			mvinteres=round((interes*ufvhoy)-interes,0)
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
					mantval=mvtasa+mvinteres+mvmmora+mvincu
				ENDIF
			ELSE
				mantval=mvtasa+mvinteres+mvmmora+mvincu
			endif
*			mantval=iif(ti=1 and exen=0,mvtasa+mvinteres+mvmmora+mvincu,0)
		else
			wait wind 'No existe '+dtoc(fvenge)
		endif
	endif
else
	mdesc=round(tasa*tdesc/100,0)
endif
***************************** error de impresion ultima gestión *****************
procedure tasaufv
sele 38  &&& incrementar cada año
use y:\simat\maestro\tasapare
locate for month(date())=month(fecha) and year(date())=year(fecha)
if found()
	tprufv=(3+tasa)/100
endif