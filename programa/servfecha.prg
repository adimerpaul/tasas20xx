
SQLEXEC(lnHandle, "SELECT NOW() AS fecha", "FechaActual")
SELECT * FROM FechaActual INTO CURSOR FechaHora
PUBLIC VarFech1,servfecha,servfecha1,Di,Ms,A�,Varfech,HrServ,MtServ,SeServ,VarFech1,Servfecha0,Fechnormal
PUBLIC servtiempo,FechaBack,FechStock,Hrserv1,Mtserv1,Di1
messagebox(FechaHora.fecha)	
Servtiempo=FechaHora.fecha
VarFech1=FechaHora.fecha
Di=STR(Day(Servtiempo))
Ms=STR(Month(Servtiempo))
A�=STR(Year(Servtiempo))
Hrserv=STR(Hour(Servtiempo))
Mtserv=STR(Minute(Servtiempo))
SeServ=STR(sec(Servtiempo))
ServFecha1=ALLTRIM(a�)+"/"+ALLTRIM(Ms)+"/"+ALLTRIM(di)
ServFecha0=ALLTRIM(a�)+"/"+ALLTRIM(Ms)+"/"+ALLTRIM(Di)+" "+alltrim('00')+":"+alltrim('00')+":"+alltrim('00')
ServFecha=ALLTRIM(a�)+"/"+ALLTRIM(Ms)+"/"+ALLTRIM(Di)+" "+alltrim(Hrserv)+":"+alltrim(Mtserv)+":"+alltrim(SeServ)
FechaBack=ALLTRIM(a�)+"-"+ALLTRIM(Ms)+"-"+ALLTRIM(Di)+"-"+alltrim(Hrserv)+""+alltrim(Mtserv)+""+alltrim(SeServ)
FechStock=ALLTRIM(Di)+"-"+ALLTRIM(Ms)+"-"+ALLTRIM(A�)
FechNormal=ALLTRIM(Di)+"/"+ALLTRIM(Ms)+"/"+ALLTRIM(A�)

VarFech=SERVFECHA1

******ACA CONVERTIMOS LAS HORAS EN MINUTOS******
Di1=CDOW(TTOD(Servtiempo))
Hrserv1=Hour(Servtiempo)*60
Mtserv1=Hrserv1+Minute(Servtiempo)
