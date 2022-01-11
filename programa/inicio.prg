public ServerName,PasWord,Usuario,Base,lnHandle
lnHandle=0
ServerName='192.168.154.202'
ServerName1='192.168.154.35'
Usuario='myuser'
PasWord='mypass'
base='simat'
SET HOURS TO 24 
close tables all
SET TALK OFF
set excl off
set dele on
set escape oFF
SET SAFETY OFF


public UNID
UNID=SYS(5)


with _screen
	.WINDOWSTATE=2
	.picture='\Tasas20xx\programa\TASAS-2019.JPG'
	.AUTOCENTER=.T.
	.Caption = 'Sistema de Liquidación de Tasas por Alcantarillado-[@rjgm] v.2019-20'
	.ShowTips = .T.
endwith
set excl off
set cent on
editwork=HOME(7)
sortwork=HOME(7)
progwork=HOME(7)
tmpfile=HOME(7)
SET STATUS off
SET STATUS bar OFF 
*SUSPEND 
	lcStringCnxRemoto = "DRIVER={MySQL ODBC 5.1 Driver};" + ;
	                    "SERVER=&SERVERNAME;" + ;
	                    "PORT=3306;" + ;
	                    "UID=&Usuario;" + ;
	                    "PWD=&PasWord;" + ;
	                    "DATABASE=&base;" + ;
	                    "OPTIONS=131329;"
	SQLSETPROP(0,"DispLogin" , 3 )
	lnHandle = SQLSTRINGCONNECT(lcStringCnxRemoto)
	IF lnHandle > 0  && Si el resultado no es negativo, la conección fue eelectxitosa

