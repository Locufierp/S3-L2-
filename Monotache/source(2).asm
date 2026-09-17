
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
A=0
(LOOP)
@i
D=M
@9
D=D-A
@END
D;JGE
@i
M=M+1
D=M
@S
M=D+M
@LOOP
0;JMP
(END)

//EX3

@2
D=M
@1
D=M
(LOOP)
@END
D;JEQ
@1
D=D-M
D=D-1
0;JMP
@LOOP
(END)
@3
M=D

//EX4

@16544    // SCREEN + (5 * 32)
@SCREEN
(LOOP)
M=-1
D=-1      
@address
A=M
M=D   

@LOOP
0;JMP




