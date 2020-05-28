read_str(A):-get0(X),r_str(X,A,[]).

del_1st([H|T],T).

r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

write_str([]):-!.
write_str([H|T]):-write(H),write_str(T).
write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

get_graph_edges(V,E):-get_V(V),write(V),nl,write("Input number of edges: "),nl,get_edges(V,E),write(E).

	get_V(V):-write("Input number of vertexes: "),read(N),write("Vertexes: "),nl,N1 is N+1,get_V(V1,N1),del_1st(V1,V).
	get_V([],0):-!.
	get_V([H|T],N):-read_str(X),name(H,X),N1 is N-1,get_V(T,N1).

	get_edges(V,E):-read(M),get0(X),get_edges(V,E,[],M,0).
	get_edges(V,E,E,M,M):-!.
	get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),
								Count1 is Count+1,get_edges(V,E,E1,M,Count1).



check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).

get_edge(V,[V1,V2]):-write("Input edge: "),nl,read_str(X),name(V1,X),check_vertex(V,V1),
						read_str(Y),name(V2,Y),check_vertex(V,V2).
						
delete_el([],_,NewList,NewList):-!.
delete_el([El|T],El,NewList,L):-append(L,T,NewList),!.
delete_el([H|T],El,NewList,L):-append(L,[H],L1),delete_el(T,El,NewList,L1).

degree(_,[],Degree,Degree):-!.
degree(Vertex,[[Vertex,_]|T],Degree,D):-D1 is D+1,degree(Vertex,T,Degree,D1),!.
degree(Vertex,[[_,Vertex]|T],Degree,D):-D1 is D+1,degree(Vertex,T,Degree,D1),!.
degree(Vertex,[_|T],Degree,D):-degree(Vertex,T,Degree,D).

all_degrees([],_,Degrees,Degrees):-!.
all_degrees([V|T],Edges,Degrees,D):-degree(V,Edges,V_degree,0),append(D,[V_degree],D1),all_degrees(T,Edges,Degrees,D1).

min_in_list([H|T],Imin):-min_in_list(T,H,1,2,Imin).
min_in_list([],_,Cur,_,Cur):-!.
min_in_list([H|T],Min,Cur,Ind,Imin):-H<Min,Ind1 is Ind+1,min_in_list(T,H,Ind,Ind1,Imin),!.
min_in_list([_|T],Min,Cur,Ind,Imin):-Ind1 is Ind+1,min_in_list(T,Min,Cur,Ind1,Imin).

el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).

smezhnaya(V,[[V,V1]|_],V1):-!.
smezhnaya(V,[[V1,V]|_],V1):-!.
smezhnaya(V,[E|T],V1):-smezhnaya(V,T,V1).

neighbors(_,[],_,Neigh,Neigh):-!.
neighbors(V,[Vertex|T],Edges,Neigh,N):-smezhnaya(V,Edges,Vertex),append(N,[Vertex],N1),neighbors(V,T,Edges,Neigh,N1),!.
neighbors(V,[_|T],Edges,Neigh,N):-neighbors(V,T,Edges,Neigh,N).

get_cover(Vertexes,Edges,EdgeCover):-get_cover(Vertexes,Edges,Vertexes,EdgeCover,[]).
get_cover([],_,_,EdgeCover,EdgeCover):-!.
get_cover([V|T],Edges,Vertexes,EdgeCover,CurCover):-neighbors(V,Vertexes,Edges,Neigh,[]),
				all_degrees(Neigh,Edges,Degrees,[]),min_in_list(Degrees,Ind),el_no(Neigh,Ind,V1),append(CurCover,[[V,V1]],NewCover),
				delete_el(T,V1,UsingVertexes,[]),get_cover(UsingVertexes,Edges,Vertexes,EdgeCover,NewCover).	
					
cover:-get_graph_edges(V,E),get_cover(V,E,EdgeCover),write_list_str(EdgeCover).
