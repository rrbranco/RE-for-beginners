$LC0:
        .ascii  "it is not ten\000"
$LC1:
        .ascii  "it is ten\000"
f:
        li      $2,10                   # 0xa
; сравнить $a0 и 10, переход, если равно:
        beq     $4,$2,$L2
        nop ; branch delay slot

; оставить адрес строки "it is not ten" в $v0 и выйти:
        lui     $2,%hi($LC0)
        j       $31
        addiu   $2,$2,%lo($LC0)

$L2:
; оставить адрес строки "it is ten" в $v0 и выйти:
        lui     $2,%hi($LC1)
        j       $31
        addiu   $2,$2,%lo($LC1)
