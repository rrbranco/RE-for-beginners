_a$ = 8		
_b$ = 12	
_my_min	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
; compare A and B:
	cmp	eax, DWORD PTR _b$[ebp]
; jump, if A is greater or equal to B:
	jge	SHORT $LN2@my_min
; reload A to EAX if otherwise and jump to exit
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_min
	jmp	SHORT $LN3@my_min ; this is redundant JMP
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
; compare A and B:
	cmp	eax, DWORD PTR _b$[ebp]
; jump if A is less or equal to B:
	jle	SHORT $LN2@my_max
; reload A to EAX if otherwise and jump to exit
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
