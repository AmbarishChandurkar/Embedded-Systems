;Write an assembly language program to toggle led connected at P1.0. 

		ORG 0000H;
		LJMP START; leave the reserved space

		ORG 0030H;
START : MOV A,#00H;initialise
		MOV P1,A;make port 1 as output port

HERE : 	CPL P1.2;start toggling
		ACALL DELAY;wait for few milliseconds
		SJMP HERE;repeat the while process

;Subroutine "DELAY"

DELAY: ;generate a delay
		MOV R0,#255; set the various counts
HERE1 : MOV R1,#255;
HERE2 :	MOV R2,#255;
HERE3 : DJNZ R2,HERE3;
		DJNZ R1,HERE2;
		DJNZ R0,HERE1;
		RET;

		END;
