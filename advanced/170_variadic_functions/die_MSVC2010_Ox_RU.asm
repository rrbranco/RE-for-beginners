_fmt$ = 8
_die	PROC
	; загрузить первый аргумент (§строка§ §формата§)
	mov	ecx, DWORD PTR _fmt$[esp-4]
	; установить указатель на второй аргумент
	lea	eax, DWORD PTR _fmt$[esp]
	push	eax 		; передать указатель
	push	ecx
	call	_vprintf
	add	esp, 8
	push	0
	call	_exit
$LN3@die:
	int	3
_die	ENDP
