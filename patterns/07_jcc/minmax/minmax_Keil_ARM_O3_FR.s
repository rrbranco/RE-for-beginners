my_max PROC
; R0=A
; R1=B
; comparer A et B:
        CMP      r0,r1
; renvoyer B au lieu de A en copiant B dans R0
; §cette instruction ne s'exécutera que si A<=B (en effet, LE Less or Equal, inférieur ou égal)§
; §si l'instruction n'est pas exécutée (dans le cas où A>B), A est toujours dans le registre R0§
        MOVLE    r0,r1
        BX       lr
        ENDP

my_min PROC
; R0=A
; R1=B
; comparer A et B:
        CMP      r0,r1
; renvoyer B au lieu de A en copiant B dans R0
; §cette instruction ne s'exécutera que si A>=B (en effet, GE Greater or Equal, supérieur ou égal)§
; §si l'instruction n'est pas exécutée (dans le cas où A<B), A est toujours dans le registre R0§
        MOVGE    r0,r1
        BX       lr
        ENDP
