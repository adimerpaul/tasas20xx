parameters bpadron
wait wind 'Buscando Gestiones pagadas.......' nowait
CREATE CURSOR Gestiones(Cantidad CHR(15),gest CHR(5),pagado_en DATETIME(8),pagado N(10,2),oper CHR(59))

*!*	xSql1 = "SELECT *" 
*!*	xSql1 = xSql1 + " FROM Tasas20xx.tas_cuot"
*!*	xSql1 = xSql1 + " Where cantidad='"+ALLTRIM(STR(padron))+"' and pagado_en<>'"+ALLTRIM('')+"' and  hora<>'"+ALLTRIM('')+"' and caja='"+ALLTRIM('T')+"' and  Oper<>'"+ALLTRIM('')+"'"
*!*	SQLEXEC(lnHandle,xSql1,"TbTascuot")
*!*	SELECT * FROM TbTascuot INTO CURSOR TbTas_cuot

*!*	IF _Tally>0 THEN
*!*		SCAN 	
*!*			INSERT INTO Gestiones (Cantidad,gest,pagado_en,pagado,oper) values(TbTas_cuot.Cantidad,TbTas_cuot.nro,TbTas_cuot.pagado_en,TbTas_cuot.pagado,TbTas_cuot.oper)	 
*!*		ENDSCAN 
xSql1 = "SELECT gest" 
xSql1 = xSql1 + " FROM tasas20xx.fechven"
xSql1 = xSql1 + " Where gest>'1999'"
SQLEXEC(lnHandle,xSql1,"Fechavenc")
SELECT ALLTRIM(STR(gest)) as gest FROM Fechavenc ORDER BY gest DESC  INTO CURSOR TbFechavenc
*BROWSE 
*SUSPEND 
SCAN
	gestio="tasas20xx"+'.'+'archi'+RIGHT(ALLTRIM(TbFechavenc.gest),2)
	

	xSql1 = "SELECT *" 
	xSql1 = xSql1 + " FROM &gestio"
	xSql1 = xSql1 + " Where cantidad='"+ALLTRIM(bpadron)+"' and pagado_en<>'"+ALLTRIM('')+"' and  Oper<>'"+ALLTRIM('')+"'"
	SQLEXEC(lnHandle,xSql1,"TbArch")
	SELECT * FROM TbArch INTO CURSOR TbArchiv
	IF _Tally>0 THEN
			SCAN 	
				INSERT INTO Gestiones (Cantidad,gest,pagado_en,pagado,oper) values(TbArchiv.Cantidad,TbArchiv.gest,TbArchiv.pagado_en,TbArchiv.pagado,TbArchiv.oper)
				EXIT 	 
			ENDSCAN 
	ENDIF 
ENDSCAN 
*!*			
*!*	ENDIF 




*!*	SUSPEND 

*!*	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi18 where alltrim(cantidad)==bpadron;
*!*		and !empty(oper) and pagado_en<>{} union;
*!*	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi17 where alltrim(cantidad)==bpadron;
*!*		and !empty(oper) and pagado_en<>{} union;
*!*	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi16 where alltrim(cantidad)==bpadron;
*!*		and !empty(oper) and pagado_en<>{} union;
*!*	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi15 where alltrim(cantidad)==bpadron;
*!*		and !empty(oper) and pagado_en<>{} union;
*!*	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi14 where alltrim(cantidad)==bpadron;
*!*		and !empty(oper) and pagado_en<>{} union;
*!*	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi13 where alltrim(cantidad)==bpadron;
*!*		and !empty(oper) and pagado_en<>{} union;
*!*	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi12 where alltrim(cantidad)==bpadron;
*!*		and !empty(oper) and pagado_en<>{} union;
*!*	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi11 where alltrim(cantidad)==bpadron;
*!*		and !empty(oper) and pagado_en<>{} into cursor tastemp
*!*	calculate max(val(gest)) to maxgest
*!*	IF maxgest=0
*!*		sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi10 where alltrim(cantidad)==bpadron;
*!*			and !empty(oper) and pagado_en<>{} union;
*!*		sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi09 where alltrim(cantidad)==bpadron;
*!*			and !empty(oper) and pagado_en<>{} union;
*!*		sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi08 where alltrim(cantidad)==bpadron;
*!*			and !empty(oper) and pagado_en<>{} into cursor tastemp
*!*		calculate max(val(gest)) to maxgest
*!*		IF maxgest>0
*!*			maxgest=ALLTRIM(STR(maxgest))
*!*		ELSE
*!*			sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi07 where alltrim(cantidad)==bpadron;
*!*				and !empty(oper) and pagado_en<>{} union;
*!*			sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi06 where alltrim(cantidad)==bpadron;
*!*				and !empty(oper) and pagado_en<>{} union;
*!*			sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi05 where alltrim(cantidad)==bpadron;
*!*				and !empty(oper) and pagado_en<>{} into cursor tastemp
*!*			calculate max(val(gest)) to maxgest
*!*			IF MAXGEST>0
*!*				maxgest=ALLTRIM(STR(maxgest))
*!*			ELSE
*!*				sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi04 where alltrim(cantidad)==bpadron;
*!*					and !empty(oper) and pagado_en<>{} union;
*!*				sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi03 where alltrim(cantidad)==bpadron;
*!*					and !empty(oper) and pagado_en<>{} union;
*!*				sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi02 where alltrim(cantidad)==bpadron;
*!*					and !empty(oper) and pagado_en<>{} union;
*!*				sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi01 where alltrim(cantidad)==bpadron;
*!*					and !empty(oper) and pagado_en<>{} into cursor tastemp
*!*				calculate max(val(gest)) to maxgest
*!*				IF MAXGEST>0
*!*					maxgest=ALLTRIM(STR(maxgest))
*!*				ELSE
*!*					MAXGEST='2000'
*!*				ENDIF
*!*			ENDIF
*!*		endif
*!*	ELSE
*!*		maxgest=ALLTRIM(STR(maxgest))
*!*	ENDIF
