.LC0:
	.string	"a[%d]=%d\n"
main:
; speichere FP und LR im Stackframe:
	stp	x29, x30, [sp, -112]!
; setze Stackframe (FP=SP)
	add	x29, sp, 0
; initialisiere Zählervariable mit 0 (WZR ist das Register, das immer 0 enthält):
	str	wzr, [x29,108]
; springe zum Code, der die Schleifenbedingung prüft:
	b	.L2
.L3:
; lade Wert der Variablen "i":
	ldr	w0, [x29,108]
; multipliziere ihn mit 2:
	lsl	w2, w0, 1
; find a place of an array in local stack:
	add	x0, x29, 24
; lade 32-Bit-Integer vom lokalen Stack und erweitere ihn auf 64 Bit:
	ldrsw	x1, [x29,108]
; berechne Adresse des Elements (X0+X1<<2=Arrayadresse+i*4) und speichere W2 (i*2) dort:
	str	w2, [x0,x1,lsl 2]
; inkrementiere Zähler (i):
	ldr	w0, [x29,108]
	add	w0, w0, 1
	str	w0, [x29,108]
.L2:
; prüfen, ob wir fertig sind:
	ldr	w0, [x29,108]
	cmp	w0, 19
; springe zu L3 (Beginn des Schleifenrumpfes) falls nicht:
	ble	.L3
; der zweite Teil der Funktion fängt hier an.
; initialisiere Zählervariable mit 0 
; es wurde übrigens derselbe Platz im lokalen Stack für den Zähler verwendet,
; da dieselbe lokale Variable (i) als Zähler verwendet wird.
	str	wzr, [x29,108]
	b	.L4
.L5:
; berechne Arrayadresse:
	add	x0, x29, 24
; lade "i" Wert:
	ldrsw	x1, [x29,108]
; lade Wert aus dem Array von der Adresse (X0+X1<<2 = Adresse des Arrays + i*4)
	ldr	w2, [x0,x1,lsl 2]
; lade Adresse des "a[%d]=%d\n" Strings:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; lade Variable "i" nach W1 und übergebe sie an printf() als zweites Argument:
	ldr	w1, [x29,108]
; W2 enthält immer noch den Wert des gerade geladenen Arrayelements.
; Aufruf von printf():
	bl	printf
; inkrementiere "i":
	ldr	w0, [x29,108]
	add	w0, w0, 1
	str	w0, [x29,108]
.L4:
; sind wir fertig?
	ldr	w0, [x29,108]
	cmp	w0, 19
; springe zum Schleifenrumpf, falls nicht:
	ble	.L5
; gib 0 zurück
	mov	w0, 0
; stelle FP und LR wieder her:
	ldp	x29, x30, [sp], 112
	ret
