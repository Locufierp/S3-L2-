
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

    @SCREEN
    D=A       
    @addr     // Stocke cette adresse dans une variable 'addr'
    M=D

    @8192     // Nombre total de mots à modifier (512 * 256 / 16)
    D=A
    @n        // Stocke ce compteur dans 'n'
    M=D

(LOOP)
    @n
    D=M
    @END
    D;JEQ      // Si n == 0, on quitte la boucle

    @addr
    A=M       // Va à l'adresse mémoire pointée par 'addr'
    M=-1      // Rends les 16 pixels noirs (tous les bits à 1)

    @addr
    M=M+1     // Passe au mot mémoire suivant

    @n
    M=M-1     // Décrémente le compteur
    
    @LOOP
    0;JMP     // Recommence la boucle

(END)
    @END
    0;JMP 




