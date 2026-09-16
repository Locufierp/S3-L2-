
//EX2
@13
D=M
@14
D=D+M
@13
M=D

//D;JEQ 0
//D;JMP
//@13

//@9
//D=D-A 
//A=0
//D;JLT  
//D;JMP
//@13

//@1
//D=M
//@END
//D;JGT 
//@2
//M=A
//(END)
//@2
//M=1

@S
M=0
(LOOP)
@i
D=M
@10
D=D-A
@END
D;JGE
@S
D=M
@i
M=M+1
D=D+M
@LOOP
0;JMP
(END)

//EX3

//@2
//D=M
//(LOOP)
//@END
//D;JLE
//@1
//D=D-M
//@T
//D=D+1
//@LOOP
//(END)
//@3
//M=D




