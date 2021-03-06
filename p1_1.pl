gcd(A,A,A).
gcd(A,B,R):-B>A,M is B-A,gcd(A,M,R).
gcd(A,B,R):-A>B,M is A-B,gcd(M,B,R).

lcm(A,B,R):-gcd(A,B,R2),M is A*B,R is M/R2.

lowestCommonMultiple([],1).
lowestCommonMultiple([H|T],R):-lowestCommonMultiple(T,R1),
                               lcm(H,R1,R2),
                               R=R2.
insert(L,V,R):-insertW(V,0,0,L,R1),R=R1.
appendA([],X,X).
appendA([X|Y],Z,[X|W]):-appendA(Y,Z,W).

insertW(_,_,_,[],[]).
insertW(V,Power,Index,[H|T],R):-N is 2^Power,Index=:=N,write(N),
                            NP is Power+1, NI is Index+1,
                            insertW(V,NP,NI,T,R1),
                            NL=[H,V],
                            append(NL,R1,R2),R=R2,write(R).
insertW(V,Power,Index,[H|T],R):-NI is Index+1,insertW(V,Power,NI,T,R1),R=[H|R1],write(R).
