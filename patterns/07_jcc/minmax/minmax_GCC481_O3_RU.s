my_max:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; сравнить A и B:
	cmp	edx, eax
; если A>=B, загрузить значение A в EAX
; в противном случае, эта инструкция ничего не делает §(если A<B)§
	cmovge	eax, edx
	ret

my_min:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; сравнить A и B:
	cmp	edx, eax
; если A<=B, загрузить значение A в EAX
; в противном случае, эта инструкция ничего не делает §(если A>B)§
	cmovle	eax, edx
	ret
