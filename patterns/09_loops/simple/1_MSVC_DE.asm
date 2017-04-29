_i$ = -4
_main    PROC
    push   ebp
    mov    ebp, esp
    push   ecx
    mov    DWORD PTR _i$[ebp], 2   ; Schleife wird initialisiert
    jmp    SHORT $LN3@main
$LN2@main:
    mov    eax, DWORD PTR _i$[ebp] ; hier steht, was nach jedem Durchlauf getan
    wird:
    add    eax, 1                  ; addiere 1 zum (i) Wert
    mov    DWORD PTR _i$[ebp], eax
$LN3@main:
    cmp    DWORD PTR _i$[ebp], 10  ; §diese Bedingung wird vor jedem Durchlauf geprüft.§
    jge    SHORT $LN1@main         ; §wenn (i) größer oder gleich  10 ist, beende Schleife loop§
    mov    ecx, DWORD PTR _i$[ebp] ; §Schleifenkörper: call printing_function(i)§
    push   ecx
    call   _printing_function
    add    esp, 4
    jmp    SHORT $LN2@main         ; Sprung zum Anfang der Schleife
$LN1@main:                         ; Ende der Schleife
    xor    eax, eax
    mov    esp, ebp
    pop    ebp
    ret    0
_main    ENDP
