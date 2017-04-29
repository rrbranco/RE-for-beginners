___tmainCRTStartup proc near

var_24 = dword ptr -24h
var_20 = dword ptr -20h
var_1C = dword ptr -1Ch
ms_exc = CPPEH_RECORD ptr -18h

       push    14h
       push    offset stru_4092D0
       call    __SEH_prolog4
       mov     eax, 5A4Dh
       cmp     ds:400000h, ax
       jnz     short loc_401096
       mov     eax, ds:40003Ch
       cmp     dword ptr [eax+400000h], 4550h
       jnz     short loc_401096
       mov     ecx, 10Bh
       cmp     [eax+400018h], cx
       jnz     short loc_401096
       cmp     dword ptr [eax+400074h], 0Eh
       jbe     short loc_401096
       xor     ecx, ecx
       cmp     [eax+4000E8h], ecx
       setnz   cl
       mov     [ebp+var_1C], ecx
       jmp     short loc_40109A


loc_401096: ; CODE XREF: ___tmainCRTStartup+18
            ; ___tmainCRTStartup+29 ...
       and     [ebp+var_1C], 0

loc_40109A: ; CODE XREF: ___tmainCRTStartup+50
       push    1
       call    __heap_init
       pop     ecx
       test    eax, eax
       jnz     short loc_4010AE
       push    1Ch
       call    _fast_error_exit
       pop     ecx

loc_4010AE: ; CODE XREF: ___tmainCRTStartup+60
       call    __mtinit
       test    eax, eax
       jnz     short loc_4010BF
       push    10h
       call    _fast_error_exit
       pop     ecx

loc_4010BF: ; CODE XREF: ___tmainCRTStartup+71
       call    sub_401F2B
       and     [ebp+ms_exc.disabled], 0
       call    __ioinit
       test    eax, eax
       jge     short loc_4010D9
       push    1Bh
       call    __amsg_exit
       pop     ecx

loc_4010D9: ; CODE XREF: ___tmainCRTStartup+8B
       call    ds:GetCommandLineA
       mov     dword_40B7F8, eax
       call    ___crtGetEnvironmentStringsA
       mov     dword_40AC60, eax
       call    __setargv
       test    eax, eax
       jge     short loc_4010FF
       push    8
       call    __amsg_exit
       pop     ecx

loc_4010FF: ; CODE XREF: ___tmainCRTStartup+B1
       call    __setenvp
       test    eax, eax
       jge     short loc_401110
       push    9
       call    __amsg_exit
       pop     ecx

loc_401110: ; CODE XREF: ___tmainCRTStartup+C2
       push    1
       call    __cinit
       pop     ecx
       test    eax, eax
       jz      short loc_401123
       push    eax
       call    __amsg_exit
       pop     ecx

loc_401123: ; CODE XREF: ___tmainCRTStartup+D6
       mov     eax, envp
       mov     dword_40AC80, eax
       push    eax             ; envp
       push    argv            ; argv
       push    argc            ; argc
       call    _main
       add     esp, 0Ch
       mov     [ebp+var_20], eax
       cmp     [ebp+var_1C], 0
       jnz     short $LN28
       push    eax             ; uExitCode
       call    $LN32

$LN28:      ; CODE XREF: ___tmainCRTStartup+105
       call    __cexit
       jmp     short loc_401186


$LN27:      ; DATA XREF: .rdata:stru_4092D0
       mov     eax, [ebp+ms_exc.exc_ptr] ; Exception filter 0 for function 401044
       mov     ecx, [eax]
       mov     ecx, [ecx]
       mov     [ebp+var_24], ecx
       push    eax
       push    ecx
       call    __XcptFilter
       pop     ecx
       pop     ecx

$LN24:
       retn


$LN14:      ; DATA XREF: .rdata:stru_4092D0
       mov     esp, [ebp+ms_exc.old_esp] ; Exception handler 0 for function 401044
       mov     eax, [ebp+var_24]
       mov     [ebp+var_20], eax
       cmp     [ebp+var_1C], 0
       jnz     short $LN29
       push    eax             ; int
       call    __exit


$LN29:      ; CODE XREF: ___tmainCRTStartup+135
       call    __c_exit

loc_401186: ; CODE XREF: ___tmainCRTStartup+112
       mov     [ebp+ms_exc.disabled], 0FFFFFFFEh
       mov     eax, [ebp+var_20]
       call    __SEH_epilog4
       retn

