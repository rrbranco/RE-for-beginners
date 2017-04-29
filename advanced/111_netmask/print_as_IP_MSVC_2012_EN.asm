_a$ = 8			; size = 4
_print_as_IP PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
	; EAX=ddccbbaa
	and	eax, 255
	; EAX=000000aa
	push	eax
	mov	ecx, DWORD PTR _a$[ebp]
	; ECX=ddccbbaa
	shr	ecx, 8
	; ECX=00ddccbb
	and	ecx, 255
	; ECX=000000bb
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	; EDX=ddccbbaa
	shr	edx, 16
	; EDX=0000ddcc
	and	edx, 255
	; EDX=000000cc
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	; EAX=ddccbbaa
	shr	eax, 24
	; EAX=000000dd
	and	eax, 255 ; probably redundant instruction
	; EAX=000000dd
	push	eax
	push	OFFSET $SG2973 ; '%d.%d.%d.%d'
	call	DWORD PTR __imp__printf
	add	esp, 20
	pop	ebp
	ret	0
_print_as_IP ENDP
