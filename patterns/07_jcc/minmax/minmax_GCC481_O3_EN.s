my_max:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; compare A and B:
	cmp	edx, eax
; if A>=B, load A value into EAX
; the instruction idle if otherwise (if A<B)
	cmovge	eax, edx
	ret

my_min:
	mov	edx, DWORD PTR [esp+4]
	mov	eax, DWORD PTR [esp+8]
; EDX=A
; EAX=B
; compare A and B:
	cmp	edx, eax
; if A<=B, load A value into EAX
; the instruction idle if otherwise (if A>B)
	cmovle	eax, edx
	ret
