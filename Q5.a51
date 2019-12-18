;Write an assembly language program to generate delay of 500micro seconds without using timers. 

		ORG 0000H;
		LJMP START	;leave the reserved space

		ORG 0030H;
START : MOV A,#00H	;initialise
		MOV P1,A	;make port 1 as output port
		CPL P1.0;

DELAY: ;generate a delay
		MOV R0,#2	; set the various counts
HERE2 :	MOV R2,#249	;This loop generates a delay of 250ms approx, thus repeated 2 times
HERE3 : DJNZ R2,HERE3;
		DJNZ R0,HERE2;
		CPL P1.0;
		END;
