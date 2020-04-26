get_cifra(N,C):-C is  N mod 10.
five_degree(0,0):-!.
five_degree(1,1):-!.
five_degree(2,32):-!.
five_degree(3,243):-!.
five_degree(4,1024):-!.
five_degree(5,3125):-!.
five_degree(6,7776):-!.
five_degree(7,16807):-!.
five_degree(8,32768):-!.
five_degree(9,59049):-!.
sum_degrees(0,S,S):-!.
sum_degrees(N,S,H):-get_cifra(N,C),five_degree(C,D),S1 is H+D,N1 is N div 10,sum_degrees(N1,S,S1).

summa_chisel(N,Res,Chast):-(N=1;N=0),N1 is N+1,summa_chisel(N1,Res,Chast),!.
summa_chisel(500000,Res,Res):-!.
summa_chisel(N,Res,Chast):-sum_degrees(N,L,0),N=L,write("Такое число: "),write(L),nl, K1 is Chast+L,N1 is N+1,summa_chisel(N1,Res,K1),!.
summa_chisel(N,Res,Chast):-N1 is N+1,summa_chisel(N1,Res,Chast).

naiti_summu:-summa_chisel(0,X,0),write("Сумма таких чисел: "),write(X).
