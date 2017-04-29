f:
	xor	eax, eax	; rt variable will be in EAX register
	xor	ecx, ecx	; i variable will be in ECX register
.L3:
	mov	rsi, rdi	; load input value
	lea	edx, [rax+1]	; EDX=EAX+1
; EDX here is a §\IT{new version of rt}§, 
; which will be written into rt variable, if the last bit is 1
	shr	rsi, cl		; RSI=RSI>>CL
	and	esi, 1		; ESI=ESI&1
; the last bit is 1? If so, write §\IT{new version of rt}§ into EAX
	cmovne	eax, edx
	add	rcx, 1		; RCX++
	cmp	rcx, 64
	jne	.L3
	rep ret			; AKA fatret
