_fmt$ = 8
_die	PROC
	; load 1st argument (format-string)
	mov	ecx, DWORD PTR _fmt$[esp-4]
	; get pointer to the 2nd argument
	lea	eax, DWORD PTR _fmt$[esp]
	push	eax 		; pass a pointer
	push	ecx
	call	_vprintf
	add	esp, 8
	push	0
	call	_exit
$LN3@die:
	int	3
_die	ENDP
