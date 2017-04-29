; f(float)
       public _Z1ff
_Z1ff  proc near

var_4  = dword ptr -4
arg_0  = dword ptr  8

       push    ebp
       mov     ebp, esp
       sub     esp, 4
       mov     eax, [ebp+arg_0]
       or      eax, 80000000h  ; setze Minuszeichen
       mov     edx, eax
       and     eax, 807FFFFFh  ; lasse nur Vorzeichen und Signifikanden in EAX
       shr     edx, 23         ; bereite Exponenten vor
       add     edx, 2          ; addiere 2
       movzx   edx, dl         ; lösche alle Bits außer 7:0 in EAX
       shl     edx, 23         ; verschiebe berechneten Exponenten
       or      eax, edx        ; kombiniere neuen Exponenten und Originalwert ohne Exponenten
       mov     [ebp+var_4], eax
       fld     [ebp+var_4]
       leave
       retn
_Z1ff  endp

       public main
main   proc near
       push    ebp
       mov     ebp, esp
       and     esp, 0FFFFFFF0h
       sub     esp, 10h
       fld     ds:dword_8048614 ; -4.936
       fstp    qword ptr [esp+8]
       mov     dword ptr [esp+4], offset asc_8048610 ; "%f\n"
       mov     dword ptr [esp], 1
       call    ___printf_chk
       xor     eax, eax
       leave
       retn
main   endp
