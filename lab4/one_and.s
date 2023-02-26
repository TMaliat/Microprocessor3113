		AREA test, CODE, READONLY
		ENTRY ; starting point of the code execution
		EXPORT main ; the declaration of identifier main
main ; address of the main function
	; User code starts from the next line
	MOV r1, #0x1234 ; store some arbitrary numbers
	MOV r2, #0xABCD
	AND r0, r1, r2 ; add the values in r0 and r1 and store the result in r2
Stop B Stop ; Endless loop
	END ; End of the program, matched with ENTRY keyword
