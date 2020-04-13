%������� ������,������� ������
pr3_0:-read(N),write(N).
%���� � ����� ������
pr3_1:-read(N),r_list(A,N),w_list(A).
r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,I,B):-I1 is I+1, read(X),append(B,[X],B1),r_list(A,N,I1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).
% ����� ������
sum_list:-read(N),r_list(A,N),sum_l(A,Z),write(Z).
sum_l(A,Z):-s_l(A,Z,0).
s_l([],Z,Z):-!.
s_l([H|T],Z,S):-S1 is S+H,s_l(T,Z,S1).
%����� �������� �� ������
zacep:-read(N),r_list(A,N),read(I),zc(A,I,Z),write(Z).
zc(A,I,Z):-zc(A,I,1,Z).
zc([H|_],I,I,H):-!.
zc([_|T],I,K,Z):-K1 is K+1, zc(T,I,K1,Z).
%�������������� ������
p([],B,B):-!.
p([H|T],B,C):-append(B,[H],B1),p(T,B1,C).
%����������� ������� ������
min:-read(N), r_list(A,N),min_1(A,Z),write(Z).
min_1([H|T],Z):-minim(T,Z,H).
minim([],Z,Z):-!.
minim([H|T],Z,M):-(M<H),minim(T,Z,M),!.
minim([H|T],Z,_):-minim(T,Z,H).
%���������� true ���� ������� ���� � ������.
vozvr:-read(N),read(Z),r_list(A,N),vozvr1(A,Z).
vozvr1([H|_],H):-true,!.
vozvr1([],_):-false,!.
vozvr1([_|T],Z):-vozvr1(T,Z).
%�������� �������� �� ������
%delete:-read(N),r_list(A,N),read(I), del(A,I,Z),w_list(Z).
%del(A,I,Z):-del(A,I,1,Z).
%del([],_,_,[_]):-fail.
%del([_|[]],I,I,[_]):-!.
%del([_|T],I,I,[Z]):-append(Z,T),!.
%del([H|T],I,K,[Z]):-append(Z,[H],Z1),K1 is K+1,del(T,I,K1,Z1).
