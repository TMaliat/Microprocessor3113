		AREA problem_six, CODE, READONLY
		ENTRY
		;EXPORT main

; function to sum an array of numbers
sum
    PUSH {lr} ; save the return address
    MOV r2, #5 ; input size
    ; loop through the inputs and add to sum
    LDR r3, [r0] ; load the address of the array
    MOV r4, r2
loop    
    LDR r5, [r3], #4 ; load the next number
    ADD r6, r5, r6 ; add to the sum
    SUBS r4, r4, #1 ; decrement the loop counter
    BNE loop ; branch to loop if not done
    MOV r0, r6 ; move the sum to the return register
    POP {pc} ; return from the function

; main function
;main
    LDR r0, =my_array ; load the address of the array
    BL sum ; call the sum function
    SDIV r0, r0, r2 ; divide the sum by 5 to get the average
Stop B Stop ; stop the program

; fill the input array with values
	AREA array, DATA, READWRITE
my_array DCD 10, 20, 30, 40, 50
END
