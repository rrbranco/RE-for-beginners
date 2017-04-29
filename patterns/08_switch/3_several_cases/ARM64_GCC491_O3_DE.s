f14:
; Eingabewert in W0
	sub	w0, w0, #1
	cmp	w0, 21
; verzweige, falls kleiner gleich (vorzeichenlos):
	bls	.L9
.L2:
; "default" ausgeben:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	b	puts
.L9:
; lade Jumptableadresse von X1:
	adrp	x1, .L4
	add	x1, x1, :lo12:.L4
; W0=Eingabewert-1
; lade Byte aus der Tabelle:
	ldrb	w0, [x1,w0,uxtw]
; lade Adresse des Lrtx Labels:
	adr	x1, .Lrtx4
; multipliziere Tabellenelement mit 4 (durch Schieben von 2 Bits nach links) und addiere (oder subtrahiere) es zur
Adresse von Lrtx:
	add	x0, x1, w0, sxtb #2
; springe zur berechneten Adresse:
	br	x0
; dieses Label zeigt auf das Code (Text) Segment:
.Lrtx4:
	.section	.rodata
; alles nach dem ".section" Ausdruck wird im Read-only (rodata) Segment angelegt:
.L4:
	.byte	(.L3 - .Lrtx4) / 4     ; case 1
	.byte	(.L3 - .Lrtx4) / 4     ; case 2
	.byte	(.L5 - .Lrtx4) / 4     ; case 3
	.byte	(.L5 - .Lrtx4) / 4     ; case 4
	.byte	(.L5 - .Lrtx4) / 4     ; case 5
	.byte	(.L5 - .Lrtx4) / 4     ; case 6
	.byte	(.L3 - .Lrtx4) / 4     ; case 7
	.byte	(.L6 - .Lrtx4) / 4     ; case 8
	.byte	(.L6 - .Lrtx4) / 4     ; case 9
	.byte	(.L3 - .Lrtx4) / 4     ; case 10
	.byte	(.L2 - .Lrtx4) / 4     ; case 11
	.byte	(.L2 - .Lrtx4) / 4     ; case 12
	.byte	(.L2 - .Lrtx4) / 4     ; case 13
	.byte	(.L2 - .Lrtx4) / 4     ; case 14
	.byte	(.L2 - .Lrtx4) / 4     ; case 15
	.byte	(.L2 - .Lrtx4) / 4     ; case 16
	.byte	(.L2 - .Lrtx4) / 4     ; case 17
	.byte	(.L2 - .Lrtx4) / 4     ; case 18
	.byte	(.L2 - .Lrtx4) / 4     ; case 19
	.byte	(.L6 - .Lrtx4) / 4     ; case 20
	.byte	(.L6 - .Lrtx4) / 4     ; case 21
	.byte	(.L7 - .Lrtx4) / 4     ; case 22
	.text
; alles nach dem ".text" Ausdruck wird im Code (Text) Segment angelegt:
.L7:
; "22" ausgeben
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	b	puts
.L6:
; "8, 9, 21" ausgeben
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	b	puts
.L5:
; "3, 4, 5" ausgeben
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	b	puts
.L3:
; "1, 2, 7, 10" ausgeben
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	b	puts
.LC0:
	.string	"1, 2, 7, 10"
.LC1:
	.string	"3, 4, 5"
.LC2:
	.string	"8, 9, 21"
.LC3:
	.string	"22"
.LC4:
	.string	"default"
