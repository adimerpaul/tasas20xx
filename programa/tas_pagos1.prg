parameters bpadron
wait wind 'Buscando Gestiones pagadas.......' nowait
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi06 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi05 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi04 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union;
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi03 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
	into cursor temp1
calculate max(val(gest)) to maxgest
if maxgest>2002
	maxgest=alltrim(str(maxgest))
else
	sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi02 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
	union;
	sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi01 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
	union;
	sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi00 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
	into cursor tastemp
	calculate max(val(gest)) to maxgest
	if maxgest>2000
		maxgest=alltrim(str(maxgest))
	ELSE
		maxgest='2000'
	endif
endif	
