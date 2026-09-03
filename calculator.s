.global _start

_start:
	//first number
	MOV r7, #3
	MOV r0, #0
	LDR r1, =buffer1
	MOV r2, #32
	SVC #0

	//second number
	MOV r7, #3
	MOV r0, #0
	LDR r1, =buffer2
	MOV r2, #32
	SVC #0

