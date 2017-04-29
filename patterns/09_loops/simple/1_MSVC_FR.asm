_i$ = -4
_main    PROC
    push   ebp
    mov    ebp, esp
    push   ecx
    mov    DWORD PTR _i$[ebp], 2   ; initialiser la boucle
    jmp    SHORT $LN3@main
$LN2@main:
    mov    eax, DWORD PTR _i$[ebp] ; §ici se trouve ce que nous fesons après chaque itération§:
    add    eax, 1                  ; §ajouter 1 à la valeur de (i)§
    mov    DWORD PTR _i$[ebp], eax
$LN3@main:
    cmp    DWORD PTR _i$[ebp], 10  ; §cette condition est testée \IT{avant} chaque itération§
    jge    SHORT $LN1@main         ; §si (i) est supérieur ou égal à 10, la boucle se termine§
    mov    ecx, DWORD PTR _i$[ebp] ; corps de la boucle: appel de printing_function(i)
    push   ecx
    call   _printing_function
    add    esp, 4
    jmp    SHORT $LN2@main         ; saut au §début§ de la boucle
$LN1@main:                         ; fin de la boucle
    xor    eax, eax
    mov    esp, ebp
    pop    ebp
    ret    0
_main    ENDP
