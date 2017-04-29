get_from_array:
; $4 = idx
        srl     $2,$4,1
; $2 = $4>>1 = idx>>1
        lui     $28,%hi(__gnu_local_gp)
        sll     $3,$2,1
; $3 = $2<<1 = (idx>>1)<<1 = idx&(~1)
        andi    $4,$4,0x1
; $4 = $4&1 = idx&1
        addiu   $28,$28,%lo(__gnu_local_gp)

; jump if $4 (idx&1) is not zero (if idx is odd):
        bne     $4,$0,$L6
; $2 = $3+$2 = idx>>1 + idx&(~1) = idx*1.5
	addu    $2,$3,$2 ; branch delay slot - this instruction executed before BNE

; idx is even, go on:
        lw      $3,%got(array)($28)
; $3 = array
        nop
        addu    $2,$3,$2
; $2 = $3+$2 = array + idx*1.5
; load byte at $2+0 = array + idx*1.5 (left byte):
        lbu     $3,0($2)
; $3 = left byte
; load byte at $2+1 = array + idx*1.5+1 (middle byte):
        lbu     $2,1($2)
; $2 = middle byte
        sll     $3,$3,4
; $3 = $3<<4 = left_byte<<4
        srl     $2,$2,4
; $2 = $2>>4 = middle_byte>>4
        j       $31
        or      $2,$2,$3 ; branch delay slot - this instruction executed before J
; $2 = $2|$3 = middle_byte>>4 | left_byte<<4
; $2=returned result

$L6:
; idx is odd, go on:
        lw      $3,%got(array)($28)
; $3 = array
        nop
        addu    $2,$3,$2
; $2 = $3+$2 = array + idx*1.5
; load byte at $2+1 = array + idx*1.5 + 1 (middle byte)
        lbu     $4,1($2)
; $4 = middle byte
; load byte at $2+1 = array + idx*1.5 + 2 (right byte)
        lbu     $3,2($2)
; $3 = right byte
        andi    $2,$4,0xf
; $2 = $4&0xF = middle_byte&0xF
        sll     $2,$2,8
; $2 = $2<<8 = middle_byte&0xF << 8
        j       $31        
	or      $2,$2,$3 ; branch delay slot - this instruction executed before J
; $2 = $2|$3 = middle_byte&0xF << 8 | right byte
; $2=returned result

