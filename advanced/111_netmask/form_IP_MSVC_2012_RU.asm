; определим ip1 как "dd", ip2 как "cc", ip3 как "bb", ip4 как "aa".
_ip1$ = 8	; size = 1
_ip2$ = 12	; size = 1
_ip3$ = 16	; size = 1
_ip4$ = 20	; size = 1
_form_IP PROC
	push	ebp
	mov	ebp, esp
	movzx	eax, BYTE PTR _ip1$[ebp]
	; EAX=000000dd
	shl	eax, 24
	; EAX=dd000000
	movzx	ecx, BYTE PTR _ip2$[ebp]
	; ECX=000000cc
	shl	ecx, 16
	; ECX=00cc0000
	or	eax, ecx
	; EAX=ddcc0000
	movzx	edx, BYTE PTR _ip3$[ebp]
	; EDX=000000bb
	shl	edx, 8
	; EDX=0000bb00
	or	eax, edx
	; EAX=ddccbb00
	movzx	ecx, BYTE PTR _ip4$[ebp]
	; ECX=000000aa
	or	eax, ecx
	; EAX=ddccbbaa
	pop	ebp
	ret	0
_form_IP ENDP
