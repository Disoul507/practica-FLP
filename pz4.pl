%Задача3_2 Произведение своих простых делителей и меньше чем А
pr(2):-!.
pr(X):-pr1(2,X).
pr1(X,X):-!.
pr(I,X):-Y is X mod I, not(Y=0),I1 is I+1, pr1(I1,X).
p3_2(A,N):-p3_2(A,2,0,N).
p3_2(A,A,N,N):-!.
p3_2(A,I,K,N):-mult(I,PPD),I=PPD,!,K1 is K+1,I1 is I+1,p3_2(A,I1,K1,N).
p3_2(A,I,K,N):-I1 is i+1,p3_2(A,I1,K,N).

mult(I,PPD):-mult(I,2,1,PPD).
mult(I,K,PPD,PPD):-I1 is I+1, I1=K,!.
mult(I,K,P,PPD):- Y is I mod K, Y=0,pr(K),P1 is P*K,K1 is K+1, mult(I,K1,P1,PPD),!.
mult(I,K,P,PPD):-K1 is K+1, mult(I,K1,P,PPD).
%Задача1_1
nod(A,0,A):-!.
nod(_,0,_):-!,fail.
nod(A,B,C):-R is  A mod B, nod(B,R,C).
euler(A,N):-ehehe(A,2,1,N).
ehehe(A,A,N,N):-!.
ehehe(A,I,K,N):-nod(A,I,1),!,I1 is I+1, K1 is K+1, ehehe(A,I1,K1,N).
ehehe(A,I,K,N):-I1 is I+1, ehehe(A,I1,K,N).
% Построить предикат который лля заданного списка А ищет сумму элементов
% меньше 10
sum10(A,N):-sum10(A,0,N).
sum10([],N,N):-!.
sum10([H|T],K,N):-H<10,!, KI is H+K, sum10(T,K1,N).
sum10([_|T],K,N):-sum10(T,K,N).

