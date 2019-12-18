; Write an assembly language program to generate delay of 500micro seconds using timers. 

		ORG 0000H;
		LJMP START		;leave the reserved space

		ORG 0030H;
START : CLR P1.0		;make port 1 as output port
		CPL P1.0		;Start the Pulse
		MOV TMOD,#01H	;timer 0 as "timer", IN MODE 1
		MOV TH0,#0FCH	;initial count of counter 
		MOV TL0,#18H;
		SETB TR0		;start counting the pulses
CHECK : JNB TF0,CHECK;
		CLR TR0			;Stop the timer
		CLR TF0;
		CPL P1.0		;Stop the Pulse
		END;