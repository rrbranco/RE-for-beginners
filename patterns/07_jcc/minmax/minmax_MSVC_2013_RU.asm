_a$ = 8		
_b$ = 12	
_my_min	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
; сравнить A и B:
	cmp	eax, DWORD PTR _b$[ebp]
; переход, если A больше или равно B:
	jge	SHORT $LN2@my_min
; перезагрузить A в EAX в противном случае и перейти на выход
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_min
	jmp	SHORT $LN3@my_min ; это избыточная JMP
$LN2@my_min:
; возврат B
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
; сравнить A и B:
	cmp	eax, DWORD PTR _b$[ebp]
; переход, если A меньше или равно B:
	jle	SHORT $LN2@my_max
; перезагрузить A в EAX в противном случае и перейти на выход
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_max
	jmp	SHORT $LN3@my_max ; это избыточная JMP
$LN2@my_max:
; возврат B
	mov	eax, DWORD PTR _b$[ebp]
$LN3@my_max:
	pop	ebp
	ret	0
_my_max	ENDP
