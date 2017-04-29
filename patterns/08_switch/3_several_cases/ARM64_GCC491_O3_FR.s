f14:
; §valeur entrée dans W0§
	sub	w0, w0, #1
	cmp	w0, 21
; §branchement si inférieur ou égal (non signé)§:
	bls	.L9
.L2:
; afficher "default":
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	b	puts
.L9:
; charger l'adresse de la table des sauts dans X1:
	adrp	x1, .L4
	add	x1, x1, :lo12:.L4
; W0=input_value-1
; charger un octet depuis la table:
	ldrb	w0, [x1,w0,uxtw]
; charger l'adresse du label .Lrtx4:
	adr	x1, .Lrtx4
; §multiplier l'élément de la table par 4 (en décalant de 2 bits à gauche) et ajouter (ou soustraire) à l'adresse de .Lrtx4§:
	add	x0, x1, w0, sxtb #2
; §sauter à l'adresse calculée:§
	br	x0
; ce label pointe dans le segment de code (text):
.Lrtx4:
	.section	.rodata
; §tout ce qui se trouve après la déclaration ".section" est alloué dans le segment de données en lecture seule (rodata)§:
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
; §tout ce qui se trouve après la déclaration ".text" est alloué dans le segment de code (text)§:
.L7:
; afficher "22"
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	b	puts
.L6:
; afficher "8, 9, 21"
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	b	puts
.L5:
; afficher "3, 4, 5"
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	b	puts
.L3:
; afficher "1, 2, 7, 10"
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
