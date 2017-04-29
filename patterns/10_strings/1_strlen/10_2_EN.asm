_str$ = 8			; size = 4
_strlen PROC
	mov	edx, DWORD PTR _str$[esp-4] ; EDX -> pointer to the string
	mov	eax, edx                    ; move to EAX
$LL2@strlen:
	mov	cl, BYTE PTR [eax]          ; CL = *EAX
	inc	eax                         ; EAX++
	test	cl, cl                      ; CL==0?
	jne	SHORT $LL2@strlen           ; no, continue loop
	sub	eax, edx                    ; calculate pointers difference
	dec	eax                         ; decrement EAX
	ret	0
_strlen ENDP
