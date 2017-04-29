__a$ = 8						; size = 4
__b$ = 12						; size = 4
_comp	PROC
	mov	eax, DWORD PTR __a$[esp-4]
	mov	ecx, DWORD PTR __b$[esp-4]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ecx]
	cmp	eax, ecx
	jne	SHORT $LN4@comp
	xor	eax, eax
	ret	0
$LN4@comp:
	xor	edx, edx
	cmp	eax, ecx
	setge	dl
	lea	eax, DWORD PTR [edx+edx-1]
	ret	0
_comp	ENDP


_numbers$ = -40						; size = 40
_argc$ = 8						; size = 4
_argv$ = 12						; size = 4
_main	PROC
	sub	esp, 40					; 00000028H
	push	esi
	push	OFFSET _comp
	push	4
	lea	eax, DWORD PTR _numbers$[esp+52]
	push	10					; 0000000aH
	push	eax
	mov	DWORD PTR _numbers$[esp+60], 1892	; 00000764H
	mov	DWORD PTR _numbers$[esp+64], 45		; 0000002dH
	mov	DWORD PTR _numbers$[esp+68], 200	; 000000c8H
	mov	DWORD PTR _numbers$[esp+72], -98	; ffffff9eH
	mov	DWORD PTR _numbers$[esp+76], 4087	; 00000ff7H
	mov	DWORD PTR _numbers$[esp+80], 5
	mov	DWORD PTR _numbers$[esp+84], -12345	; ffffcfc7H
	mov	DWORD PTR _numbers$[esp+88], 1087	; 0000043fH
	mov	DWORD PTR _numbers$[esp+92], 88		; 00000058H
	mov	DWORD PTR _numbers$[esp+96], -100000	; fffe7960H
	call	_qsort
	add	esp, 16					; 00000010H

...
