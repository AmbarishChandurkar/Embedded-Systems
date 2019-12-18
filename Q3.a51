; Write an assembly language program to sort the positive and negative number and store at different memory locations. 
; INPUT - MEMORY LOCATION OF THE INPUT ARRAY AT 25H, FIRST ELEMENT CONTAINING COUNT OF THE NUMBERS
; OUTPUT - THE POSITIVE NUMBERS ARE STORED STARTING FROM 40H
;		 - THE NEGATIVE NUMBERS ARE STORED STARTING FROM AFTER POSITIVE NUMBERS
ORG 0000H;
LJMP START;leave the space reserved 

ORG 0030H;
;Code to store a Sample array of 10 numbers starting at 30H
START : MOV 30H,#10		;Count of total numbers
		MOV 31H,#-1
		MOV 32H,#-2
		MOV 33H,#-3
		MOV 34H,#-4
		MOV 35H,#-5
		MOV 36H,#6
		MOV 37H,#7
		MOV 38H,#8
		MOV 39H,#9
		MOV 25H,#30H	;starting address of the array

;Sorting Code
		MOV SP,25H		;Import the starting address of the array
		MOV A,SP;
		POP 03H			;Import the total count of the elements in R3
		ADD A,R3		;get the last location PLUS ONE of the array
		DEC A			;get the last location
		MOV SP,A;
		MOV R0,#40H		;Pointer to storage location of 'Positive Numbers'
		MOV R1,#50H		;Pointer to storage location of 'Negative Numbers'


LOOP :  POP 0E0H		;Start importing elements one by one into Accumulator
		RLC A			;Save the sign bit into carry flag
		JC NEG			;If sign bit is 1, the number is negative
						;Else it is positive

		;Code for saving Positive number
		RRC A			;get back the original number
		MOV @R0,A		;save the positive number
		INC R0			;point to next location of positive numbers
		SJMP DONE; 

		;Code to save negative number
NEG :   RRC A			;get back the original number
		MOV @R1,A		;save the negative number
		INC R1			;point to next location of negative numbers

DONE :  DJNZ R3,LOOP	;repeat the loop 
		END;