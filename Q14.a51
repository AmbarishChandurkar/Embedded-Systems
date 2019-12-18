; Write an assembly language program to find the frequency of the signal connected to Pin 15, using mode 2.

		ORG 0000H;
		LJMP START		;leave the reserved space

		ORG 0030H;
START : SETB P3.5		;make port 3 as input port

		MOV TMOD,#51H	;timer 1 as "counter", timer 0 as "timer"
		MOV TH1,#00H	;initial count of counter
		MOV TL1,#00H;

		SETB TR1		;start counting the pulses
		ACALL DELAY		;start the delay of 1 sec

		CLR TR1			;stop the counting, since 1 second is over

		MOV A,TL1		;save the count
		MOV 50H,A;
		MOV A,TH1;
		MOV 51H,A;


DELAY : MOV R1,#02H		;Since frequency is 24MHz, below code generates delay of 0.5 secs
						;So we repeat it 2 times to get 1 sec delay
HERE :	MOV R0,#255		;this subroutine generates a delay of approx 1 sec
		MOV TH0,#00H	;set initial count
		
		SETB TR0		;start the counting
CHECK : JNB TF0,CHECK	;generation of delay
		CLR TF0			;stop the timer
		DJNZ R0,CHECK	;repeat again
		DJNZ R1,HERE;
		RET;
		END;