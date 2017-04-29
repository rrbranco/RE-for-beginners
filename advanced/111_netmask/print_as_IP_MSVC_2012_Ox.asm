_a$ = 8		; size = 4
_print_as_IP PROC
	mov	ecx, DWORD PTR _a$[esp-4]
	; ECX=ddccbbaa
	movzx	eax, cl
	; EAX=000000aa
	push	eax
	mov	eax, ecx
	; EAX=ddccbbaa
	shr	eax, 8
	; EAX=00ddccbb
	and	eax, 255
	; EAX=000000bb
	push	eax
	mov	eax, ecx
	; EAX=ddccbbaa
	shr	eax, 16
	; EAX=0000ddcc
	and	eax, 255
	; EAX=000000cc
	push	eax
	; ECX=ddccbbaa
	shr	ecx, 24
	; ECX=000000dd
	push	ecx
	push	OFFSET $SG3020 ; '%d.%d.%d.%d'
	call	DWORD PTR __imp__printf
	add	esp, 20
	ret	0
_print_as_IP ENDP
