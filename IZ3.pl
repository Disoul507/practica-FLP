read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
r_l_s(List,List_len,C_l,C_l_l,Flag).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).
write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

/*элемент по номеру*/
el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).
/*список элементов по списку номеров*/
list_el_no(_,[],Res,Res):-!.
list_el_no(List,[Hi|Ti],Res,R):-el_no(List,Hi,X),append(R,[X],R1),list_el_no(List,Ti,Res,R1).

/*ћаксимум в списке*/
max([H|T], M):-max(T, M, H).
max([], M, M):-!.
max([H|T], M, MI):-H > MI, !, max(T, M, H).
max([_|T], M, MI):-max(T,M, MI).

/*ѕолучить список номеров заданного элемента*/
getnum_list([],_,_,List,List):-!.
getnum_list([H|T],X,I,List,L):-H=X,append(L,[I],L1),I1 is I+1,getnum_list(T,X,I1,List,L1),!.
getnum_list([H|T],X,I,List,L):-I1 is I+1,getnum_list(T,X,I1,List,L).

/*ѕолучить рассто€ние - количество различных элементов в спике*/
rasstoyanie([],[],N,N):-!.
rasstoyanie([A|T1],[B|T2],N,K):-not(A=B),K1 is K+1,rasstoyanie(T1,T2,N,K1),!.
rasstoyanie([A|T1],[B|T2],N,K):-rasstoyanie(T1,T2,N,K).

/*удалить элементы равные заданному*/
delete_el([],_,New,New):-!.
delete_el([H|T],H,New,L):-delete_el(T,H,New,L).
delete_el([H|T],El,New,L):-append(L,[H],L1),delete_el(T,El,New,L1).

equal([H|T]):-equal(H,T).
equal(El,[El|_]):-!.
equal(El,[H|T]):-equal(El,T).
/*получить список повтор€ющихс€ длин*/
repeating_el([],Rep,Rep):-!.
repeating_el([H|T],Rep,R):-equal([H|T]),append(R,[H],R1),delete_el(T,H,New,[]),repeating_el(New,Rep,R1).
repeating_el([H|T],Rep,R):-repeating_el(T,Rep,R).

/*получить список списков номеров строк с одинаковыми длинами*/
get_list_num(_,[],List_num,List_num):-!.
get_list_num(List_len,[H|T],List_num,P):-getnum_list(List_len,H,1,L,[]),append(P,[L],P1),get_list_num(List_len,T,List_num,P1).

/*получить пары элементов с одинаковыми длинами*/
pair_to_one([],_,Pair,Pair):-!.
pair_to_one([H|T],X,Pair,P):-append(P,[[H,X]],P1),pair_to_one(T,X,Pair,P1).

pair_to_all([],Pairs,Pairs):-!.
pair_to_all([H|T],Pairs,P):-pair_to_one(T,H,L,[]), append(P,L,P1),pair_to_all(T,Pairs,P1).

get_pairs([],Pairs,Pairs):-!.
get_pairs([H|T],Pairs,P):-pair_to_all(H,L,[]),append(P,L,P1),get_pairs(T,Pairs,P1).

/*получить список рассто€ний дл€ списка пар*/
get_list_rasst(Pairs,List,Rasst):-get_list_rasst(Pairs,List,Rasst,[]).
get_list_rasst([],_,Rasst,Rasst):-!.
get_list_rasst([[H1,H2]|T],List,Rasst,Ras):-el_no(List,H1,Str1),el_no(List,H2,Str2),rasstoyanie(Str1,Str2,N,0),append(Ras,[N],Ras1),get_list_rasst(T,List,Rasst,Ras1).

/*получить строки из списка с парами номеров*/
get_string(_,[],Strings,Strings):-!.
get_string(List,[H|T],Strings,L):-list_el_no(List,H,P,[]),append(L,P,L1),get_string(List,T,Strings,L1).

stroki:- see('D:/STROKI.txt'),read_list_str(List,List_len),seen,repeating_el(List_len,Repeat_len,[]),get_list_num(List_len,Repeat_len,List_num,[]),
get_pairs(List_num,Pairs,[]),get_list_rasst(Pairs,List,Rasst),max(Rasst,Max),getnum_list(Rasst,Max,1,Max_list,[]),list_el_no(Pairs,Max_list,RESULT,[]),
get_string(List,RESULT,Strings,[]),tell('D:/Stroki-2.txt'),write_list_str(Strings),told.
