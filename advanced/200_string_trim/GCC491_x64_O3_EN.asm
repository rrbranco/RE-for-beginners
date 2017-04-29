str_trim:
	push	rbx
	mov	rbx, rdi
; RBX will always be "s"
	call	strlen
; check for str_len==0 and exit if its so
	test	rax, rax
	je	.L9
	lea	rdx, [rax-1]
; RDX will always contain str_len-1 value, not str_len
; so RDX is more like buffer index variable
	lea	rsi, [rbx+rdx]      ; RSI=s+str_len-1
	movzx	ecx, BYTE PTR [rsi] ; load character
	test	cl, cl
	je	.L9                 ; exit if its zero
	cmp	cl, 10
	je	.L4
	cmp	cl, 13              ; exit if its not '\n' and not '\r'
	jne	.L9
.L4:
; this is weird instruction. we need RSI=s-1 here.
; its possible to get it by MOV RSI, EBX / DEC RSI
; but this is two instructions instead of one
	sub	rsi, rax
; RSI = s+str_len-1-str_len = s-1
; main loop begin
.L12:
	test	rdx, rdx
; store zero at address s-1+str_len-1+1 = s-1+str_len = s+str_len-1
	mov	BYTE PTR [rsi+1+rdx], 0  
; check for str_len-1==0. exit if so.
	je	.L9
	sub	rdx, 1                   ; equivalent to str_len--
; load next character at address s+str_len-1
	movzx	ecx, BYTE PTR [rbx+rdx]  
	test	cl, cl                   ; is it zero? exit then
	je	.L9
	cmp	cl, 10                   ; is it '\n'?
	je	.L12
	cmp	cl, 13                   ; is it '\r'?
	je	.L12
.L9:
; return "s"
	mov	rax, rbx
	pop	rbx
	ret
