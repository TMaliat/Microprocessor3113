		AREA problem_three, CODE, READONLY 
		ENTRY ; starting point of the code execution 
		EXPORT main ; the declaration of identifier main 
main ; address of the main function
	
	;without handling overflow
	MOV32 r0, #0xFFFFFFFF ; moving a 32 bit arbitrary value at r0
	MOV32 r1, #0x10000000
	
	ADD r2, r0, r1
	SUB r3, r0, r1
	MUL r4, r0, r1
	SDIV r5,r0,r1
	
	;handling overflow
	
	ADDS r6, r0, r1
	MOVCS r7, #1
	
	SUBS r8, r0, r1
	MOVCS r9, #1
	
	UMULL r10, r11, r0, r1 ; the output will be 64 bits lower bits in r11 and upper bits in r10
	SDIV r12, r0, r1
Stop B Stop ; Endless loop
	END ; End of the program, matched with ENTRY keyword	