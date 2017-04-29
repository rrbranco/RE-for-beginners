_eos$ = -4                       ; size = 4
_str$ = 8                        ; size = 4
_strlen PROC
    push    ebp
    mov     ebp, esp
    push    ecx
    mov     eax, DWORD PTR _str$[ebp]  ; setze Pointer auf String von "str"
    mov     DWORD PTR _eos$[ebp], eax  ; setze ihn auf lokale Variable "eos"
$LN2@strlen_:
    mov     ecx, DWORD PTR _eos$[ebp]  ; ECX=eos
    
    ; nimm ein Byte von der Adresse in ECX und speichere es als 32-bit Wert mit
    Vorzeichen in EDX

    movsx   edx, BYTE PTR [ecx]             
    mov     eax, DWORD PTR _eos$[ebp]  ; EAX=eos
    add     eax, 1                     ; erhöhe EAX
    mov     DWORD PTR _eos$[ebp], eax  ; setze EAX zurück auf "eos"
    test    edx, edx                   ; ist EDX null?
    je      SHORT $LN1@strlen_         ; ja, dann beende Schleife
    jmp     SHORT $LN2@strlen_         ; setze Schleife fort
$LN1@strlen_:
    
    ; hier berechnen wir die Differenz zwischen zwei Pointern.

    mov    eax, DWORD PTR _eos$[ebp]         
    sub    eax, DWORD PTR _str$[ebp]
    sub    eax, 1                      ; subtrahiere 1 und gib Ergebnis zurück
    mov    esp, ebp pop    ebp
    ret    0
_strlen_ ENDP
