parameters inmu
sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi17 where alltrim(cantidad)==inmu;
	and !empty(oper) and pagado_en<>{} union;
sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi16 where alltrim(cantidad)==inmu;
	and !empty(oper) and pagado_en<>{} union;
sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi15 where alltrim(cantidad)==inmu;
	and !empty(oper) and pagado_en<>{} union;
sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi14 where alltrim(cantidad)==inmu;
	and !empty(oper) and pagado_en<>{} union;
sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi13 where alltrim(cantidad)==inmu;
	and !empty(oper) and pagado_en<>{} union;
sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi12 where alltrim(cantidad)==inmu;
	and !empty(oper) and pagado_en<>{} union;
sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi11 where alltrim(cantidad)==inmu;
	and !empty(oper) and pagado_en<>{} into cursor tastemp
calculate max(val(gest)) to maxgest
IF maxgest=0
	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi10 where alltrim(cantidad)==inmu;
		and !empty(oper) and pagado_en<>{} union;
	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi09 where alltrim(cantidad)==inmu;
		and !empty(oper) and pagado_en<>{} union;
	sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi08 where alltrim(cantidad)==inmu;
		and !empty(oper) and pagado_en<>{} into cursor tastemp
	calculate max(val(gest)) to maxgest
	IF maxgest>0
		maxgest=ALLTRIM(STR(maxgest))
	ELSE
		sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi07 where alltrim(cantidad)==inmu;
			and !empty(oper) and pagado_en<>{} union;
		sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi06 where alltrim(cantidad)==inmu;
			and !empty(oper) and pagado_en<>{} union;
		sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi05 where alltrim(cantidad)==inmu;
			and !empty(oper) and pagado_en<>{} into cursor tastemp
		calculate max(val(gest)) to maxgest
		IF MAXGEST>0
			maxgest=ALLTRIM(STR(maxgest))
		ELSE
			sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi04 where alltrim(cantidad)==inmu;
				and !empty(oper) and pagado_en<>{} union;
			sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi03 where alltrim(cantidad)==inmu;
				and !empty(oper) and pagado_en<>{} union;
			sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi02 where alltrim(cantidad)==inmu;
				and !empty(oper) and pagado_en<>{} union;
			sele cantidad,gest,oper,pagado_en from y:\tasas20xx\datos\archi01 where alltrim(cantidad)==inmu;
				and !empty(oper) and pagado_en<>{} into cursor tastemp
			calculate max(val(gest)) to maxgest
			IF MAXGEST>0
				maxgest=ALLTRIM(STR(maxgest))
			ELSE
				MAXGEST='2000'
			ENDIF
		ENDIF
	endif
ELSE
	maxgest=ALLTRIM(STR(maxgest))
ENDIF