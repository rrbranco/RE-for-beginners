_a$ = 8		
_b$ = 12	
_my_min	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
; vergleiche A und B:
	cmp	eax, DWORD PTR _b$[ebp]
; §springe, falls A größer gleich B:§
	jge	SHORT $LN2@my_min
; lade A ansonsten erneut nach EAX und springe zum Ende
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_min
	jmp	SHORT $LN3@my_min ; redundantes JMP
$LN2@my_min:
; return B
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
; vergleiche A und B:
	cmp	eax, DWORD PTR _b$[ebp]
; springe, falls A kleiner gleich B:
	jle	SHORT $LN2@my_max
; lade A ansonsten erneut nach EAX und springe zum Ende
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_max
	jmp	SHORT $LN3@my_max ; this is redundant JMP
$LN2@my_max:
; return B
	mov	eax, DWORD PTR _b$[ebp]
$LN3@my_max:
	pop	ebp
	ret	0
_my_max	ENDP
