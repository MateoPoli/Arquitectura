.data
	A: .word 0
	B: .word 0
	C: .word 0
	D: .word 0
	E: .word 0

.text
.global main

main:

	@ --- A.D./E  -----------------------
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
	ldr r0, =C   @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	bic r2, r2, r1	@		 r1 -----> A . D
	ldr r0, =D
	ldr r1,[r0] 
	bic r4,r2, r1   @ BIC A AND Not D
	
	@ *-----  A.D./E + /B.C./D 
	
	orr r6,	r4
	
	
	@ --- /A.B./D ----------------------
	
	ldr r0, =A	@      r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =B  @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	bic r2, r2, r1	@		 r1 -----> A . D
	ldr r0, =D
	ldr r1,[r0] 
	bic r3,	r2, r1 @ BIC A AND Not D
	
		@ *-----  A.D./E + /B.C./D + /A.B./D
	
	orr r6, r3
	
	@ --- A.B./C	---------------------
	ldr r0, =A @     r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =B   @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	and r2, r1 @  r2 r1 -----> A . D
	ldr r0, =C
	ldr r1,[r0] 
	bic r4, r2, r1   @ BIC A AND Not D
	
			@ *-----  A.D./E + /B.C./D + /A.B./D + A.B./C
	
	orr r6, r4
	
	@ --- 	B.C.E	-------------------
	ldr r0, =B @     r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =C   @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	and r2, r1 @  r2 r1 -----> A . D
	ldr r0, =E
	ldr r1,[r0] 
	and r2, r1
	
	@ *-----  A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E 
	orr r6, r2
	
	
	@ --- A./B./E	--------------------
	ldr r0, =A @      r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =B   @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	bic r2, r1, r2	@		 r1 -----> A . D
	ldr r0, =E
	ldr r1,[r0] 
	bic r4,r2, r1   @ BIC A AND Not D
	
	@ *-----  A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E + A./B./E
	orr r6, r4
	
	
	@ --- /B./C.D	-------------------
	ldr r0, =B	@      r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =D  @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	bic r2, r2, r1	@	r1 -----> A . D
	ldr r0, =C
	ldr r1,[r0] 
	bic r3,r2, r1   @ BIC A AND Not D
	
	
	@ *-----  A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E + A./B./E	+ /B./C.D
	orr r6, r3
	
	@ --- /B.D./E --------------
	
	ldr r0, =B @      r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =D  @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	bic r2, r2, r1	@		 r1 -----> A . D
	ldr r0, =E
	ldr r1,[r0] 
	bic r4,r2, r1   @ BIC A AND Not D
	
		@ *-----  A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E + A./B./E	+ /B./C.D + /B.D./E 
	orr r6, r4
	
	
	@ --- /A./D.E	-------------------
	ldr r0, =A	@      r0-----> x.0125842445000 
	ldr r1, [r0]  @    r1 = 1 A
	ldr r0, =E @  r0 -------> D
	ldr r2, [r0]  @  r2 = 0 D
	bic r2, r2, r1	@	r1 -----> A . D
	ldr r0, =D
	ldr r1,[r0] 
	bic r3,r2, r1   @ BIC A AND Not D
	
		@ *-----  A.D./E + /B.C./D + /A.B./D + A.B./C + B.C.E + A./B./E	+ /B./C.D + /B.D./E + /A./D.E
	orr r6,	r3
	
	bx lr
	