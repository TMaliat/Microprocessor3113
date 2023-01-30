		AREA test, CODE, READONLY
		ENTRY ; starting point of the code execution
		EXPORT main ; the declaration of identifier main
main ; address of the main function
	; User code starts from the next line
	MOV r0, #X ; store some arbitrary numbers
	MOV r1, #Y
	MOV r2, #Z
	ADD r3, r0, r1 ; subtract the values in r0 and r1 and store the result in r3
	ADD r4, r3, r2 ; subtract the values in r0 and r1 and store the result in r4
Stop B Stop ; Endless loop
X EQU -1
Y EQU 3
Z EQU 4
	END ; End of the program, matched with ENTRY keyword