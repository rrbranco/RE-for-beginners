_DATA	SEGMENT
$SG1289	DB	'Enter X:', 0aH, 00H
$SG1291	DB	'%d', 00H
$SG1292	DB	'You entered %d...', 0aH, 00H
_DATA	ENDS

_TEXT	SEGMENT
x$ = 32
main	PROC
$LN3:
	sub	rsp, 56
	lea	rcx, OFFSET FLAT:$SG1289 ; 'Enter X:'
	call	printf
	lea	rdx, QWORD PTR x$[rsp]
	lea	rcx, OFFSET FLAT:$SG1291 ; '%d'
	call	scanf
	mov	edx, DWORD PTR x$[rsp]
	lea	rcx, OFFSET FLAT:$SG1292 ; 'You entered %d...'
	call	printf

	; возврат 0
	xor	eax, eax
	add	rsp, 56
	ret	0
main	ENDP
_TEXT	ENDS
