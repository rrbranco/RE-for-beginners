; a*7
_a$ = 8
_f1	PROC
	mov	ecx, DWORD PTR _a$[esp-4]
; ECX=a
	lea	eax, DWORD PTR [ecx*8]
; EAX=ECX*8
	sub	eax, ecx
; EAX=EAX-ECX=ECX*8-ECX=ECX*7=a*7
	ret	0
_f1	ENDP

; a*28
_a$ = 8
_f2	PROC
	mov	ecx, DWORD PTR _a$[esp-4]
; ECX=a
	lea	eax, DWORD PTR [ecx*8]
; EAX=ECX*8
	sub	eax, ecx
; EAX=EAX-ECX=ECX*8-ECX=ECX*7=a*7
	shl	eax, 2
; EAX=EAX<<2=(a*7)*4=a*28
	ret	0
_f2	ENDP

; a*17
_a$ = 8
_f3	PROC
	mov	eax, DWORD PTR _a$[esp-4]
; EAX=a
	shl	eax, 4
; EAX=EAX<<4=EAX*16=a*16
	add	eax, DWORD PTR _a$[esp-4]
; EAX=EAX+a=a*16+a=a*17
	ret	0
_f3	ENDP
