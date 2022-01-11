PUBLIC maxgest
CLOSE all
SELECT 1
USE z:\simat\maestro\pm01inmu
SET FILTER TO BANDERA='1' AND gestion<2017
GO TOP
DO WHILE NOT EOF()
	IF VAL(bandera)=1
		G=GESTION
		DO b_gest WITH cantidad
		WAIT WINDOW maxgest nowait
		SELECT 1
		IF GESTION<VAL(MAXGEST)
			WAIT WINDOW MAXGEST+' '+CANTIDAD+STR(GESTION) nowait
			REPLACE gestion WITH VAL(maxgest)
		ELSE
		ENDIF
	ELSE
	ENDIF
	SELECT 1
	skip
enddo
CLOSE ALL

