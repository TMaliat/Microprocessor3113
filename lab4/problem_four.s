		AREA problem_four, CODE, READONLY
		ENTRY
		;EXPORT main

; main function
;main
       
    MOV r2, #5 ; input size
        ; loop through the inputs and add to sum
    LDR r3, =my_array
	MOV r4, r2

loop    
	LDR r5, [r3], #4
	ADD r6, r5, r6
	SUBS r4, r4, #1
    BNE loop

    SDIV r0, r6, r2

Stop B Stop ; stop the program
; fill the input array with values
	AREA array, DATA, READWRITE
my_array DCD 10, 20, 30, 40, 50
END 