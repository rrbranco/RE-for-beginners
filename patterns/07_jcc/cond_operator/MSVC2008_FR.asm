$SG746	DB	'it is ten', 00H
$SG747	DB	'it is not ten', 00H

tv65 = -4 ; §ceci sera utilisé comme variable temporaire§
_a$ = 8
_f	PROC
	push	ebp
	mov	ebp, esp
	push	ecx
; §comparer la valeur en entrée avec 10§
	cmp	DWORD PTR _a$[ebp], 10
; §sauter en \$LN3@f si non égal§
	jne	SHORT $LN3@f
; §stocker le pointeur sur la chaîne dans la variable temporaire:§
	mov	DWORD PTR tv65[ebp], OFFSET $SG746 ; 'it is ten'
; §sauter à la sortie§
	jmp	SHORT $LN4@f
$LN3@f:
; §stocker le pointeur sur la chaîne dans la variable temporaire:§
	mov	DWORD PTR tv65[ebp], OFFSET $SG747 ; 'it is not ten'
$LN4@f:
; §ceci est la sortie. copier le pointeur sur la chaîne depuis la variable temporaire dans EAX.§
	mov	eax, DWORD PTR tv65[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
_f	ENDP
