	TITU='DEL '+DTOC(FINI)+' AL '+DTOC(FFIN)
	wait wind 'Procesando el Reporte espere por favor............' nowait
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi96;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi97;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi98;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi99;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi00;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi01;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi02;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi03;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi04;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	union;
	sele cantidad,gest,pagado_en,pagado,oper from \tasas20xx\datos\archi05;
		where pagado_en=>fini and pagado_en<=ffin and hora<>" " and oper <>' ';
	into cursor ramiro order by 3,5
	REPORT FORM RESUMEN1 PREVIEW NOCONS