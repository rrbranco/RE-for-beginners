.LC1:
	.string	"month.c"
.LC2:
	.string	"month<12"

get_month1_checked:
	cmp	edi, 11
	jg	.L6
	movsx	rdi, edi
	mov	rax, QWORD PTR month1[0+rdi*8]
	ret
.L6:
	push	rax
	mov	ecx, OFFSET FLAT:__PRETTY_FUNCTION__.2423
	mov	edx, 29
	mov	esi, OFFSET FLAT:.LC1
	mov	edi, OFFSET FLAT:.LC2
	call	__assert_fail

__PRETTY_FUNCTION__.2423:
	.string	"get_month1_checked"
