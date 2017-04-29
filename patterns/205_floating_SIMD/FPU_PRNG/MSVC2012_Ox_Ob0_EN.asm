__real@3f800000 DD 03f800000r	; 1

tv128 = -4
_tmp$ = -4
?float_rand@@YAMXZ PROC
	push	ecx
	call	?my_rand@@YAIXZ
; EAX=pseudorandom value
	and	eax, 8388607	; 007fffffH
	or	eax, 1065353216	; 3f800000H
; EAX=pseudorandom value & 0x007fffff | 0x3f800000
; store it into local stack:
	mov	DWORD PTR _tmp$[esp+4], eax
; reload it as float point number:
	movss	xmm0, DWORD PTR _tmp$[esp+4]
; subtract 1.0:
	subss	xmm0, DWORD PTR __real@3f800000
; move value to ST0 by placing it in temporary variable...
	movss	DWORD PTR tv128[esp+4], xmm0
; ... and reloading it into ST0:
	fld	DWORD PTR tv128[esp+4]
	pop	ecx
	ret	0
?float_rand@@YAMXZ ENDP
