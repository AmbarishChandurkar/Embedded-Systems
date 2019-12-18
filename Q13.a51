;Write an assembly language program to find the frequency of the signal connected to Pin 14, using mode 1.

		ORG 0000H;
		LJMP START		;leave the reserved space

		ORG 0030H;
START : SETB P3.4		;make port 3 as input port

		MOV TMOD,#15H	;timer 0 as "counter", timer 1 as "timer"
		MOV TH0,#00H	;initial count of counter
		MOV TL0,#00H;

		SETB TR0		;start counting the pulses
		ACALL DELAY		;start the delay of 1 sec

		CLR TR0			;stop the counting, since 1 second is over

		MOV A,TL0		;save the count
		MOV 50H,A;
		MOV A,TH0;
		MOV 51H,A;


DELAY : MOV R0,#30H		;this subroutine generates a delay of approx 1 sec
AGAIN : MOV TL1,#00H	;set initial count
		MOV TH1,#00H;

		SETB TR1		;start the counting
CHECK : JNB TF1,CHECK	;generation of delay
		CLR TF1			;stop the timer
		CLR TR1;
		DJNZ R0,AGAIN	;repeat again
		RET;
		END;