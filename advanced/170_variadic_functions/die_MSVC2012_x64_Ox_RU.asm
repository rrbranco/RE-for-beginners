fmt$ = 48
die	PROC
	; сохранить первые 4 аргумента в Shadow Space
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	sub	rsp, 40
	lea	rdx, QWORD PTR fmt$[rsp+8] ; передать указатель на первый аргумент
	; RCX здесь всё еще указывает на первый аргумент (§строку§ §формата§) §ф-ции§ die()
	; так что vprintf() возьмет его прямо из RCX
	call	vprintf
	xor	ecx, ecx
	call	exit
	int	3
die	ENDP
