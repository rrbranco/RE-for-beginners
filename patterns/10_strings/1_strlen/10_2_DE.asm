_str$ = 8			; size = 4
_strlen PROC
	mov	edx, DWORD PTR _str$[esp-4] ; EDX -> Pointer auf den String
	mov	eax, edx                    ; verschiebe nach EAX
$LL2@strlen:
	mov	cl, BYTE PTR [eax]          ; CL = *EAX
	inc	eax                         ; EAX++
	test	cl, cl                      ; CL==0?
	jne	SHORT $LL2@strlen           ; nein, setze Schleife fort
	sub	eax, edx                    ; berechne Differenz der Pointer
	dec	eax                         ; dekrementiere EAX
	ret	0
_strlen ENDP

