fmt$ = 48
die	PROC
	; save first 4 arguments in Shadow Space
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	sub	rsp, 40
	lea	rdx, QWORD PTR fmt$[rsp+8] ; pass pointer to the 1st argument
	; RCX here is still points to the 1st argument (format-string) of die()
	; so vprintf() will take it right from RCX
	call	vprintf
	xor	ecx, ecx
	call	exit
	int	3
die	ENDP
