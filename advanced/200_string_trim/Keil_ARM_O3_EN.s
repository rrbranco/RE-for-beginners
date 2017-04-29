str_trim PROC
        PUSH     {r4,lr}
; R0=s
        MOV      r4,r0
; R4=s
        BL       strlen       ; strlen() takes "s" value from R0
; R0=str_len
        MOV      r3,#0
; R3 will always hold 0
|L0.16|
        CMP      r0,#0        ; str_len==0?
        ADDNE    r2,r4,r0     ; (if str_len!=0) R2=R4+R0=s+str_len
        LDRBNE   r1,[r2,#-1]  ; (if str_len!=0) R1=load byte at address R2-1=s+str_len-1
        CMPNE    r1,#0        ; (if str_len!=0) compare loaded byte against 0
        BEQ      |L0.56|      ; jump to exit if str_len==0 or loaded byte is 0
        CMP      r1,#0xd      ; is loaded byte '\r'?
        CMPNE    r1,#0xa      ; (if loaded byte is not '\r') is loaded byte '\r'?
        SUBEQ    r0,r0,#1     ; (if loaded byte is '\r' or '\n') R0-- or str_len--
        STRBEQ   r3,[r2,#-1]  ; (if loaded byte is '\r' or '\n') store R3 (zero) at address R2-1=s+str_len-1
        BEQ      |L0.16|      ; jump to loop begin if loaded byte was '\r' or '\n'
|L0.56|
; return "s"
        MOV      r0,r4
        POP      {r4,pc}
        ENDP
