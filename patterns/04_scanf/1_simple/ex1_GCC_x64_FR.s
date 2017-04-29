.LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"

main:
	sub	rsp, 24
	mov	edi, OFFSET FLAT:.LC0 ; "Enter X:"
	call	puts
	lea	rsi, [rsp+12]
	mov	edi, OFFSET FLAT:.LC1 ; "%d"
	xor	eax, eax
	call	__isoc99_scanf
	mov	esi, DWORD PTR [rsp+12]
	mov	edi, OFFSET FLAT:.LC2 ; "You entered %d...\n"
	xor	eax, eax
	call	printf

	; retourner 0
	xor	eax, eax
	add	rsp, 24
	ret
