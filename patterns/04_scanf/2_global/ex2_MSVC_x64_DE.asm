_DATA	SEGMENT
COMM	x:DWORD
$SG2924	DB	'Enter X:', 0aH, 00H
$SG2925	DB	'%d', 00H
$SG2926	DB	'You entered %d...', 0aH, 00H
_DATA	ENDS

_TEXT	SEGMENT
main	PROC
$LN3:
	sub	rsp, 40

	lea	rcx, OFFSET FLAT:$SG2924 ; 'Enter X:'
	call	printf
	lea	rdx, OFFSET FLAT:x
	lea	rcx, OFFSET FLAT:$SG2925 ; '%d'
	call	scanf
	mov	edx, DWORD PTR x
	lea	rcx, OFFSET FLAT:$SG2926 ; 'You entered %d...'
	call	printf
	
	; return 0
	xor	eax, eax

	add	rsp, 40
	ret	0
main	ENDP
_TEXT	ENDS
