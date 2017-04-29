str_trim:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp,16]
	mov	x19, x0
; X19 will always hold value of "s"
	bl	strlen
; X0=str_len
	cbz	x0, .L9        ; goto L9 (exit) if str_len==0
	sub	x1, x0, #1
; X1=X0-1=str_len-1
	add	x3, x19, x1
; X3=X19+X1=s+str_len-1
	ldrb	w2, [x19,x1]   ; load byte at address X19+X1=s+str_len-1
; W2=loaded character
	cbz	w2, .L9        ; is it zero? jump to exit then
	cmp	w2, 10         ; is it '\n'?
	bne	.L15
.L12:
; main loop body. loaded character is always 10 or 13 at this moment!
	sub	x2, x1, x0
; X2=X1-X0=str_len-1-str_len=-1
	add	x2, x3, x2
; X2=X3+X2=s+str_len-1+(-1)=s+str_len-2
	strb	wzr, [x2,1]    ; store zero byte at address s+str_len-2+1=s+str_len-1
	cbz	x1, .L9        ; str_len-1==0? goto exit, if so
	sub	x1, x1, #1     ; str_len--
	ldrb	w2, [x19,x1]   ; load next character at address X19+X1=s+str_len-1
	cmp	w2, 10         ; is it '\n'?
	cbz	w2, .L9        ; jump to exit, if its zero
	beq	.L12           ; jump to begin loop, if its '\n'
.L15:
	cmp	w2, 13         ; is it '\r'?
	beq	.L12           ; yes, jump to the loop body begin
.L9:
; return "s"
	mov	x0, x19
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 32
	ret
