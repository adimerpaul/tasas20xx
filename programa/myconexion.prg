LOCAL XLS1
XLS1=0 
xSql1 = "SELECT *" 
xSql1 = xSql1 + " FROM bitacora"
XLS1=SQLEXEC(lnHandle,xSql1,"MyNewConecta")
IF XLS1>0 THEN 
		*= MESSAGEBOX("NO SE reconecto al servidor ya esta conectado")
		XLS1=0
ELSE

	lcStringCnxRemoto = "DRIVER={MySQL ODBC 5.1 Driver};" + ;
	                    "SERVER=&servername;" + ;
	                    "PORT=3306;" + ;
	                    "UID=&Usuario;" + ;
	                    "PWD=&PasWord;" + ;
	                    "DATABASE=&Base;" + ;
	                    "OPTIONS=131329;"
		SQLSETPROP(0,"DispLogin" , 3 )
		lnHandle = SQLSTRINGCONNECT(lcStringCnxRemoto)
	IF lnHandle > 0
	ELSE
		LOCAL MyNomServidor
		MyNomServidor=GetEnv("USERDOMAIN")
		=MESSAGEBOX("Error inesperado al intentar conectar"+' '+MyNomServidor,16,"Advertencia")
	ENDIF

ENDIF
