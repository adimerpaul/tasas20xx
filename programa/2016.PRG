CLOSE TABLES all
SELECT 1
USE Z:\SIMAT\MAESTRO\PM01INMU
SELECT * FROM z:\tasas20xx\datos\archi16 WHERE oper='ELHERBAS' INTO CURSOR ELI
BROWSE
DO WHILE NOT EOF()
	C=ALLTRIM(CANTIDAD)
	G=VAL(GEST)
	SELECT 1
	LOCATE FOR CANTIDAD==C
	IF FOUND()
		IF GESTION=G
		ELSE
			IF G>GESTION
				SELECT ELI
				BROWSE
				SELECT 1
				BROWSE
			ELSE
				BROW
			ENDIF
		ENDIF
	ENDIF
	SELECT ELI
	SKIP
ENDDO
