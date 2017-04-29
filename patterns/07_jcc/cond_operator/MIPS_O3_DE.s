$LC0:
        .ascii  "it is not ten\000"
$LC1:
        .ascii  "it is ten\000"
f:
        li      $2,10                   # 0xa
; vergleiche $a0 und 10, springe, falls gleich:
        beq     $4,$2,$L2
        nop ; branch delay slot

; lasse Adresse des "it is not ten" Strings in $v0 und beende:
        lui     $2,%hi($LC0)
        j       $31
        addiu   $2,$2,%lo($LC0)

$L2:
; lasse Adresse des "it is ten" Strings in $v0 und beende:
        lui     $2,%hi($LC1)
        j       $31
        addiu   $2,$2,%lo($LC1)
