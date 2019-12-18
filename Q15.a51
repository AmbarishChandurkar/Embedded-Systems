; Write an assembly language program to toggle a led connected at P1.0 after each 20 pulses sensed at pin 14. 


		ORG 0000H;
		LJMP START		;leave the reserved space

		ORG 0030H;
START : SETB P3.4		;make port 3 as input port
		CLR P1.0		;make port 1 as output port
		MOV TMOD,#06H	;timer 0 as "counter", IN MODE 2
		MOV TH0,#0ECH	;initial count of counter FF to EC is 20 counts
		SETB TR0		;start counting the pulses
CHECK : JNB TF0,CHECK;
		CLR TF0			;Auto - Reload 
		CPL P1.0		;toggle the LED
		SJMP CHECK;
		END;