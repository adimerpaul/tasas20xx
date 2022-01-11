padron='3511551'
 sele a.paterno,a.materno,a.comun,b.* from y:\simat\maestro\pm01cont a, y:\simat\maestro\pm01inmu b;
 	where a.comun=padron and b.cantidad=padron+'01';
 	into cursor gonzalo