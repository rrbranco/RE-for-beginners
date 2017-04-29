str_trim:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x0, [x29,24] ; copy input argument into local stack
	ldr	x0, [x29,24] ; s
	bl	strlen
	str	x0, [x29,40] ; str_len variable in local stack
	b	.L2
; main loop begin
.L5:
	ldrb	w0, [x29,39]
; W0=c
	cmp	w0, 13       ; is it '\r'?
	beq	.L3
	ldrb	w0, [x29,39]
; W0=c
	cmp	w0, 10       ; is it '\n'?
	bne	.L4          ; goto exit if it is not
.L3:
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	ldr	x1, [x29,24]
; X1=s
	add	x0, x1, x0
; X0=s+str_len-1
	strb	wzr, [x0]    ; write byte at s+str_len-1
; decrement str_len:
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	str	x0, [x29,40]
; save X0 (or str_len-1) to local stack
.L2:
	ldr	x0, [x29,40]
; str_len==0?
	cmp	x0, xzr
; goto exit then
	beq	.L4
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	ldr	x1, [x29,24]
; X1=s
	add	x0, x1, x0
; X0=s+str_len-1
; load byte at address s+str_len-1 to W0
	ldrb	w0, [x0]
	strb	w0, [x29,39] ; store loaded byte to "c"
	ldrb	w0, [x29,39] ; reload it
; is it zero byte?
	cmp	w0, wzr
; goto exit, if its zero or to L5 if its not
	bne	.L5
.L4:
; return s
	ldr	x0, [x29,24]
	ldp	x29, x30, [sp], 48
	ret
