			AREA OverflowTest, CODE, READONLY
			ENTRY
			EXPORT main ; the declaration of identifier main
main ; address of the main function
        ; Declare variables
        num1        DCW     0
        num2        DCW     0
        sum         DCW     0
        overflow    DCB     0

        ; Get user input
        LDR r0, =num1       ; Load address of num1 into r0
        LDR r1, =num2       ; Load address of num2 into r1
        LDR r2, =sum        ; Load address of sum into r2

        ; Read first input
        MOV r7, #3          ; Set R7 to 3 to indicate read system call
        MOV r1, #0          ; Set R1 to 0 for standard input
        LDR r0, =num1       ; Load address of num1 into r0
        MOV r2, #4          ; Set R2 to 4 bytes to read
        SWI 0               ; Call system call to read input
        LDR r0, =num1       ; Load value of num1 into r0
        LDRH r0, [r0]

        ; Read second input
        MOV r7, #3          ; Set R7 to 3 to indicate read system call
        MOV r1, #0          ; Set R1 to 0 for standard input
        LDR r0, =num2       ; Load address of num2 into r0
        MOV r2, #4          ; Set R2 to 4 bytes to read
        SWI 0               ; Call system call to read input
        LDR r1, =num2       ; Load value of num2 into r1
        LDRH r1, [r1]

        ; Add the inputs
        ADD r3, r0, r1      ; Add num1 and num2, result in r3

        ; Check for overflow
        CMP r3, #32767      ; Check if the result is greater than 32767
        BGT overflowed      ; Branch if greater than to overflowed label
        CMP r3, #-32768     ; Check if the result is less than -32768
        BLT overflowed      ; Branch if less than to overflowed label

        ; Store the result in sum variable
        STR r3, [r2]        ; Store result in sum variable
        B exit              ; Branch to exit label

    overflowed:
        ; Set overflow flag to 1 and store the maximum possible value in sum variable
        MOV r3, #32767      ; Set result to the maximum value of 32767
        STR r3, [r2]        ; Store result in sum variable
        MOV r3, #1          ; Set overflow flag to 1
        STRB r3, [overflow] ; Store overflow flag in overflow variable

    exit:
        ; End of program
        MOV r7, #1          ; Set R7 to 1 to indicate exit system call
        SWI 0               ; Call system call to exit program
        END
