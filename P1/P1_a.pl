%a. Write a predicate to compute the intersection of two sets

%(i,i) (o,i)
%member(E:Integer,L:List)
%member(elem,l1..ln)=false,l=[]
%                    true,elem=l1
%                    member(elem,l2..ln),otherwise
member(E,[E|_]).
member(E,[_|L]):-member(E,L).

%(i,i,o)
%intersection(L:List,T:List,R:List)
%intersection(a1..an,b1..bm)=[],a=[]
%                            a1Uintersection(a2..an,b1..bn),
%                            member(a1,b1..bn)=true
%                            intersection(a2..an,b1..bm),otherwise

intersection([],_,[]).
intersection([H|L],T,[H|R]):-member(H,T),
                        intersection(L,T,R).
intersection([_|L],T,R):-intersection(L,T,R).

test1(R):-intersection([1,2,3],[1,2,3,4],R),!.
test2(R):-intersection([],[],R).
test3(R):-intersection([1,2],[],R).
test4(R):-intersection([],[1],R).
test5(R):-intersection([1,3,4,5,6,7],[20,3,4,1,5],R).
