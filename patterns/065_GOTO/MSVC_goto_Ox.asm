$SG2981	DB	'begin', 0aH, 00H
$SG2983	DB	'skip me!', 0aH, 00H
$SG2984	DB	'end', 0aH, 00H

_main	PROC
	push	OFFSET $SG2981 ; 'begin'
	call	_printf
	push	OFFSET $SG2984 ; 'end'
$exit$4:
	call	_printf
	add	esp, 8
	xor	eax, eax
	ret	0
_main	ENDP
