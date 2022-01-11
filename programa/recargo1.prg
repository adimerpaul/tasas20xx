parameters gestion,tasa,ti
public mdesc,mantval,interes,mmora,mincu,montodet,tprufv
store 0 to mdesc,mantval,interes,mmora,mincu,montodet
do tasaufv
sele 11
use y:\tasas20xx\datos\fechven
sele 12
use y:\simat\maestro\fecha
set order to tag fecha
sele 13
use y:\simat\maestro\ufv
set order to tag fecha
seek date()
ufvhoy=coti
sele 11
locate for gestion=gest
fvenge=fechaven
if date()>fvenge
	if gestion<2002
		sele 12
		seek fvenge
		if found()
			dife=date()-fecha
			mantval1=round(((7.49/coti)-1)*tasa,0)
			mantval2=round(((ufvhoy/1.00821)-1)*(tasa+mantval1),0)
			mantval=mantval1+mantval2
			interes=round((tasa+mantval)*dife*(12.84/36000),0)
			mmora=round(interes*0.1,0)
			IF PERSONA='N'
				mincu=50
			ELSE
				mincu=240
			ENDIF
			montodet=mantval+tasa+interes+mmora+mincu
		else
			wait wind 'No existe cotización del dolar de fecha'+dtoc(fvenge)
		endif
	else
		sele 13
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
			mmora=round(interes*0.1,0)
			mvmmora=round((mmora*ufvhoy)-mmora,0)
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
			mvincu=round((mincu*ufvhoy)-mincu,0)
			mantval=iif(ti=1 and exen=0,mvtasa+mvinteres+mvmmora+mvincu,0)
		else
			wait wind 'No existe '+dtoc(fvenge)
		endif
	endif
else
	mdesc=round(tasa*.1,0)
ENDIF
procedure tasaufv
sele 14
use y:\simat\maestro\tasapare
locate for month(date())=month(fecha) and year(date())=year(fecha)
if found()
	tprufv=(3+tasa)/100
endif