*!*			xSql1 = "SELECT nro, COUNT(*) comtador,cantidad" 
*!*			xSql1 = xSql1 + " FROM tasas20xx.tramites"
*!*			xSql1 = xSql1 + " Where cantidad=''"
*!*			xSql1 = xSql1 + " GROUP BY nro"
*!*			xSql1 = xSql1 + " HAVING COUNT(*)>1"		
*!*			SQLEXEC(lnHandle,xSql1,"DUPLIS")
*!*			SELECT * FROM duplis INTO CURSOR Myduplis
*!*			BROWSE 
*!*			SUSPEND 
*!*			SCAN
*!*				= SQLEXEC (lnHandle , "DELETE FROM tasas20xx.tramites WHERE nro='"+STR(MyDuplis.nro)+"' and cantidad='"+('')+"'")
*!*			ENDSCAN 
		= SQLEXEC (lnHandle , "ALTER TABLE simat.pm01cont DROP PRIMARY KEY")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.pm01cont ADD Codauto INT(8) NOT NULL AUTO_INCREMENT FIRST,ADD PRIMARY KEY (Codauto)","0")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.pm01inmu CHANGE nombrecall nombrecall varchar(30) NULL", "0")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.pm01inmu ADD COLUMN complemento varchar(2) NULL", "0")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.pm01cont ADD COLUMN complemento varchar(2) NULL", "0")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.pm01cont CHANGE expedido expedido varchar(4) NULL","0")		
		= SQLEXEC (lnHandle , "ALTER TABLE simat.pm01cont CHANGE nombre nombre varchar(60) NULL","0")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.pm01cont CHANGE telefono telefono varchar(15) NULL","0")
		= SQLEXEC (lnHandle , "ALTER TABLE tasas20xx.tramites DROP INDEX NRO")
		= SQLEXEC (lnHandle , "ALTER TABLE tasas20xx.tramites DROP INDEX TIPO")
		= SQLEXEC (lnHandle , "ALTER TABLE tasas20xx.tramites DROP INDEX FORM23")	
		= SQLEXEC (lnHandle , "ALTER TABLE tasas20xx.tramites ADD Codauto INT(8) NOT NULL AUTO_INCREMENT FIRST,ADD PRIMARY KEY (Codauto)","0")
		= SQLEXEC (lnHandle , "ALTER TABLE tasas20xx.fechven ADD COLUMN modifys INT(1) NOT NULL", "0")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.ufv ADD Codauto INT(8) NOT NULL AUTO_INCREMENT FIRST,ADD PRIMARY KEY (Codauto)","0")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.ufv CHANGE coti coti varchar(7) NULL", "0")
		= SQLEXEC (lnHandle , "ALTER TABLE simat.tasapare ADD Codauto INT(8) NOT NULL AUTO_INCREMENT FIRST,ADD PRIMARY KEY (Codauto)","0")
		= SQLEXEC (lnHandle , "ALTER TABLE tasas20xx.plan_pag CHANGE n_plan n_plan DECIMAL(10,2) NULL", "0")
		= SQLEXEC (lnHandle , "ALTER TABLE tasas20xx.tas_cuot CHANGE item1 item1 DECIMAL(10,2) NULL", "0")

		DO \tasas20xx\Programa\Servfecha
		PUBLIC Añin
		añin=YEAR(Servtiempo)-1
		
		xSql1 = "SELECT *" 
		xSql1 = xSql1 + " FROM tasas20xx.fechven"
		xSql1 = xSql1 + " Where modifys=0"
		SQLEXEC(lnHandle,xSql1,"VFechven")
		SELECT * FROM VFechven INTO CURSOR Fechven
		IF _tally>0 Then
		SCAN 
		
			xSql11 = " UPDATE tasas20xx.fechven SET" 
			xSql11 = xSql11 + " modifys='"+ALLTRIM('1')+"'"
			xSql11 = xSql11 + " Where gest='"+ALLTRIM(STR(Fechven.Gest))+"'"	
			=SQLEXEC(lnHandle,xSql11) 
			
			
			Añin=INT(MTON(Fechven.Gest))
			gf=RIGHT(ALLTRIM(STR(Añin)),2)
			Miarchi='tasas20xx'+'.'+'archi'+gf

		
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Habdep Habdep DECIMAL(10,2) NULL", "")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item1 Item1 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Inter Inter DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE mMora mMora DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Minclu Minclu DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item1 Item1 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item2 Item2 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item3 Item3 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item4 Item4 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item5 Item5 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item6 Item6 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item7 Item7 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item8 Item8 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item9 Item9	 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Item10 Item10 DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Pagado Pagado DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Frente Frente DECIMAL(10,2) NULL", "0")
			= SQLEXEC (lnHandle , "ALTER TABLE &miarchi CHANGE Formu Formu DECIMAL(10,2) NULL", "0")

		ENDSCAN

	ENDIF 	 
			LOCAL laFile[1]
			PUBLIC Miversion
			Miversion=''
			AGETFILEVERSION(laFile,"\tasas20xx\programa\tasas2020.exe")
			MiVersion = laFile[4]
			LOCAL laFile1[1],Miversion1
			Miversion1=''	
			Carpeta=ADIR(temparr,'\\&ServerName1\tasas20xx\*.*','')
			
			IF Carpeta>0 THEN 
				AGETFILEVERSION(laFile1,"\\&ServerName1\tasas20xx\tasas2020.exe")
				Miversion1=laFile1[4]
			
				IF ALLTRIM(laFile[4])==ALLTRIM(laFile1[4])
				
					DECLARE INTEGER FindWindow IN WIN32API ; 
					STRING cNULL, ; 
					STRING cWinName 
					DECLARE SetForegroundWindow IN WIN32API ; 
					INTEGER nHandle 

					nHWD = FindWindow(0, _screen.caption)
					SetForegroundWindow(nHWD)
			
					*ON SHUTDOWN DO \tasas20xx\programa\SALIR
					do form \Tasas20xx\programa\clave
					do C:\Tasas20xx\programa\meprinc.mpr

					read events

				ELSE
					DECLARE INTEGER FindWindow IN WIN32API ; 
					STRING cNULL, ; 
					STRING cWinName 
					DECLARE SetForegroundWindow IN WIN32API ; 
					INTEGER nHandle 

					nHWD = FindWindow(0, _screen.caption)
					SetForegroundWindow(nHWD)
					MESSAGEBOX("Existe una nueva version "+' '+ALLTRIM(laFile[4])+'  a  '+ALLTRIM(laFile1[4]),0,"Advertencia")
					CLOSE ALL 
					ON SHUTDOWN
					RUN /N "&unid\tasas20xx\Actualiza\Actualiza.exe"
					
						IF FILE('&unid\tasas20xx\programa\tasas2020old.exe')
							DELETE FILE "&unid\tasas20xx\programa\tasas2020old.exe"
						ENDIF
				ENDIF 
			ELSE
				DECLARE INTEGER FindWindow IN WIN32API ; 
				STRING cNULL, ; 
				STRING cWinName 
				DECLARE SetForegroundWindow IN WIN32API ; 
				INTEGER nHandle 
				nHWD = FindWindow(0, _screen.caption)
				SetForegroundWindow(nHWD)

				MESSAGEBOX("Por algun motivo esta PC no tiene acceso al servidor para verificar nuevas actualizaciones",0,"Advertencia")
				
		****
				*SUSPEND 
				*ON SHUTDOWN DO \tasas20xx\programa\SALIR
				do form \Tasas20xx\programa\clave
				do \Tasas20xx\programa\meprinc.mpr			
				*ON SHUTDOWN DO \tasas20xx\programa\SALIR
				READ EVENTS
		 
		****
		 	
			ENDIF 	



