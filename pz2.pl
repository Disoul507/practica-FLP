%нахождение max
max(X,Y,X):-X>Y,!.
max(_,Y,Y).
%нахождение max при 3-х переменных
max3(X,Y,U,Z):-max(X,U,K),max(Y,K,Z).
%Факториал
fact(0,1):-!.
fact(N,X):- N1 is N-1,fact(N1,X1),X is X1*N.
%Второй вариант
fact1(N,X):-fact2(0,1,N,X).
fact2(N,K,N,K):-!.
fact2(I,K,N,X):-I1 is I+1, K1 is K*I1, fact2(I1,K1,N,X).
%фибоначчи
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):- N1 is N-1,fib(N1,X1),N2 is N-2,fib(N2,X2),X is X1+X2.
%Второй вариант
fib1(N,X):-fib2(1,1,2,N,X).
fib2(_,K,N,N,K):-!.
fib2(J,K,I,N,X):- I1 is I+1,K1 is K+J,fib2(K,K1,I1,N,X).
%Проверка на пустоту
pr(2):-!.
pr(X):-pr1(2,X).
pr1(X,X):-!.
pr1(I,X):-Y is X mod I,not(Y=0),I1 is I+1,pr1(I1,X).
%Наиб.простой делитель
npr_d(N,X):-npd(N,N,X).
npd(I,N,I):-Y is N mod I, Y=0,pr(I).
npd(I,N,X):-I1 is I-1, npd(I1,N,X).
%Сумма цифр числа
sum(C,X):-sum1(0,C,X).
sum1(X,0,X):-!.
sum1(S,C,X):-M is C mod 10,S1 is S+M,C1 is C div 10,sum1(S1,C1,X).

