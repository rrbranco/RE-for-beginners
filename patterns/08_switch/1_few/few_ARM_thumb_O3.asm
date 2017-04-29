.text:000000D4              f1:
.text:000000D4 10 B5        PUSH    {R4,LR}
.text:000000D6 00 28        CMP     R0, #0
.text:000000D8 05 D0        BEQ     zero_case
.text:000000DA 01 28        CMP     R0, #1
.text:000000DC 05 D0        BEQ     one_case
.text:000000DE 02 28        CMP     R0, #2
.text:000000E0 05 D0        BEQ     two_case
.text:000000E2 91 A0        ADR     R0, aSomethingUnkno ; "something unknown\n"
.text:000000E4 04 E0        B       default_case

.text:000000E6              zero_case: ; CODE XREF: f1+4
.text:000000E6 95 A0        ADR     R0, aZero ; "zero\n"
.text:000000E8 02 E0        B       default_case

.text:000000EA              one_case: ; CODE XREF: f1+8
.text:000000EA 96 A0        ADR     R0, aOne ; "one\n"
.text:000000EC 00 E0        B       default_case

.text:000000EE              two_case: ; CODE XREF: f1+C
.text:000000EE 97 A0        ADR     R0, aTwo ; "two\n"
.text:000000F0              default_case ; CODE XREF: f1+10
.text:000000F0                                      ; f1+14
.text:000000F0 06 F0 7E F8  BL      __2printf
.text:000000F4 10 BD        POP     {R4,PC}
