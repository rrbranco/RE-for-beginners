get_from_array:
; EDI=idx
; make a copy:
        mov     eax, edi
; calculate idx>>1:
        shr     eax
; determine if the element even or odd by isolation of the lowest bit:
        and     edi, 1
; calculate (idx>>1)*3.
; multiplication is slow in geenral, and can be replaced by one shifting and addition operation
; LEA is capable to do both:
        lea     edx, [rax+rax*2]
; EDX now is (idx>>1)*3
; point EAX to the middle byte:
        lea     eax, [rdx+1]
; sign-extend EAX value to RDX:
        cdqe
; get middle byte into EAX:
        movzx   eax, BYTE PTR array[rax]
; finally check the value of the lowest bit in index.
; jump if index is odd (NE is the same as NZ (Not Zero)):
        jne     .L9

; this is even element, go on
; sign-extend EDX to RDX:
	movsx   rdx, edx
; shift middle byte 4 bits right:
        shr     al, 4
; AL now has 4 highest bits of middle byte
; load left byte into EDX:
        movzx   edx, BYTE PTR array[rdx]
; sign-extend AL (where high 4 bits of middle byte are now)
        movzx   eax, al
; EAX has 4 high bits bits of middle byte
; EDX now has left byte
; shift left byte 4 bits left:
        sal     edx, 4
; 4 lowest bits in EDX after shifting is cleared to zero
; finally merge values:
        or      eax, edx
        ret
.L9:
; this is odd element, go on
; calculate address of right byte:
        add     edx, 2
; isolate lowest 4 bits in middle byte:
	and     eax, 15 ; 15=0xF
; sign-extend EDX (where address of right byte is) to RDX:
	movsx   rdx, edx
; shift 4 bits we got from middle bytes 8 bits left:
        sal     eax, 8
; load right byte:
        movzx   edx, BYTE PTR array[rdx]
; merge values:
        or      eax, edx
        ret

