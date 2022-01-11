close tables all
public ppadron,nim,pant,nn,bpadron
define wind ram from 8,30 to 18,52 system title 'Certificación de pagos'
activ wind ram
store '' to ppadron,nim
store 1 to op1, op2, op3
@0.5,1 say 'C.I.:' font 'arial',8 style 'b'
@0.5,4 get ppadron picture '##########' font 'arial',10	size 1,12
@2,1 say 'No. inmueble: ' font 'arial',8 style 'b'
@2,12 get nim picture '##' font 'arial',10	size 1,3
@3.5,2 get op1 picture '@*rhn Natural;Jurídica ' size 1.5,10 font 'Arial',10;
	when val(ppadron)>0
@5.5,2 get op2 picture '@*h Aceptar' size 1.5,10 font 'Arial',10;
	when val(ppadron)>0 
@5.5,10.5 get op3 picture '@*h Cancelar' size 1.5,10 font 'Arial',10
read cycle
bpadron=alltrim(ppadron)+alltrim(nim)
ppadron=alltrim(ppadron)
if op1 < 2
	sele 1
	use \simat\maestro\pm01cont
	set order to tag comun
	seek ppadron
	if found()
		nn=alltrim(nombre)+' '+alltrim(paterno)+' '+alltrim(materno)
		wait wind nn
	else
		mens='El padron ingresado NO EXISTE...'
		messagebox(mens,0+48+0,'Atención')
		deactiv wind ram
		return	
	endif
else
	sele 1
	use \simat\maestro\pmjucont
	set order to tag comun
	seek ppadron
	if found()
		brow
		nn=alltrim(razon_soc)
		wait wind nn
	else
		mens='El padron ingresado NO EXISTE...'
		messagebox(mens,0+48+0,'Atención')
		deactiv wind ram
		return
	endif
endif
sele 2
use \simat\maestro\pm01inmu
set order to tag comun
seek bpadron
if op2=1
	deactiv wind ram
	wait wind 'Espere un Momento Por Favor' nowait
	do form formpagos with bpadron
endif
if op3=1
	deactiv wind ram
endif