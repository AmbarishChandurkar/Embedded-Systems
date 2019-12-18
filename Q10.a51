; Write an assembly language program to generate square wave of 1KHz at pin P1.2 using timers

		ORG 0000H;
		LJMP START		;leave the reserved space

		ORG 0030H;
START : CLR P1.2		;make port 1 as output port
		MOV TMOD,#01H	;timer 0 as "timer", IN MODE 1
AGAIN :	MOV TH0,#0FCH	;initial count of counter 
		MOV TL0,#18H	;FF18 TO FFFF is 1000 machine cyles as required for half period of output wave	
		SETB TR0		;start counting the pulses
CHECK : JNB TF0,CHECK;
		CLR TF0;
		CLR TR0			;stop the timer
		CPL P1.2		;toggle the LED
		SJMP AGAIN;
		END;