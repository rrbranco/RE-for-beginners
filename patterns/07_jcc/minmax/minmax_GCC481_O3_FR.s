my_max:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; comparer A et B:
	cmp	edx, eax
; si A>=B, charger la valeur A dans EAX
; l'instruction ne fait rien autrement (si A<B)
	cmovge	eax, edx
	ret

my_min:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; comparer A et B:
	cmp	edx, eax
; si A<=B, charger la valeur A dans EAX
; l'instruction ne fait rien autrement (si A>B)
	cmovle	eax, edx
	ret
