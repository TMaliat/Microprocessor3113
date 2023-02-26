		AREA test, CODE, READONLY
		ENTRY ; starting point of the code execution
		EXPORT main ; the declaration of identifier main
main ; address of the main function
	; User code starts from the next line
	LDR r1, =MyValue 
	MOV r2, #16         ; Load the shift amount into r2 (e.g., 16 for a 16-bit shift)
	
	ASR r0, r1, r2      ; Perform a logical shift right operation on the variable in r1 by the amount in r2, and store the result in r0
	
Stop B Stop ; Endless loop
MyValue DCD 0x12345678 ; The value to be loaded into r1
	END ; End of the program, matched with ENTRY keyword
