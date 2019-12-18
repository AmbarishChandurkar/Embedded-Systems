;Write an assembly language program to generate square wave of 1KHz at pin P1.2 without using timers. 

		ORG 0000H;
		LJMP START		;leave the reserved space

		ORG 0030H;
START : CLR P1.2		;make port 1 as output port
		CPL P1.2		;Start the wave
		
DELAY: ;generate a delay
		MOV R0,#2	; set the various counts
HERE2 :	MOV R2,#249	;This loop generates a delay of 250ms approx, thus repeated 4 times
HERE3 : DJNZ R2,HERE3;
		DJNZ R0,HERE2;
		CPL P1.2;
		SJMP DELAY;
		END;