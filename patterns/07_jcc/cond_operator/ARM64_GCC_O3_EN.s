f:
	cmp	x0, 10
	beq	.L3		; branch if equal 
	adrp	x0, .LC1	; "it is ten"
	add	x0, x0, :lo12:.LC1
	ret
.L3:
	adrp	x0, .LC0	; "it is not ten"
	add	x0, x0, :lo12:.LC0
	ret
.LC0:
	.string	"it is ten"
.LC1:
	.string	"it is not ten"
