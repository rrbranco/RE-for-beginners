my_memcpy PROC
; R0 = adresse de destination
; R1 = adresse source
; R2 = taille de bloc

; initialiser le compteur (i) §à§ 0
        MOV      r3,#0
|L0.4|
; tous les octets sont-ils §copiés§?
        CMP      r3,r2
; le bloc suivant est §exécuté§ seulement si la condition §\IT{less than}§ est remplie,
; i.e., if R2<R3 ou i<taille.
; charger l'octet en R1+i:
        LDRBCC   r12,[r1,r3]
; stocker l'octet en R0+i:
        STRBCC   r12,[r0,r3]
; i++
        ADDCC    r3,r3,#1
; la §dernière instruction du \IT{bloc conditionel}§.
; sauter au §début§ de la boucle si i<taille
; ne rien faire autrement (i.e., si i>=taille)
        BCC      |L0.4|
; retourner
        BX       lr
        ENDP
