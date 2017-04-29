$LC0:
        .ascii  "it is not ten\000"
$LC1:
        .ascii  "it is ten\000"
f:
        li      $2,10                   # 0xa
; §comparer \$a0 et 10, sauter si égal:§
        beq     $4,$2,$L2
        nop ; §slot de délai de branchement§

; §charger l'adresse de la chaîne "it is not ten" dans \$v0 et sortir:§
        lui     $2,%hi($LC0)
        j       $31
        addiu   $2,$2,%lo($LC0)

$L2:
; §charger l'adresse de la chaîne "it is ten" dans \$v0 et sortir:§
        lui     $2,%hi($LC1)
        j       $31
        addiu   $2,$2,%lo($LC1)
