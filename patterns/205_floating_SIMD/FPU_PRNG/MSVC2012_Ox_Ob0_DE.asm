__real@3f800000 DD 03f800000r	; 1

tv128 = -4
_tmp$ = -4
?float_rand@@YAMXZ PROC
	push	ecx
	call	?my_rand@@YAIXZ
; EAX=Pseudozufallswert
	and	eax, 8388607	; 007fffffH
	or	eax, 1065353216	; 3f800000H
; EAX=Pseudozufallswert & 0x007fffff | 0x3f800000
; speichere ihn auf lokalem Stack:
	mov	DWORD PTR _tmp$[esp+4], eax
; lade ihn erneut als Fließkommazahl:
	movss	xmm0, DWORD PTR _tmp$[esp+4]
; subtrahiere 1.0:
	subss	xmm0, DWORD PTR __real@3f800000
; verschiebe Wert nach ST0 durch Ablegen in temporärer Variable\ldots
	movss	DWORD PTR tv128[esp+4], xmm0
; ... und lade ihn erneut nach ST0:
	fld	DWORD PTR tv128[esp+4]
	pop	ecx
	ret	0
?float_rand@@YAMXZ ENDP
