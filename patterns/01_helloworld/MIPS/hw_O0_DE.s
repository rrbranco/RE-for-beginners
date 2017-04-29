$LC0:
    .ascii  "Hello, world!\012\000"
main:
; Funktionsprolog.
; Sichere RA ($31) und FP auf Stack:
    addiu   $sp,$sp,-32
    sw  $31,28($sp)
    sw  $fp,24($sp)
; Setze FP (stack frame pointer):
    move    $fp,$sp
; Setze GP:
    lui $28,%hi(__gnu_local_gp)
    addiu   $28,$28,%lo(__gnu_local_gp)
; Lade Adresse der Zeichenkette:
    lui $2,%hi($LC0)
    addiu   $4,$2,%lo($LC0)
; Lade Adresse von puts() mit GP:
    lw  $2,%call16(puts)($28)
    nop
; puts() aufrufen:
    move    $25,$2
    jalr    $25
    nop  ; branch delay slot

; GP vom lokalen Stack wiederherstellen:
    lw  $28,16($fp)
; Setze Register $2 ($V0) zu Null:
    move    $2,$0
; Funktionsepilog.
; SP wiederherstellen:
    move    $sp,$fp
; RA wiederherstellen:
    lw  $31,28($sp)
; FP wiederherstellen:
    lw  $fp,24($sp)
    addiu   $sp,$sp,32
; Springe zu RA:
    j   $31
    nop  ; branch delay slot
