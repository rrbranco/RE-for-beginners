_eos$ = -4                       ; size = 4
_str$ = 8                        ; size = 4
_strlen PROC
    push    ebp
    mov     ebp, esp
    push    ecx
    mov     eax, DWORD PTR _str$[ebp]  ; взять указатель на символ из "str"
    mov     DWORD PTR _eos$[ebp], eax  ; и переложить его в нашу локальную переменную "eos"
$LN2@strlen_:
    mov     ecx, DWORD PTR _eos$[ebp]  ; ECX=eos
    
    ; взять байт, на который указывает ECX и положить его в EDX расширяя до §32-х§ бит, учитывая знак

    movsx   edx, BYTE PTR [ecx]             
    mov     eax, DWORD PTR _eos$[ebp]  ; EAX=eos
    add     eax, 1                     ; инкремент EAX
    mov     DWORD PTR _eos$[ebp], eax  ; положить eax назад в "eos"
    test    edx, edx                   ; EDX ноль?
    je      SHORT $LN1@strlen_         ; да, то что лежит в EDX это ноль, выйти из цикла
    jmp     SHORT $LN2@strlen_         ; продолжаем цикл
$LN1@strlen_:
    
    ; здесь мы вычисляем разницу двух указателей

    mov    eax, DWORD PTR _eos$[ebp]         
    sub    eax, DWORD PTR _str$[ebp]
    sub    eax, 1                      ; отнимаем от разницы еще единицу и возвращаем результат
    mov    esp, ebp
    pop    ebp
    ret    0
_strlen_ ENDP
