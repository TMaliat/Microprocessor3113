			AREA avg, CODE, READONLY
			NTRY
			EXPORT main ; the declaration of identifier main
main ; address of the main function
        ; Initialize variables
        MOV r0, #0      ; counter
        MOV r1, #0      ; accumulator
        MOV r2, #0      ; input
        MOV r3, #0      ; average

        ; Ask user to enter total number of inputs
        LDR r4, =msg1   ; load the message to print
        BL printf       ; print the message
        LDR r4, =inpt   ; load the format string
        MOV r0, #0      ; file descriptor for stdin
        BL scanf        ; read the input
        MOV r5, r0      ; store the input in r5

        ; Start loop to input numbers
        LDR r6, =msg2   ; load the message to print
        MOV r0, #1      ; file descriptor for stdout
    loop:
        CMP r0, r5      ; compare counter with total number of inputs
        BEQ done        ; if counter equals total, exit the loop
        BL printf       ; print the message to input number
        LDR r4, =inpt   ; load the format string
        MOV r0, #0      ; file descriptor for stdin
        BL scanf        ; read the input
        ADD r1, r1, r0  ; add the input to accumulator
        ADD r0, r0, #1  ; increment the counter
        B loop          ; repeat the loop

        ; Calculate and print the average
    done:
        MOV r3, r1      ; store the accumulator to r3
        SDIV r3, r3, r5 ; divide accumulator by total number of inputs
        LDR r4, =msg3   ; load the message to print
        BL printf       ; print the message with the average
        LDR r4, =outpt  ; load the format string
        MOV r0, #1      ; file descriptor for stdout
        MOV r1, r3      ; move the average to r1
        BL printf       ; print the average

        ; Exit program
        MOV r0, #0      ; exit status
        BL exit         ; exit program

msg1:   DCB "Enter total number of inputs: ", 0
msg2:   DCB "Enter number %d: ", 0
msg3:   DCB "The average of the numbers is: ", 0
inpt:   DCB "%d", 0
outpt:  DCB "%d\n", 0

        END
