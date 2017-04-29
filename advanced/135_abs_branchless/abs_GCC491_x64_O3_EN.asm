my_abs:
	mov	edx, edi
	mov	eax, edi
	sar	edx, 31
; EDX is 0xFFFFFFFF here if sign of input value is minus
; EDX is 0 if sign of input value is plus (including 0)
; the following two instructions have effect only if EDX is 0xFFFFFFFF
; or idle if EDX is 0
	xor	eax, edx
	sub	eax, edx
	ret
