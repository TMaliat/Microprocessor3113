		AREA problem_five, CODE, READONLY
		ENTRY
		;EXPORT main

; main function
;main
       
    MOV r2, #5 ; input size
    LDR r3, =my_array ; load the address of the array
    LDR r0, [r3] ; initialize r0 with the first element
    MOV r4, r2 ; loop counter
    ADD r3, r3, #4 ; increment the array address to point to the next element

loop    
    LDR r5, [r3], #4 ; load the next element into r5 and increment the array address
    CMP r5, r0 ; compare r5 with the current largest value in r0
    MOVGT r0, r5 ; if r5 is greater, set r0 to r5
    SUBS r4, r4, #1
    BNE loop

    ; at this point, r0 should hold the largest value

Stop B Stop ; stop the program
; fill the input array with values
	AREA array, DATA, READWRITE
my_array DCD 10, 20, 30, 40, 50
END