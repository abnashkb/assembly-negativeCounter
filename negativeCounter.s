	.data
N: .word 6
NUMBERS: .word 10, 0, -2, 80, -1, -4
NEGNUM: .word 0
	.text
.global _start
_start:
	LDR R0, =N
	LDR R0, [R0]	//store total number of words
	MOV R1, #0 //iterations
	MOV R2, #0 //number of negative numbers
	LDR R3, =NUMBERS //address of start of list
	PUSH {R4-R6}
LOOP:
	CMP R1, R0
	BEQ SAVE_COUNT
	LDR R4, [R3]
	ADD R1, #1 //because we have done another iteration
	ADD R3, #4 //so next time we check the next list element
	CMP R4, #0
	BLT ADD_COUNT //branches if value of list element is less than 0
	B LOOP
ADD_COUNT:
	ADD R2, #1
	B LOOP
SAVE_COUNT:
	//no longer need r0 so can overwrite it
	LDR R0, =NEGNUM
	STR R2, [R0]
CLEANUP: POP {R4-R6}
END: B END
	