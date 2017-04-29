my_abs:
; sign-extend input 32-bit value to X0 64-bit register:
	sxtw	x0, w0
	eor	x1, x0, x0, asr 63
; X1=X0^(X0>>63) (shift is arithmetical)
	sub	x0, x1, x0, asr 63
; X0=X1-(X0>>63)=X0^(X0>>63)-(X0>>63) (all shifts are arithmetical)
	ret
