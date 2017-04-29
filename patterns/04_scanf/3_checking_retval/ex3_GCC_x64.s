.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
.LC3:
	.string	"What you entered? Huh?"

main:
	sub	rsp, 24
	mov	edi, OFFSET FLAT:.LC0 ; "Enter X:"
	call	puts
	lea	rsi, [rsp+12]
	xor	eax, eax
	mov	edi, OFFSET FLAT:.LC1 ; "%d"
	call	__isoc99_scanf
	cmp	eax, 1
	je	.L6
	mov	edi, OFFSET FLAT:.LC3 ; "What you entered? Huh?"
	call	puts
	xor	eax, eax
	add	rsp, 24
	ret
.L6:
	mov	esi, DWORD PTR [rsp+12]
	mov	edi, OFFSET FLAT:.LC2 ; "You entered %d...\n"
	xor	eax, eax
	call	printf
	xor	eax, eax
	add	rsp, 24
	ret
