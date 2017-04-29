__real@3f800000 DD 03f800000r	; 1

tv128 = -4
_tmp$ = -4
?float_rand@@YAMXZ PROC
	push	ecx
	call	?my_rand@@YAIXZ
; EAX=§псевдослучайное§ §значение§
	and	eax, 8388607	; 007fffffH
	or	eax, 1065353216	; 3f800000H
; EAX=§псевдослучайное§ §значение§ & 0x007fffff | 0x3f800000
; сохранить его в локальном стеке:
	mov	DWORD PTR _tmp$[esp+4], eax
; перезагрузить его как число с плавающей точкой:
	movss	xmm0, DWORD PTR _tmp$[esp+4]
; вычесть 1.0:
	subss	xmm0, DWORD PTR __real@3f800000
; переместить значение в ST0 поместив его во временную переменную...
	movss	DWORD PTR tv128[esp+4], xmm0
; ... и затем перезагрузив её в ST0:
	fld	DWORD PTR tv128[esp+4]
	pop	ecx
	ret	0
?float_rand@@YAMXZ ENDP
