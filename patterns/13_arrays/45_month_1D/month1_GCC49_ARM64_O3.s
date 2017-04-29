get_month1:
	adrp	x1, .LANCHOR0
	add	x1, x1, :lo12:.LANCHOR0
	ldr	x0, [x1,w0,sxtw 3]
	ret

.LANCHOR0 = . + 0
	.type	month1, %object
	.size	month1, 96
month1:
	.xword	.LC2
	.xword	.LC3
	.xword	.LC4
	.xword	.LC5
	.xword	.LC6
	.xword	.LC7
	.xword	.LC8
	.xword	.LC9
	.xword	.LC10
	.xword	.LC11
	.xword	.LC12
	.xword	.LC13
.LC2:
	.string	"January"
.LC3:
	.string	"February"
.LC4:
	.string	"March"
.LC5:
	.string	"April"
.LC6:
	.string	"May"
.LC7:
	.string	"June"
.LC8:
	.string	"July"
.LC9:
	.string	"August"
.LC10:
	.string	"September"
.LC11:
	.string	"October"
.LC12:
	.string	"November"
.LC13:
	.string	"December"
