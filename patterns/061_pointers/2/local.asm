_product$ = -8		; size = 4
_sum$ = -4		; size = 4
_main	PROC
; Line 10
	sub	esp, 8
; Line 13
	lea	eax, DWORD PTR _product$[esp+8]
	push	eax
	lea	ecx, DWORD PTR _sum$[esp+12]
	push	ecx
	push	456	; 000001c8H
	push	123	; 0000007bH
	call	_f1
; Line 14
	mov	edx, DWORD PTR _product$[esp+24]
	mov	eax, DWORD PTR _sum$[esp+24]
	push	edx
	push	eax
	push	OFFSET $SG2803
	call	DWORD PTR __imp__printf
; Line 15
	xor	eax, eax
	add	esp, 36
	ret	0
