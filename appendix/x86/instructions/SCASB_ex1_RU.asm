lea     edi, string
mov     ecx, 0FFFFFFFFh ; сканировать §$2^{32}-1$§ байт, §т.е.,§ почти §\IT{бесконечно}§
xor     eax, eax        ; конец строки это 0
repne scasb
add     edi, 0FFFFFFFFh ; скорректировать

; теперь EDI указывает на последний символ в §ASCIIZ-строке§.

; узнать длину строки
; сейчас ECX = -1-strlen

not     ecx
dec     ecx

; теперь в ECX хранится длина строки
