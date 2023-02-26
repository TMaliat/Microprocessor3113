			AREA    largest, CODE, READONLY
			ENTRY
			EXPORT main ; the declaration of identifier main
main ; address of the main function
        ; Define variables
        N       EQU     5       ; Number of elements
        numbers DCD     10,20,30,40,50 ; List of numbers

        ; Set up stack
        LDR     r13, =0x4000 ; Stack pointer
        MOV     r14, #0      ; Frame pointer

        ; Find largest number
        LDR     r0, =numbers ; Load address of array
        LDR     r1, [r0]     ; Load first element
        SUB     r2, r1, #1   ; Initialize largest to one less than first element

Loop
        ADD     r0, r0, #4   ; Move to next element
        LDR     r3, [r0]     ; Load next element
        CMP     r3, r2       ; Compare current element with largest
        MOVGT   r1, r0       ; Move address of current element to r1 if it is greater
        MOVGT   r2, r3       ; Move current element to largest if it is greater
        SUBS    r4, r4, #1   ; Decrement counter
        BNE     Loop         ; Loop if counter != 0

        ; Print largest number
        MOV     r0, r2       ; Move largest number to r0
        BL      printf      ; Call printf function
        MOV     r0, #0      ; Return 0 to operating system
        BL      exit        ; Call exit function

        END