*!*			do form \Tasas20xx\programa\clave
*!*			do \Tasas20xx\programa\meprinc.mpr
*!*			read event
	ELSE       && Por el contrario existe error en la conección
	  IF AERROR(laError) > 0
	    = MESSAGEBOX("Error al intentar conectar:"+laError[2])
	  ELSE
	    = MESSAGEBOX("Error inesperado al intentar conectar")
	  ENDIF
	endif	




*!*		LOCAL laFile[1]
*!*		PUBLIC Miversion
*!*		Miversion=''
*!*		AGETFILEVERSION(laFile,"\tasas20xx\programa\tasas2020.exe")
*!*		MiVersion = laFile[4]
*!*		LOCAL laFile1[1],Miversion1
*!*		Miversion1=''	
*!*		Carpeta=ADIR(temparr,'\\&ServerName1\tasas20xx\*.*','')
*!*		
*!*		IF Carpeta>0 THEN 
*!*			AGETFILEVERSION(laFile1,"\\&ServerName1\tasas20xx\tasas2020.exe")
*!*			Miversion1=laFile1[4]
*!*		
*!*			IF ALLTRIM(laFile[4])==ALLTRIM(laFile1[4])
*!*			
*!*				DECLARE INTEGER FindWindow IN WIN32API ; 
*!*				STRING cNULL, ; 
*!*				STRING cWinName 
*!*				DECLARE SetForegroundWindow IN WIN32API ; 
*!*				INTEGER nHandle 

*!*				nHWD = FindWindow(0, _screen.caption)
*!*				SetForegroundWindow(nHWD)
*!*		
*!*				ON SHUTDOWN DO \tasas20xx\programa\SALIR
*!*				do form \Tasas20xx\programa\clave
*!*				do \Tasas20xx\programa\meprinc.mpr

*!*				read events

*!*			ELSE
*!*				DECLARE INTEGER FindWindow IN WIN32API ; 
*!*				STRING cNULL, ; 
*!*				STRING cWinName 
*!*				DECLARE SetForegroundWindow IN WIN32API ; 
*!*				INTEGER nHandle 

*!*				nHWD = FindWindow(0, _screen.caption)
*!*				SetForegroundWindow(nHWD)
*!*				MESSAGEBOX("Existe una nueva version "+' '+ALLTRIM(laFile[4])+'  a  '+ALLTRIM(laFile1[4]),0,"Advertencia")
*!*				CLOSE ALL 
*!*				ON SHUTDOWN
*!*				RUN /N "&unid\tasas20xx\programa\Actualiza\Actualiza.exe"
*!*				
*!*					IF FILE('&unid\tasas20xx\programa\tasas2020-old.exe')
*!*						DELETE FILE "&unid\tasas20xx\programa\tasas2020-old.exe"
*!*					ENDIF
*!*			ENDIF 
*!*		ELSE
*!*			DECLARE INTEGER FindWindow IN WIN32API ; 
*!*			STRING cNULL, ; 
*!*			STRING cWinName 
*!*			DECLARE SetForegroundWindow IN WIN32API ; 
*!*			INTEGER nHandle 
*!*			nHWD = FindWindow(0, _screen.caption)
*!*			SetForegroundWindow(nHWD)

*!*			MESSAGEBOX("Por algun motivo esta PC no tiene acceso al servidor para verificar nuevas actualizaciones",0,"Advertencia")
*!*			
*!*	****
*!*			*SUSPEND 
*!*			ON SHUTDOWN DO \tasas20xx\programa\SALIR
*!*			do form \Tasas20xx\programa\clave
*!*			do \Tasas20xx\programa\meprinc.mpr			
*!*			ON SHUTDOWN DO \tasas20xx\programa\SALIR
*!*			READ EVENTS
*!*	 
*!*	****
*!*	 	
*!*		ENDIF 	


