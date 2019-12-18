;Write an assembly language program to generate square wave at P1.5 of period 100 microsecond  using auto reload mode


		ORG 0000H;
		LJMP START		;leave the reserved space

		ORG 0030H;
START : CLR P1.5		;make port 1 as output port
		MOV TMOD,#02H	;timer 0 as "timer", IN MODE 2
		MOV TH0,#38H	;initial count of counter 38 to FF is 200 counts = 100Microsec/0.5Microsec,
						;where 0.5 secs = time period of 1 machine cycle
		SETB TR0		;start counting the pulses
CHECK : JNB TF0,CHECK;
		CLR TF0			;Auto - Reload 
		CPL P1.5		;toggle the LED
		SJMP CHECK;
		END;