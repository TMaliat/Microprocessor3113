		AREA test, CODE, READONLY
		ENTRY ; starting point of the code execution
		;EXPORT main ; the declaration of identifier main
;main ; address of the main function
	; User code starts from the next line
	MOV r0, #6 ; store some arbitrary numbers
	MOV r1, #5
	SUB r2, r0, r1 ; subtract the values in r0 and r1 and store the result in r2
Stop B Stop ; Endless loop
	END ; End of the program, matched with ENTRY keyword