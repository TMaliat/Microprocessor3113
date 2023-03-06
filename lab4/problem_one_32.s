		AREA problem_one_32, CODE, READONLY
		ENTRY ; starting point of the code execution
		;EXPORT main ; the declaration of identifier main
;main ; address of the main function
	; User code starts from the next line
	MOV r0, #0xFFFFFFFF ; 32 bit number
	MOV r1, #0x10000000
	
	AND r2, r0, r1 ; r2=r0 AND r1
	
	ORR r3, r0, r1 ; r3=r0 OR r1
	
	MOV r4, r2
	MVN r4, r4 ; NAND
	
	MOV r5, r3
	MVN r5, r5 ; NOR
	
	EOR r6, r0, r1 ; r4 = r0 XOR r1
	
	MOV r7, r6
	MVN r7, r7 ; XNOR

Stop B Stop ; Endless loop
	END ; End of the program, matched with ENTRY keyword