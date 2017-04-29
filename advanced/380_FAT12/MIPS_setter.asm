put_to_array:
; $4=idx
; $5=val
        srl     $2,$4,1
; $2 = $4>>1 = idx>>1
        lui     $28,%hi(__gnu_local_gp)
        sll     $3,$2,1
; $3 = $2<<1 = (idx>>1)<<1 = idx&(~1)
        andi    $4,$4,0x1
; $4 = $4&1 = idx&1
        addiu   $28,$28,%lo(__gnu_local_gp)
; jump if $4=idx&1 is not zero (i.e., if idx is odd):
        bne     $4,$0,$L11
        addu    $2,$3,$2 ; branch delay slot, this instruction is executed before BNE
; $2 = $3+$2 = idx&(~1) + idx>>1 = idx*1.5

; idx is even, go on
        lw      $3,%got(array)($28)
; $3 = array
        addiu   $4,$2,1
; $4 = $2+1 = idx*1.5+1, i.e., offset of middle byte in array
        srl     $6,$5,4
; $6 = $5>>4 = val>>4
        addu    $2,$3,$2
; $2 = $3+$2 = array + idx*1.5 (offset of left byte)
; store $6 (val>>4) as left byte:
        sb      $6,0($2)
        addu    $2,$3,$4
; $2 = $3+$4 = array + idx*1.5 + 1 (absolute address of middle byte)
; load middle byte at $2+0 = array + idx*1.5 + 1
        lbu     $3,0($2)
; $3 = middle byte
        andi    $5,$5,0xf
; $5 = $5&0xF = val&0xF
        andi    $3,$3,0xf
; $3 = $3&0xF = middle_byte&0xF
        sll     $5,$5,4
; $5 = $5<<4 = (val&0xF)<<4
        or      $5,$3,$5
; $5 = $3|$5 = middle_byte&0xF | (val&0xF)<<4 (new version of middle byte)
        j       $31
; store $5 (new middle byte) at $2 (array + idx*1.5 + 1)
        sb      $5,0($2) ; branch delay slot, this instruction is executed before J

$L11:
; idx is odd, go on
        lw      $4,%got(array)($28)
; $4 = array
        addiu   $3,$2,1
; $3 = $2+1 = idx*1.5+1 (offset of middle byte)
        addu    $3,$4,$3
; $3 = $4+$3 = array + idx*1.5+1
; load middle byte at $3 (array + idx*1.5+1)
        lbu     $6,0($3)
; $6 = middle byte
        srl     $7,$5,8
; $7 = $5>>8 = val>>8
        andi    $6,$6,0xf0
; $6 = $6&0xF0 = middle_byte&0xF0
        or      $6,$6,$7
; $6 = $6|$7 = middle_byte&0xF0 | val>>8
        addu    $2,$4,$2
; store updated middle byte at $3 (array + idx*1.5+1)
        sb      $6,0($3)
        j       $31
; store low 8 bits of val at $2+2=idx*1.5+2 (place of right byte)
        sb      $5,2($2) ; branch delay slot, this instruction is executed before J

