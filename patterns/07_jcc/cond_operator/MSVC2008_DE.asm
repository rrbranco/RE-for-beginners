$SG746	DB	'it is ten', 00H
$SG747	DB	'it is not ten', 00H

tv65 = -4 ; wird als temporäre Variable benutzt
_a$ = 8	
_f	PROC
	push	ebp
	mov	ebp, esp
	push	ecx
; vergleiche Eingabewert mit 10
	cmp	DWORD PTR _a$[ebp], 10
; springe zu $LN3@f , falls ungleich
	jne	SHORT $LN3@f
; §speichere Pointer auf den String in temporärer Variable:§
	mov	DWORD PTR tv65[ebp], OFFSET $SG746 ; 'it is ten'
; springe zum Ende
	jmp	SHORT $LN4@f
$LN3@f:
; §speichere Pointer auf den String in temporärer Variable:§
	mov	DWORD PTR tv65[ebp], OFFSET $SG747 ; 'it is not ten'
$LN4@f:
; §beenden. Kopiere Pointer auf den String aus temporärer Variable nach EAX.§
	mov	eax, DWORD PTR tv65[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
_f	ENDP
