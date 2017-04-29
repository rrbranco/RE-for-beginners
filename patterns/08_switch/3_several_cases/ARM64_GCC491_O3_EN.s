f14:
; input value in W0
	sub	w0, w0, #1
	cmp	w0, 21
; branch if less or equal (unsigned):
	bls	.L9
.L2:
; print "default":
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	b	puts
.L9:
; load jumptable address to X1:
	adrp	x1, .L4
	add	x1, x1, :lo12:.L4
; W0=input_value-1
; load byte from the table:
	ldrb	w0, [x1,w0,uxtw]
; load address of the Lrtx label:
	adr	x1, .Lrtx4
; multiply table element by 4 (by shifting 2 bits left) and add (or subtract) to the address of Lrtx:
	add	x0, x1, w0, sxtb #2
; jump to the calculated address:
	br	x0
; this label is pointing in code (text) segment:
.Lrtx4:
	.section	.rodata
; everything after ".section" statement is allocated in the read-only data (rodata) segment:
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
; everything after ".text" statement is allocated in the code (text) segment:
.L7:
; print "22"
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	b	puts
.L6:
; print "8, 9, 21"
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	b	puts
.L5:
; print "3, 4, 5"
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	b	puts
.L3:
; print "1, 2, 7, 10"
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
