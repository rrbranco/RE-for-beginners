_str$ = 8			; size = 4
_strlen PROC
	mov	edx, DWORD PTR _str$[esp-4] ; EDX -> указатель на строку
	mov	eax, edx                    ; переложить в EAX
$LL2@strlen:
	mov	cl, BYTE PTR [eax]          ; CL = *EAX
	inc	eax                         ; EAX++
	test	cl, cl                      ; CL==0?
	jne	SHORT $LL2@strlen           ; нет, продолжаем цикл
	sub	eax, edx                    ; вычисляем разницу указателей
	dec	eax                         ; декремент EAX
	ret	0
_strlen ENDP
