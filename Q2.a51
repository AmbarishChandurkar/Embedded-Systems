;Write an assembly language program to check the number as a prime number. 
;INPUT - 'N' = TO BE GIVEN AT MEMORY LOCATION '30H'
;OUTPUT - AT MEMORY LOCATION '31H'
;		- '00' DENOTES THAT INPUT IS PRIME NUMBER
;		- NON - ZERO VALUE INDICATES "NOT A PRIME NUMBER"

		ORG 0000H;

		MOV 30H, #17 	;Assume a that number '17' is present at memory location '30H'

		MOV A,30H		;Import the number
		MOV B,#02		;for finding N/2
		DIV AB			;get N/2 in A

		MOV R2,30H		;Save the original number 
		MOV R0,A		;set the count
		MOV R1,#02		;set the initial divisor
		MOV R3, #00		;for counting of factors of N

LOOP : 	MOV A,R2		;move the original number to A
		MOV B,R1		;move the latest divisor to B
		DIV AB			;perform division with current divisor
		MOV A,B			;shift remainder to the accumulator for comparison
		JNZ NEXT		;if remainder is zero, no need to increment count
		INC R3			;Increment the count of factors
NEXT : 	INC R1			;set the next divisor
		DJNZ R0,LOOP	;repeat the loop, till we reach N/2
		END
