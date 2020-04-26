r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,I,B):-I1 is I+1, read(X),append(B,[X],B1),r_list(A,N,I1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).
bubble:-read(N),r_list(A,N),bbubble(A,A1),w_list(A1).
bbubble(A1,A1):-sor(A1,A2),A1=A2,!.
bbubble(A,A1):-sor(A,SO),bbubble(SO,A1).
sor([H],[H]):-!.
sor([F,S|T], [S|T1]):- F>S,!,sor([F|T],T1).
sor([F,S|T],[F|T1]):-sor([S|T],T1).

