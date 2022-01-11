PUBLIC LIT
lar=0
pos=0
*** ENTRADA  lite=IMPORTE  XX=POSICION EN X   YY=POSICION EN Y
u0 =''
u1 ='UN'
u2 ='DOS'
u3 ='TRES'
u4 ='CUATRO'
u5 ='CINCO'
u6 ='SEIS'
u7 ='SIETE'
u8 ='OCHO'
u9 ='NUEVE'
uu1='ONCE'
uu2='DOCE'
uu3='TRECE'
uu4='CATORCE'
uu5='QUINCE'
d0 =''
d1 ='DIEZ'
d2 ='VEINTE'
d3 ='TREINTA'
d4 ='CUARENTA'
d5 ='CINCUENTA'
d6 ='SESENTA'
d7 ='SETENTA'
d8 ='OCHENTA'
d9 ='NOVENTA'
c0 =''
c1 ='CIEN'
c2 ='DOSCIENTOS'
c3 ='TRECIENTOS'
c4 ='CUATROCIENTOS'
c5 ='QUINIENTOS'
c6 ='SEISCIENTOS'
c7 ='SETECIENTOS'
c8 ='OCHOCIENTOS'
c9 ='NOVECIENTOS'
IF lar=0
   lar1=30
ELSE
   lar1=30
ENDIF
lar=0
******************
ent=INT(lite)
dec=lite-ent
num1=LTRIM(STR(ent))
lar=LEN(num1)
valo=REPLICATE('0',9-lar)+num1
pri=SUBSTR(valo,7,3)
seg=SUBSTR(valo,4,3)
ter=SUBSTR(valo,1,3)
lit=''
IF ter>'000'
   VALI=ter
   DO lit
   IF VAL(ter)>1
      lit=lit+' MILLONES'
   ELSE
      lit=lit+' MILLON'
   ENDIF
ENDIF
IF seg>'000'
   IF VAL(seg)>1
      VALI=seg
      DO lit
   ELSE
      lit=lit+' UN'
   ENDIF
   lit=lit+' MIL'
ENDIF
IF pri>'000'
   VALI=pri
   DO lit
ENDIF
decs=STR(dec*100,3)
lit=lit+decs+'/100 Bs'

PROCEDURE LIT
A=1
x=0
DO WHILE A<=3
   nu=SUBSTR(VALI,A,1)
   IF A=1 .AND. VAL(nu)>0
      IF nu='1' .AND. VAL(SUBSTR(VALI,2,2))>0
         lit=lit+' CIENTO'
      ELSE
         lit=lit+' '+c&nu
      ENDIF
      x=x+VAL(nu)
   ENDIF
   IF A=2 .AND. VAL(nu)>0
      IF nu='1'
         crk=SUBSTR(VALI,3,1)
         IF VAL(SUBSTR(VALI,3,1))>=1 .AND. VAL(SUBSTR(VALI,3,1))<6
            lit=lit+' '+uu&crk
            RETURN
         ENDIF
      ENDIF
      lit=lit+' '+d&nu
      x=x+VAL(nu)
   ENDIF
   IF A=3 .AND. VAL(nu)>0
      IF x>0
         lit=lit+' Y '
      ENDIF
      lit=lit+u&nu
      IF x>0 .AND. nu='1'
         lit=lit+'O'
      ENDIF
   ENDIF
   A=A+1
ENDDO
RETURN
