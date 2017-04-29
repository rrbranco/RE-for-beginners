$SG4238	DB	'%f', 0aH, 00H

__real@3ff0000000000000 DQ 03ff0000000000000r	; 1

tv130 = -4
_tmp$ = -4
?float_rand@@YAMXZ PROC
	push	ecx
	call	?my_rand@@YAIXZ
; EAX=Pseudozufallswert
	and	eax, 8388607		; 007fffffH
	or	eax, 1065353216		; 3f800000H
; EAX=Pseudozufallswert & 0x007fffff | 0x3f800000
; speichere ihn auf lokalem Stack:
	mov	DWORD PTR _tmp$[esp+4], eax
; lade ihn erneut als float:
	fld	DWORD PTR _tmp$[esp+4]
; subtrahiere 1.0:
	fsub	QWORD PTR __real@3ff0000000000000
; speichere erhaltenen Wert auf dem lokalen Stack und lade ihn erneut:
	fstp	DWORD PTR tv130[esp+4] ; \  diese Befehle sind redundant
	fld	DWORD PTR tv130[esp+4] ; /
	pop	ecx
	ret	0
?float_rand@@YAMXZ ENDP

_main	PROC
	push	esi
	xor	eax, eax
	call	_time
	push	eax
	call	?my_srand@@YAXI@Z
	add	esp, 4
	mov	esi, 100
$LL3@main:
	call	?float_rand@@YAMXZ
	sub	esp, 8
	fstp	QWORD PTR [esp]
	push	OFFSET $SG4238
	call	_printf
	add	esp, 12
	dec	esi
	jne	SHORT $LL3@main
	xor	eax, eax
	pop	esi
	ret	0
_main	ENDP
