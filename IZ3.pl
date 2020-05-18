read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).

el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).

/*ѕолучить список номеров заданного элемента*/
getnum_list([],_,_,List,List):-!.
getnum_list([H|T],X,I,List,L):-H=X,append(L,[I],L1),I1 is I+1,getnum_list(T,X,I1,List,L1),!.
getnum_list([H|T],X,I,List,L):-I1 is I+1,getnum_list(T,X,I1,List,L).

/*ћаксимум в списке*/
max([H|T], M):-max(T, M, H).
max([], M, M):-!.
max([H|T], M, MI):-H > MI, !, max(T, M, H).
max([_|T], M, MI):-max(T,M, MI).

/*ѕолучить рассто€ние - количество различных элементов в спике*/
rasstoyanie([],[],N,N):-!.
rasstoyanie([A|T1],[B|T2],N,K):-not(A=B),K1 is K+1,rasstoyanie(T1,T2,N,K1),!.
rasstoyanie([A|T1],[B|T2],N,K):-rasstoyanie(T1,T2,N,K).

/*получить список пар с одинаковым рассто€нием дл€ одного элемента*/
get_pair(_,_,[],_,Pairs,Pairs):-!.
get_pair([H1|T1],K1,[H2|T2],K2,Pairs,L):-H1=H2,K2_0 is K2+1,append(L,[[K1,K2]],L1),get_pair([H1|T1],K1,T2,K2_0,Pairs,L1),!.
get_pair([H1|T1],K1,[H2|T2],K2,Pairs,L):-K2_0 is K2+1,get_pair([H1|T1],K1,T2,K2_0,Pairs,L),!.

/*получить список пар рассто€ний дл€ всех элементов*/
get_pair_num([],_,_,Pairs,Pairs):-!.
get_pair_num([H1|T1],K1,[H2|T2],Pairs,L):-K2 is K1+1,get_pair([H1|T1],K1,T2,K2,L1,[]),append(L,L1,L2),
										get_pair_num(T1,K2,T2,Pairs,L2),!.

/*получить список рассто€ний между элементами пары*/
sravnit([],_,Rasst,Rasst):-!.
sravnit([[H|K]|T],List,Rasst,L):-el_no(List,H,Str1),el_no(List,K,Str2),rasstoyanie(Str1,Str2,N,0),
								append(L,[N],L1),sravnit(T,List,Rasst,L1).

/*находим максимальное рассто€ние и список со всеми номерами этого рассто€ни€*/
get_max_rasst(Rasst,MaxRasst):-max(Rasst,Max),getnum_list(Rasst,Max,1,MaxRasst,[]).

get_max_pairs([],MaxPairs,_,MaxPairs):-!.
get_max_pairs([H|T],MaxPairs, Pairs, P):-el_no(Pairs,H,X),append(P,[X],P1),get_max_pairs(T,MaxPairs,Pairs,P1).













