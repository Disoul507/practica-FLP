read_str(A):-get0(X),r_str(X,A,[]).

del_1st([H|T],T).

r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

write_str([]):-!.
write_str([H|T]):-write(H),write_str(T).
write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

get_graph_edges(V,E):-get_V(V),write(V),nl,write("Edges: "),nl,get_edges(V,E),write(E).

	get_V(V):-read(N),write("Vertexes: "),nl,N1 is N+1,get_V(V1,N1),del_1st(V1,V).
	get_V([],0):-!.
	get_V([H|T],N):-read_str(X),name(H,X),N1 is N-1,get_V(T,N1).

	get_edges(V,E):-read(M),get0(X),get_edges(V,E,[],M,0).
	get_edges(V,E,E,M,M):-!.
	get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),
								Count1 is Count+1,get_edges(V,E,E1,M,Count1).


in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).

get_edge(V,[V1,V2]):-write("Edge: "),read_str(X),name(V1,X),check_vertex(V,V1),
						read_str(Y),name(V2,Y),check_vertex(V,V2).
						
delete_all([],_,NewList,NewList):-!.
delete_all([El|T],El,NewList,L):-delete_all(T,El,NewList,L),!.
delete_all([H|T],El,NewList,L):-append(L,[H],L1),delete_all(T,El,NewList,L1).

get_cover(Vertexes,Edges,EdgeCover):-get_cover(Vertexes,Edges,Vertexes,[],EdgeCover,[]).
get_cover(Vertexes,_,[],UsedVertexes,EdgeCover,EdgeCover):-!.
get_cover(Vertexes,[[V1,V2]|T],UsingVertexes,UsedVertexes,EdgeCover,CurrentCover):-append(UsedVertexes,[V1],UV),append(UV,[V2],UV1),
					delete_all(UsingVertexes,V1,UsingV,[]),delete_all(UsingV,V2,UsingV1,[]),in_list(UsingVertexes,V1),in_list(UsingVertexes,V2),
					append(CurrentCover,[[V1,V2]],NewCover),
					get_cover(Vertexes,T,UsingV1,UV1,EdgeCover,NewCover),!.
get_cover(Vertexes,[[V1,V2]|T],UsingVertexes,UsedVertexes,EdgeCover,CurrentCover):-append(UsedVertexes,[V1],UV),append(UV,[V2],UV1),
					delete_all(UsingVertexes,V1,UsingV,[]),delete_all(UsingV,V2,UsingV1,[]),append(CurrentCover,[[V1,V2]],NewCover),
					get_cover(Vertexes,T,UsingV1,UV1,EdgeCover,NewCover).
					
cover:-get_graph_edges(V,E),get_cover(V,E,EdgeCover),write_list_str(EdgeCover).
