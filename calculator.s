.global _start

buffer1:
	.space 32

buffer2:
	.space 32

buffer_Sym:
	.space 32

_start:
	//first number
	MOV r7, #3
	MOV r0, #0
	LDR r1, =buffer1
	MOV r2, #32
	SVC #0

	MOV r0, #0
	bl converter
	MOV r9, r0

	//second number
	MOV r7, #3
	MOV r0, #0
	LDR r1, =buffer2
	MOV r2, #32
	SVC #0

	MOV r0, #0
	bl converter
	MOV r11, r0

	//symbole
	MOV r7, #3
    MOV r0, #0
    LDR r1, =buffer_Sym
    MOV r2, #2
    SVC #0

	LDR r1, =buffer_Sym
	LDRB r10, [r1]

	cmp r10, #0x2B
	BEQ add_func

	cmp r10, #0x2D
	BEQ sub_func

	cmp r10, #0x2A
	BEQ mult_func

	cmp r10, #0x2F
	BEQ div_func

	BAL exit_program

add_func:
        ADD r0, r9, r11          // r0 = r9 + r11
        BAL print_result

sub_func:
        SUB r0, r9, r11          // r0 = r9 - r11
        BAL print_result

mult_func:
        MUL r0, r9, r11          // r0 = r9 * r11
        BAL print_result

div_func:
        SDIV r0, r9, r11
	BAL print_result

exit_program:
        MOV r7, #1               // Linux kernel system call for exit (sys_exit)
        MOV r0, #0               // Return code 0 (Success)
        SVC #0                   // Supervisor call to trigger the exit


converter:
	LDRB r3, [r1]
	CMP r3, #10
	BEQ convert_done    // if newline, exit loop

	LDR r2, =zero
	LDRB r4, [r2]

	MOV r6, #10
	SUB r5, r3, r4
	MUL r7, r0, r6
	ADD r0, r7, r5

	ADD r1, r1, #1
	BAL converter

convert_done:
	BX lr

zero:
	.byte 0x30
