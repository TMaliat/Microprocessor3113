			AREA    Average, CODE, READONLY
			ENTRY
			EXPORT main ; the declaration of identifier main
main ; address of the main function
        ; Declare external function
        EXTERN  AverageFunc

        ; Define variables
        N       EQU     10      ; Number of elements
        numbers DCD     10,20,30,40,50,60,70,80,90,100 ; List of numbers

        ; Set up stack
        LDR     r13, =0x4000 ; Stack pointer
        MOV     r14, #0      ; Frame pointer

        ; Call function to calculate average
        PUSH    {r0-r3, lr}  ; Save registers
        LDR     r0, =numbers ; Load address of array
        MOV     r1, #N      ; Load number of elements
        BL      AverageFunc ; Call function
        MOV     r2, r0      ; Save result in r2
        POP     {r0-r3, pc}  ; Restore registers and return

AverageFunc
        ; Function to calculate average of N numbers
        ; Inputs: r0 - address of array
        ;         r1 - number of elements
        ; Output: r0 - average of array

        ; Set up function stack
        PUSH    {r4-r6, lr}  ; Save registers
        MOV     r4, r0      ; Save address of array
        MOV     r5, r1      ; Save number of elements
        MOV     r6, #0      ; Initialize sum

Loop
        LDR     r0, [r4], #4 ; Load next element
        ADD     r6, r6, r0  ; Add to sum
        SUBS    r5, r5, #1  ; Decrement counter
        BNE     Loop        ; Loop if counter != 0

        ; Calculate average and return
        MOV     r0, r6      ; Move sum to r0
        MOV     r1, #N      ; Move number of elements to r1
        BL      __aeabi_idiv ; Call division function
        POP     {r4-r6, pc} ; Restore registers and return

        END
