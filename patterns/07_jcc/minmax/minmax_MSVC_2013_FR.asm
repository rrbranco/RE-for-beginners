_a$ = 8
_b$ = 12
_my_min	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
; comparer A et B:
	cmp	eax, DWORD PTR _b$[ebp]
; §sauter si A est supérieur ou égal à B:§
	jge	SHORT $LN2@my_min
; §recharger A dans EAX si autrement et sauter à la sortie§
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_min
	jmp	SHORT $LN3@my_min ; ce JMP est redondant
$LN2@my_min:
; renvoyer B
	mov	eax, DWORD PTR _b$[ebp]
$LN3@my_min:
	pop	ebp
	ret	0
_my_min	ENDP

_a$ = 8
_b$ = 12
_my_max	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
; comparer A et B:
	cmp	eax, DWORD PTR _b$[ebp]
; §sauter si A est inférieur ou égal à B:§
	jle	SHORT $LN2@my_max
; §recharger A dans EAX si autrement et sauter à la sortie§
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_max
	jmp	SHORT $LN3@my_max ; ce JMP est redondant
$LN2@my_max:
; renvoyer B
	mov	eax, DWORD PTR _b$[ebp]
$LN3@my_max:
	pop	ebp
	ret	0
_my_max	ENDP
