		AREA test, CODE, READONLY
		ENTRY
		; User code starts from the next line
		EXPORT main ; the declaration of identifier main
main ; address of the main function
	; Reserve space on the stack for two 32-bit integers
	SPACE   8
	; Prompt the user to enter the first number
	MOV     r0, #0          ; Use r0 as a scratch register
	LDR     r1, =msg1       ; Load the address of the first message string into r1
	BL      printf          ; Call the printf function to display the message
	; Read the first number from the user
	LDR     r0, =format     ; Load the address of the format string into r0
	MOV     r1, sp          ; Load the address of the first stack slot into r1
	BL      scanf           ; Call the scanf function to read the integer from the user
	; Prompt the user to enter the second number
	MOV     r0, #0          ; Use r0 as a scratch register
	LDR     r1, =msg2       ; Load the address of the second message string into r1
	BL      printf          ; Call the printf function to display the message
	; Read the second number from the user
	LDR     r0, =format     ; Load the address of the format string into r0
	ADD     r1, sp, #4      ; Load the address of the second stack slot into r1
	BL      scanf           ; Call the scanf function to read the integer from the user
	; Add the two numbers together
	LDR     r0, [sp]        ; Load the first number from the stack
	LDR     r1, [sp, #4]    ; Load the second number from the stack
	ADD     r0, r0, r1      ; Add the two numbers together
	; Display the result to the user
	MOV     r1, #0          ; Use r1 as a scratch register
	LDR     r2, =msg3       ; Load the address of the third message string into r2
	BL      printf          ; Call the printf function to display the message
	LDR     r0, =format     ; Load the address of the format string into r0
	LDR     r1, =result     ; Load the address of the result string into r1
	BL      printf          ; Call the printf function to display the result
	; End of user code
Stop B Stop          ; Infinite loop
	END                     ; End of the program, matched with ENTRY keyword
