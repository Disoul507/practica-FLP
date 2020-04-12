%���������� max
max(X,Y,X):-X>Y,!.
max(_,Y,Y).
%���������� max ��� 3-� ����������
max3(X,Y,U,Z):-max(X,U,K),max(Y,K,Z).
%���������
fact(0,1):-!.
fact(N,X):- N1 is N-1,fact(N1,X1),X is X1*N.
%������ �������
fact1(N,X):-fact2(0,1,N,X).
fact2(N,K,N,K):-!.
fact2(I,K,N,X):-I1 is I+1, K1 is K*I1, fact2(I1,K1,N,X).
%���������
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):- N1 is N-1,fib(N1,X1),N2 is N-2,fib(N2,X2),X is X1+X2.
%������ �������
fib1(N,X):-fib2(1,1,2,N,X).
fib2(_K,N,N,K):-!.
fib2(J,K,I,N,X):- I1 is I+1,K1 is K+J,fib2(K,K1,I1,N,X).
%�������� �� �������
pr(2):-!.
pr(X):-pr1(2,X).
pr1(X,X):-!.
pr1(I,X):-Y is X mod I,not(y=0),I1 is I+1,pr1(I1,X).
