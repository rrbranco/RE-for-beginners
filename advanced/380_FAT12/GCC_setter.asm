put_to_array:
; EDI=idx
; ESI=val
; copy idx to EAX:
        mov     eax, edi
; calculate idx>>1 and put it to EAX:
        shr     eax
; isolate lowest bit in idx:
        and     edi, 1
; calculate (idx>>2)*3 and put it to EAX:
        lea     eax, [rax+rax*2]
; jump if index is odd (NE is the same as NZ (Not Zero)):
        jne     .L5

; this is even element, go on
; sign-extend address of triplet in EAX to RDX:
        movsx   rdx, eax
; copy val value to ECX:
        mov     ecx, esi
; calculate address of middle byte:
        add     eax, 1
; sign-extend address in EAX to RDX:
        cdqe
; prepare left byte in ECX by shifting it:
        shr     ecx, 4
; prepare 4 bits for middle byte:
        sal     esi, 4
; put left byte:
        mov     BYTE PTR array[rdx], cl
; load middle byte (its address still in RAX):
        movzx   edx, BYTE PTR array[rax]
; drop high 4 bits:
        and     edx, 15 ; 15=0xF
; merge our data and low 4 bits which were there before:
        or      esi, edx
; put middle byte back:
        mov     BYTE PTR array[rax], sil
        ret
.L5:
; this is odd element, go on
; calculate address of middle byte and put it to ECX:
        lea     ecx, [rax+1]
; copy val value from ESI to EDI:
        mov     edi, esi
; calculate address of right byte:
        add     eax, 2
; get high 4 bits of input value by shifting it 8 bits right:
        shr     edi, 8
; sign-extend address in EAX into RAX:
        cdqe
; sign-extend address of middle byte in ECX to RCX:
        movsx   rcx, ecx
; load middle byte into EDX:
        movzx   edx, BYTE PTR array[rcx]
; drop low 4 bits in middle byte:
	and     edx, -16 ; -16=0xF0
; merge data from input val with what was in middle byte before:
        or      edx, edi
; store middle byte:
        mov     BYTE PTR array[rcx], dl
; store right byte. val is still in ESI and SIL is a part of ESI register which has lowest 8 bits:
        mov     BYTE PTR array[rax], sil
        ret

