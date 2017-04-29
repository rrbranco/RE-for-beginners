_DATA	SEGMENT
$SG2924	DB	'Enter X:', 0aH, 00H
$SG2926	DB	'%d', 00H
$SG2927	DB	'You entered %d...', 0aH, 00H
$SG2929	DB	'What you entered? Huh?', 0aH, 00H
_DATA	ENDS

_TEXT	SEGMENT
x$ = 32
main	PROC
$LN5:
	sub	rsp, 56
	lea	rcx, OFFSET FLAT:$SG2924 ; 'Enter X:'
	call	printf
	lea	rdx, QWORD PTR x$[rsp]
	lea	rcx, OFFSET FLAT:$SG2926 ; '%d'
	call	scanf
	cmp	eax, 1
	jne	SHORT $LN2@main
	mov	edx, DWORD PTR x$[rsp]
	lea	rcx, OFFSET FLAT:$SG2927 ; 'You entered %d...'
	call	printf
	jmp	SHORT $LN1@main
$LN2@main:
	lea	rcx, OFFSET FLAT:$SG2929 ; 'What you entered? Huh?'
	call	printf
$LN1@main:
	; retourner 0
	xor	eax, eax
	add	rsp, 56
	ret	0
main	ENDP
_TEXT	ENDS
END
