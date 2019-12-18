; Write an assembly language program to find the sum of first 10 numbers. 

		ORG 0000H;
		MOV A ,#00H		;clear accumulator before use
		MOV R0 ,#09H 	;set the count for first 10 numbers (0 to 9)

LOOP :  ADD A,R0 		;go on adding
		DJNZ R0 ,LOOP 	;Decrement count till 10 numbers are added
		END