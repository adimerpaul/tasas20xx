close tables all
SET TALK OFF
set excl off
set dele on
set escape oFF
SET SAFETY OFF
with _screen
	.WINDOWSTATE=0
	.picture='frontis1.bmp'
	.AUTOCENTER=.T.
	.Caption = 'Sistema de Consulta de Tasas por Alcantarillado-[G.A.M.O.] v.2019'
	.ShowTips = .T.
endwith
set excl off
set cent on
SET STATUS Off
SET STATUS bar off
set date to dmy
do form clave
do meprinc_coactiva1.mpr
CLOSE TABLES ALL
read event
