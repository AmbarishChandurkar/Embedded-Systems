;Write an assembly language program to on/off the led (P1.0) as per the status of the switch connected at P1.2. 

		ORG 0000H
		LJMP START	;leave the reserved space

		ORG 0040H;
START : MOV P2,#00H	;make port 2 as output port
		MOV P0,#0FFH;make port 0 as input port

LOOP : 	MOV A,P0	;take input into register A
		ANL A,#07H	;Remove all bits except 1st three
		MOV R1,A	;Initialise R1 with count
		MOV A,#80H	;Default output
		INC R1		;Adjustment

AGAIN : RL A		;Rotate; so that correct bit is selected
		DJNZ R1,AGAIN;
		MOV P2,A	;Output the pattern
		JMP LOOP	;Continue polling the input
		END;