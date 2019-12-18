;Write an assembly language program to find the probability of occurrence of each number in a array of 20 numbers

		ORG 0000H;
		LJMP START		;leave the reserved location
		;DATA IS STORED AFTER THE PROGRAM USING DIRECTIVE "DB"

		ORG 0040H;
START : MOV R0,#00		;holds the count of the element covered
		MOV R1,#20H		;storage location of the lement in data memory

STEP1 :;Import all array elements from Program memory INTO data memory
		MOV A,R0		;import the current index in A
		ACALL GETDATA	;a utility function defined at the end of the program
		MOV @R1,A		;save it the designated location
		INC R0			;increment the count
		INC R1			;increment the pointer to the storage location
		CJNE R0,#20,STEP1;Loop if all 20 elements are not covered

STEP2: ;BUBBLESORT all the elements according to their magnitude
		MOV R3,#20		;Iteration Count
LABEL3 :MOV R0,#20H		;save storage location in R0
		MOV 05H,R3		;transfer the iteration count from r3 to r0
		MOV R2,05H;
		MOV A, @R0		;import prior element in A
		INC R0;
		MOV 05H,@R0		;import next element in R1
		MOV R1,05H;
LABEL2 :MOV B,A			;save the prior element in B
		SUBB A,R1		;check to see which is greater
		JC LABEL1		;if A < R1, then proceed to next element
		MOV 05H,B		;if A > R1, then swap them
		MOV @R0,05H;
		DEC R0;
		MOV A,R1;
		MOV @R0,A;
		INC R0;
LABEL1 :MOV A,@R0;
		INC R0;
		MOV 05H,@R0;
		MOV R1,05H;
		DJNZ R2, LABEL2	;For N elements, reapeat N times
		DJNZ R3, LABEL3	;Cover all N elements

STEP3 : ;find the count of elements
		MOV R2,#20 		;store the count of array
		MOV R3,#00H		;initialise the array index
		MOV R0,#50H		;storage location of lookup table containing first the element and next its count
		MOV R1,#20H		;storage location of the array
		MOV R5,#00		;Initialise the count
		MOV A,@R1		;import the first element
		MOV B,A			;Save the element, Since after SUBB inst, contents of A are lost
	    INC R1;

LOOP2 : MOV R4,B		;transfer previous element into r4
		INC R1			;point to next location
		MOV A,@R1		;import next element in A
		MOV B,A			;Save the element, Since after SUBB inst, contents of A are lost
		CLR C			;clear carry before any use
		SUBB A,R4		;check if prior and next element are equal
		JZ NEXT			;If yes,Simply increment the count
		MOV @R0,04H		;If not,then store first the prior element and next, its count
		INC R0			;Increment pointer to store the count
		INC R5;
		MOV 07H,R5;
		MOV@R0,07H		;save the count
		INC R0			;Increment pointer for future storage
		MOV R5,#00H		;Reset the counter
		DJNZ R2,LOOP2	;Repeat the loop
NEXT :  INC R5			;count the current element
		DJNZ R2,LOOP2	;Repeat the loop

GETDATA : ;used to get the data of the array in the accumulator.
;Input : Index of the data byte in the accumulator
		INC A;
		MOVC A,@A+PC;
		RET;
		DB  2, 3, 5, 7, 3, 3, 7, 9, 2, 5, 3, 2, 5, 5, 3, 2, 3, 5, 1, 2 ;define an array of 20 numbers
		END;