		AREA problem_two, CODE, READONLY 
		;ENTRY ; starting point of the code execution 
		;EXPORT main ; the declaration of identifier main 
;main ; address of the main function

	MOV32 r0, #0xFFFF1234 ; move a 32 bit arbitrary value at r0
	
	ASR r1, r0, #4
	LSL r2, r0, #4
	LSR r3, r0, #4
	
	
STOP B STOP ; Endless loop 
	END ; End of the program, matched with ENTRY keyword