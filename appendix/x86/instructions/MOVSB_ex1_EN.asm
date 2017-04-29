; copy 15 bytes from ESI to EDI
CLD         ; set direction to §\IT{forward}§
MOV ECX, 3
REP MOVSD   ; copy 12 bytes
MOVSW       ; copy 2 more bytes
MOVSB       ; copy remaining byte
