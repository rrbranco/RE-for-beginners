f_signed:
	mov	eax, DWORD PTR [esp+8]
	cmp	DWORD PTR [esp+4], eax
	jg	.L6
	je	.L7
	jge	.L1
	mov	DWORD PTR [esp+4], OFFSET FLAT:.LC2 ; "a<b"
	jmp	puts
.L6:
	mov	DWORD PTR [esp+4], OFFSET FLAT:.LC0 ; "a>b"
	jmp	puts
.L1:
	rep ret
.L7:
	mov	DWORD PTR [esp+4], OFFSET FLAT:.LC1 ; "a==b"
	jmp	puts
