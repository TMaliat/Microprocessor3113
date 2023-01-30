		AREA test, CODE, READONLY
		ENTRY ; starting point of the code execution
		;EXPORT main ; the declaration of identifier main
;main ; address of the main function
	; User code starts from the next line
	MOV r1, #2 ; store some arbitrary numbers
	MOV r2, #4
	MOV r3, #5
	ADD r4, r1, r2 ; add the values in r0 and r1 and store the result in r2
	ADD r0, r4, r3 ; add the values in r0 and r1 and store the result in r2
Stop B Stop ; Endless loop
	END ; End of the program, matched with ENTRY keyword