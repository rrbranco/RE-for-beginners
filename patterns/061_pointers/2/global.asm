COMM	_product:DWORD
COMM	_sum:DWORD
$SG2803	DB	'sum=%d, product=%d', 0aH, 00H

_x$ = 8			; size = 4
_y$ = 12		; size = 4
_sum$ = 16		; size = 4
_product$ = 20		; size = 4
_f1	PROC
	mov	ecx, DWORD PTR _y$[esp-4]
	mov	eax, DWORD PTR _x$[esp-4]
	lea	edx, DWORD PTR [eax+ecx]
	imul	eax, ecx
	mov	ecx, DWORD PTR _product$[esp-4]
	push	esi
	mov	esi, DWORD PTR _sum$[esp]
	mov	DWORD PTR [esi], edx
	mov	DWORD PTR [ecx], eax
	pop	esi
	ret	0
_f1	ENDP

_main	PROC
	push	OFFSET _product
	push	OFFSET _sum
	push	456	; 000001c8H
	push	123	; 0000007bH
	call	_f1
	mov	eax, DWORD PTR _product
	mov	ecx, DWORD PTR _sum
	push	eax
	push	ecx
	push	OFFSET $SG2803
	call	DWORD PTR __imp__printf
	add	esp, 28
	xor	eax, eax
	ret	0
_main	ENDP
