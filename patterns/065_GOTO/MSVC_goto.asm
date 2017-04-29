$SG2934	DB	'begin', 0aH, 00H
$SG2936	DB	'skip me!', 0aH, 00H
$SG2937	DB	'end', 0aH, 00H

_main	PROC
	push	ebp
	mov	ebp, esp
	push	OFFSET $SG2934 ; 'begin'
	call	_printf
	add	esp, 4
	jmp	SHORT $exit$3
	push	OFFSET $SG2936 ; 'skip me!'
	call	_printf
	add	esp, 4
$exit$3:
	push	OFFSET $SG2937 ; 'end'
	call	_printf
	add	esp, 4
	xor	eax, eax
	pop	ebp
	ret	0
_main	ENDP
