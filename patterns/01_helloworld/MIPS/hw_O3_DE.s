$LC0:
; \000 ist das Nullbyte im Oktalsystem:
	.ascii	"Hello, world!\012\000"
main:
; Funktionsprolog:
; Setze den globalen Zeiger:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
; speichere Ruecksprungadresse auf lokalem Stack:
	sw	$31,28($sp)
; Lade Adresse von puts() function vom glob. Zeiger in $25:
	lw	$25,%call16(puts)($28)
; Lade Adresse der Zeichenkette in $4 ($a0):
	lui	$4,%hi($LC0)
; Springe zu puts(), speichere Ruecksprungadresse im Link Register:
	jalr	$25
	addiu	$4,$4,%lo($LC0) ; branch delay slot
; Ruecksprungadresse wiederherstellen:
	lw	$31,28($sp)
; Kopiere 0 von $zero zu $v0:
	move	$2,$0
; Springe an Ruecksprungadresse:
	j	$31
; Funktionsepilog:
	addiu	$sp,$sp,32 ; branch delay slot
