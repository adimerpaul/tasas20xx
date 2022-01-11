parameters bpadron
wait wind 'Buscando Gestiones pagadas.......' nowait
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi01 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi02 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi03 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi04 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi05 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi06 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi07 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi08 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi09 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
into cursor tastemp
calculate max(val(gest)) to maxgest
if maxgest<2001
	maxgest='2000'
else
	maxgest=alltrim(str(maxgest))
ENDIF
