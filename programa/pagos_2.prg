set safe off
****************** gestion 2000
sele a.cantidad,a.codigo,a.item1,a.habdep,a.pagado,a.pagado_en,b.comun,;
	b.cantidad,b.descrip,b.var1,b.bandera;
	from \tasas20xx\datos\archi00 a, \simat\maestro\pm01inmu b;
	where a.item1=0 and a.habdep=0 and a.pagado>0 and a.cantidad=b.cantidad and b.bandera='1';
	 and a.pagado_en<>{} into table d:\pagostas00 order by a.cantidad
sele a.*, b.* from \simat\maestro\pm01cont b, d:\pagostas00 a;
	where a.comun=b.comun and a.bandera='1' order by a.cantidad_a  into table d:\tas00
****************** gestion 2001
sele a.cantidad,a.codigo,a.item1,a.habdep,a.pagado,a.pagado_en,b.comun,;
	b.cantidad,b.descrip,b.var1,b.bandera;
	from \tasas20xx\datos\archi01 a, \simat\maestro\pm01inmu b;
	where a.item1=0 and a.habdep=0 and a.pagado>0 and a.cantidad=b.cantidad and b.bandera='1';
	 and a.pagado_en<>{} into table d:\pagostas01 order by a.cantidad
sele a.*, b.* from \simat\maestro\pm01cont b, d:\pagostas01 a;
	where a.comun=b.comun and a.bandera='1' order by a.cantidad_a  into table d:\tas01
****************** gestion 2002
sele a.cantidad,a.codigo,a.item1,a.habdep,a.pagado,a.pagado_en,b.comun,;
	b.cantidad,b.descrip,b.var1,b.bandera;
	from \tasas20xx\datos\archi02 a, \simat\maestro\pm01inmu b;
	where a.item1=0 and a.habdep=0 and a.pagado>0 and a.cantidad=b.cantidad and b.bandera='1';
	 and a.pagado_en<>{} into table d:\pagostas02 order by a.cantidad
sele a.*, b.* from \simat\maestro\pm01cont b, d:\pagostas02 a;
	where a.comun=b.comun and a.bandera='1' order by a.cantidad_a  into table d:\tas02
****************** gestion 2003
sele a.cantidad,a.codigo,a.item1,a.habdep,a.pagado,a.pagado_en,b.comun,;
	b.cantidad,b.descrip,b.var1,b.bandera;
	from \tasas20xx\datos\archi03 a, \simat\maestro\pm01inmu b;
	where a.item1=0 and a.habdep=0 and a.pagado>0 and a.cantidad=b.cantidad and b.bandera='1';
	 and a.pagado_en<>{} into table d:\pagostas03 order by a.cantidad
sele a.*, b.* from \simat\maestro\pm01cont b, d:\pagostas03 a;
	where a.comun=b.comun and a.bandera='1' order by a.cantidad_a  into table d:\tas03
****************** gestion 2004
sele a.cantidad,a.codigo,a.item1,a.habdep,a.pagado,a.pagado_en,b.comun,;
	b.cantidad,b.descrip,b.var1,b.bandera;
	from \tasas20xx\datos\archi04 a, \simat\maestro\pm01inmu b;
	where a.item1=0 and a.habdep=0 and a.pagado>0 and a.cantidad=b.cantidad and b.bandera='1';
	 and a.pagado_en<>{} into table d:\pagostas04 order by a.cantidad
sele a.*, b.* from \simat\maestro\pm01cont b, d:\pagostas04 a;
	where a.comun=b.comun and a.bandera='1' order by a.cantidad_a  into table d:\tas04
****************** gestion 2005
sele a.cantidad,a.codigo,a.item1,a.habdep,a.pagado,a.pagado_en,b.comun,;
	b.cantidad,b.descrip,b.var1,b.bandera;
	from \tasas20xx\datos\archi05 a, \simat\maestro\pm01inmu b;
	where a.item1=0 and a.habdep=0 and a.pagado>0 and a.cantidad=b.cantidad and b.bandera='1';
	 and a.pagado_en<>{} into table d:\pagostas05 order by a.cantidad
sele a.*, b.* from \simat\maestro\pm01cont b, d:\pagostas05 a;
	where a.comun=b.comun and a.bandera='1' order by a.cantidad_a  into table d:\tas05
