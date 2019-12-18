;Write an assembly language program to generate square wave having 66.66% duty cycle and period of 1second using (a) Two timers (b) One timer. 

;Part (b) : Using 1 Timers
;Timer 0 - For generating a delay of 666ms 
;Timer 1 - For generating a delay of 333ms

		ORG 0000H;
		LJMP START		;leave the reserved space

		ORG 0030H;
START : CLR P1.2		;make port 1 as output port

WAVE:	CPL P1.2		;start the wave
		ACALL DELAY666;
		CPL P1.2;
		ACALL DELAY333;
		SJMP WAVE;
		
		
DELAY666 : MOV TMOD,#01H	;timer 0 as "timer", IN MODE 1
		MOV R0,#20;
AGAIN1 :MOV TH0,#00H	;initial count of counter 
		MOV TL0,#00H		
		SETB TR0		;start counting the pulses
CHECK1 : JNB TF0,CHECK1;
		CLR TF0;
		CLR TR0			;stop the timer
		DJNZ R0,AGAIN1;
		
		MOV TH0,#0ACH	;initial count of counter for remaining time
		MOV TL0,#0E0H		
		SETB TR0		;start counting the pulses
CHECK2 : JNB TF0,CHECK2;
		CLR TF0;
		CLR TR0			;stop the timer
		RET;
		
DELAY333 : MOV TMOD,#01H	;timer 0 as "timer", IN MODE 1
		MOV R0,#10;
AGAIN2 :MOV TH0,#00H	;initial count of counter 
		MOV TL0,#00H		
		SETB TR0		;start counting the pulses
CHECK3 : JNB TF0,CHECK3;
		CLR TF0;
		CLR TR0			;stop the timer
		DJNZ R0,AGAIN2;
		
		MOV TH0,#0D6H	;initial count of counter for remaining time
		MOV TL0,#70H		
		SETB TR0		;start counting the pulses
CHECK4 : JNB TF0,CHECK4;
		CLR TF0;
		CLR TR0			;stop the timer
		RET;		
		END;