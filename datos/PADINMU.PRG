CLEAR
SET EXCL OFF
SET TALK OFF
SET CENT ON
SET DATE TO DMY
PUBLIC NI,PADMAY,ZON,BARRI,TIPOC,CALLES,NCALL,MVAR2,MVIAS,RESP,SUPT,INCL,CALID,CAL;
	   SER1,SER2,SER3,SER4,DISTRI,MANZA,LOT,SLOT,DIRE,PERS,CALICAS,CALIDEP,SUPCAS,ANTCAS;
	   BLOQ,PIS,NDEP,DEUD,VAR0,EXENT,REVA,CSMAN,CSLOT,COJA,VALOR
DECLARE TIPO1(4),TIPO2(4),CALID(6)
TIPO1(1)='CALLE'
TIPO2(1)='CA'
TIPO1(2)='AVENIDA'
TIPO2(2)='AV'
TIPO1(3)='PLAZA'
TIPO2(3)='PL'
TIPO1(4)='PASAJE'
TIPO2(4)='PJ'
CALID(1)='LUJOSA'
CALID(2)='MUY BUENA'
CALID(3)='BUENA'
CALID(4)='ECONOMICA'
CALID(5)='INTERES SOCIAL'
CALID(6)='MARGINAL'
STORE 1 TO A,TT
STORE 0 TO SUPCAS,ANTCAS
STORE SPACE(3) TO BLOQ,NDEP
PIS='  '
DEFINE WIND PANT FROM 5,15 TO 11,65 '�' SHADOW TITLE ' MODIFICACION  DE INMUEBLES '
DEFINE WIND PANT2 FROM 1,5 TO 20,75 '�' SHADOW TITLE ' FORMULARIO N� 27 '
DO WHILE .T.
	ACTIVA WIND PANT
	@ 1,2 TO 3,46 DOUBLE
	@ 2,10 GET A PICTURE '@*H FORMULARIO 27;SALIR'
	READ CYCLE
	DEACT WIND PANT
	DO CASE
		CASE A=1
			ACTIVA WIND PANT2
			DO FORM27.PRG
			CLOSE DATA
			DEACTI WIND PANT2
			LOOP
		CASE A=2
		RETURN
	ENDCASE
ENDDO

*******************************
PROCEDURE INGREDAT
SELE 3
USE \SIMAT\MAESTRO\PMZONA
Z=RECCOUNT()
public zon1
DECLARE ZON1(Z),ZON2(Z)
J=0
DO WHILE NOT EOF()
	J=J+1
	ZON1(J)=ZONA
	ZON2(J)=ALLTRIM(DESCRIP)
	SKIP
ENDDO
@ 12,2 SAY 'ZONA:['+zon+']'
@ 14,2 SAY 'DIR.: ' + DIRE
RESP=1
@ 17,22 GET RESP PICTURE '@*H MODIFICAR;CANCELAR'
read CYCLE
*******************************************

PROCEDURE casa
Y=year(date())
ANTCAS=0
CAL=1
@ 13,2 SAY '    DATOS DE LA CONSTRUCCION    ' COLOR 3+/2+
@ 15,2 SAY 'CALIDAD :'GET CAL PICTURE '@^' FROM CALID
@ 14,35 SAY 'SUPERFICIE :'GET SUPCAS SIZE 1,5
@ 15,35 SAY 'ANTIGUEDAD :'GET ANTCAS SIZE 1,3
@ 17,35 GET RESP PICTURE '@*H GUARDAR DATOS;CANCELAR'
read CYCLE
antcas=y-antcas
CALICAS=ALLTRIM(STR(CAL))
************************
procedure DEPARTA
Y=year(date())
CAL=1
ANTCAS=0
@ 13,2 SAY '    DATOS DEL DEPARTAMENTO/OFICINA    ' COLOR 3+/2+
@ 15,2 SAY 'CALIDAD :'GET CAL PICTURE '@^' FROM CALID
@ 14,30 SAY 'BLOQUE:'GET BLOQ 
@ 14,43 SAY 'PISO:'GET PIS
@ 14,52 SAY 'N� DPTO./OF.:'GET NDEP
@ 15,30 SAY 'SUPERFICIE :'GET SUPCAS SIZE 1,5
@ 16,30 SAY 'ANTIGUEDAD :'GET ANTCAS SIZE 1,3
@ 17,35 GET RESP PICTURE '@*H GUARDAR DATOS;CANCELAR'
read CYCLE
antcas=y-antcas
CALIDEP=ALLTRIM(STR(CAL))