parameters bpadron
wait wind 'Buscando Gestiones pagadas.......' nowait
**sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi00 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
union
sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi09 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
into cursor tastemp
IF VAL(GEST)=2009
	maxgest='2009'
else
	sele cantidad,gest,oper,pagado_en;
	from y:\tasas20xx\datos\archi08 where alltrim(cantidad)==bpadron;
	and !empty(oper) and pagado_en<>{};
	into cursor tastemp
	IF VAL(GEST)=2008
		MAXGEST='2008'
	ELSE
		sele cantidad,gest,oper,pagado_en;
		from y:\tasas20xx\datos\archi07 where alltrim(cantidad)==bpadron;
		and !empty(oper) and pagado_en<>{};
		into cursor tastemp
		IF VAL(GEST)=2007
			MAXGEST='2007'
			ELSE
				sele cantidad,gest,oper,pagado_en;
				from y:\tasas20xx\datos\archi06 where alltrim(cantidad)==bpadron;
				and !empty(oper) and pagado_en<>{};
				into cursor tastemp
				IF VAL(GEST)=2006
					MAXGEST='2006'
				ELSE
					sele cantidad,gest,oper,pagado_en;
					from y:\tasas20xx\datos\archi05 where alltrim(cantidad)==bpadron;
					and !empty(oper) and pagado_en<>{};
					into cursor tastemp
					IF VAL(GEST)=2005
						MAXGEST='2005'
					ELSE
						sele cantidad,gest,oper,pagado_en;
						from y:\tasas20xx\datos\archi04 where alltrim(cantidad)==bpadron;
						and !empty(oper) and pagado_en<>{};
						into cursor tastemp
							IF VAL(GEST)=2004
							MAXGEST='2004'
						ELSE
							sele cantidad,gest,oper,pagado_en;
							from y:\tasas20xx\datos\archi03 where alltrim(cantidad)==bpadron;
							and !empty(oper) and pagado_en<>{};
							into cursor tastemp
							IF VAL(GEST)=2003
								MAXGEST='2003'
							ELSE
								sele cantidad,gest,oper,pagado_en;
								from y:\tasas20xx\datos\archi02 where alltrim(cantidad)==bpadron;
								and !empty(oper) and pagado_en<>{};
								into cursor tastemp
								IF VAL(gest)=2002
									MAXGEST='2002'
								ELSE
									maxgest='2001'
								endif
							ENDIF
						ENDIF
					ENDIF
				ENDIF
		ENDIF	
	ENDIF
ENDIF
*sele cantidad,gest,oper,pagado_en;
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
into cursor tastemp
*calculate max(val(gest)) to maxgest
