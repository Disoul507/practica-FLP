build_all_razm_p:-
		read_str(A,N),read(K),b_a_rp(A,K,[]).

b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-	in_list(A,El),N1 is N-1,
					b_a_rp(A,N1,[El|Perm]).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

build_all_perm:-
		read_str(A,N),b_a_p(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),
				b_a_p(A1,[El|Perm]).


build_all_razm:-
		read_str(A,N),read(K),b_a_r(A,[],K).

b_a_r(_,Perm1,0):-write_str(Perm1),nl,!,fail.
b_a_r(A,Perm,K):-in_list_exlude(A,El,A1),K1 is K-1,
				b_a_r(A1,[El|Perm],K1).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

pr_subset:-read_str(A,N),sub_set(B,A),write_str(B),nl,fail.

sub_set_k([],[],0).
sub_set_k([H|Sub_set],[H|Set],K):- K1 is K-1,sub_set_k(Sub_set,Set,K1).
sub_set_k(Sub_set,[H|Set],K):-sub_set_k(Sub_set,Set,K).
pr_subset_k:-read_str(A,N),read(K),sub_set_k(B,A,K),write_str(B),nl,fail.

append_K(X,0,A,A):-!.
append_K(X,K,A,A1):-K1 is K-1,append_K(X,K1,A,[X|A1]).

expand_list(A,N,K,A1):-expand_list(A,N,K,A1,[]).
expand_list([],0,_,A1,A1):-!.
expand_list([H|T],N,K,A1,B):-N1 is N-1,append_K(H,K,C,[]),append(B,C,B1),expand_list(T,N1,K,A1,B1).

sochet_pov:-read_str(A,N),read(K),expand_list(A,N,K,A1),sub_set_k(B,A1,K),write_str(B),nl,fail.

pr7_7:-List[_,_,_],
	(
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,black]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		((in_list(List,[dima,fantic,_]));(in_list(List,[_,dru,grey])))
	);
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))

	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))

	);
	(
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
	)
	),
	write(List).

