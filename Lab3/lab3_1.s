		AREA test, CODE, READONLY
		ENTRY ; starting point of the code execution
		EXPORT main ; the declaration of identifier main
main ; address of the main function
	; User code starts from the next line
	MOV r0, #4 ; store some arbitrary numbers
	MOV r1, #5
	MOV r2, #1
	ADD r3, r0, r1 ; add the values in r0 and r1 and store the result in r2
	ADD r4, r3, r2 ; add the values in r0 and r1 and store the result in r2
Stop B Stop ; Endless loop
	END ; End of the program, matched with ENTRY keyword