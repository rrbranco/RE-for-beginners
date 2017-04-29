xor	esi, 011223344h	; мусор
add	esi, eax	; мусор
add	eax, ebx
mov	edx, eax	; мусор
shl	edx, 4		; мусор
mul	ecx
xor	esi, ecx	; мусор
