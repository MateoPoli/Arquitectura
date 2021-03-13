.data
A: .word 0
B: .word 0
C: .word 1
D: .word 1
E: .word 0

.global _start

_start:

	@ --- A.D./E  ->>> 0. 1 . /0 = 0
	ldr r0, =A @     r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =D    @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	and r2, r1 @  r2 r1 -----> A . D
	ldr r0, =E
	ldr r1,[r0] 
	bic r3, r2, r1   @ BIC A AND Not D
	
	@ --- /B.C./D --------------
	
	ldr r0, =B @      r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =D    @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	and r2, r1 @  r2 r1 -----> A . D
	ldr r0, =E
	ldr r1,[r0] 
	bic r3, r2, r1   @ BIC A AND Not D