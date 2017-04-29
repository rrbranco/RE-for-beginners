$SG746	DB	'it is ten', 00H
$SG747	DB	'it is not ten', 00H

tv65 = -4 ; this will be used as a temporary variable
_a$ = 8	
_f	PROC
	push	ebp
	mov	ebp, esp
	push	ecx
; compare input value with 10
	cmp	DWORD PTR _a$[ebp], 10
; jump to $LN3@f if not equal
	jne	SHORT $LN3@f
; store pointer to the string into temporary variable:
	mov	DWORD PTR tv65[ebp], OFFSET $SG746 ; 'it is ten'
; jump to exit
	jmp	SHORT $LN4@f
$LN3@f:
; store pointer to the string into temporary variable:
	mov	DWORD PTR tv65[ebp], OFFSET $SG747 ; 'it is not ten'
$LN4@f:
; this is exit. copy pointer to the string from temporary variable to EAX.
	mov	eax, DWORD PTR tv65[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
_f	ENDP
