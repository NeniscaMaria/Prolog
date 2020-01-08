%a. Determine the successor of a number represented as digits in a list.
%Eg.: [1 9 3 5 9 9] --> [1 9 3 6 0 0]

%(i,i,o)
%appendA(Y:List,Z:List,W:List)
%append(l1..ln,a1..am):-a,l=[]
%                      -l1Uappend(l2..ln,a1..am),otherwise
appendA([],X,X).
appendA([X|Y],Z,[X|W]):-appendA(Y,Z,W).

%(i,o)
%reverseM(L:List,R:List)
%reverseM(l1..ln):-[],l=[]
%                -l1UreverseM(l2..ln),otherwise

reverse([],[]).
reverse([H|T],R):-reverse(T,[H|R]).

%(i,o)
%successor(L:List,R:List)
%successor(l1..ln):-reverse(successorWrapper(reverese(l1,,ln,1)))
successor([],[]).
successor(T,R):-reverse(T,T1),
               successorWrapper(T1,R1,1),
               reverse(R1,R2),
               R=R2.

%(i,o,i)
%successorWrapper(T:List,R:List,D:Integer)
%successorWrapper(l1..ln,d):-[l1+d],l=1 and l1+d<10
%                            append([1],[0]),l=1 and l1+d>=10
%                            (l1+d)UsuccessorWrapper(l2..ln,0),l1+d<10
%                            0UsucessorWrapper(l2..ln,1),l1+d>=10
successorWrapper([],R,_):-R=[].
successorWrapper(L,R,D):-length(L,Ln), Ln=:=1,
                            L=[H|T],
                            M is H+D, M>=10,
                            appendA([0],[1],R1),
                            successorWrapper(T,R2,D),
                            appendA(R2,R1,R3),
                            R=R3.
successorWrapper([H|T],R,D):-M is H+D,
                             M<10,
                             R=[M|R1],
                             successorWrapper(T,R1,0).
successorWrapper([H|T],R,D):-M is H+D,
                             M>=10,
                             R=[0|R1],
                             successorWrapper(T,R1,1).
successorWrapper([H|_],R,D):-M is H+D,M<10,R=[M].

%b. For a heterogeneous list, formed from integer numbers and list of numbers, determine the successor of a
%sublist considered as a number.
%[1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
%[1, [2, 4], 4, 5, [6, 8, 0], 10, 11, [1, 2, 1], 6]

%determineSuccessor(L:list,R:list)
%(i,o)
% determineSuccessor(l1..ln):-is_list(l1),
%                            successor(l1)UdetermineSuccessor(l2..ln)
%                            -otherwise,l1UdetermineSuccessor(l2..ln)
determineSuccessor([],[]).
determineSuccessor([H|T],R):-is_list(H),!,
                             successor(H,R1),
                             determineSuccessor(T,R2),
                             R=[R1|R2],
                             write('first'),write(R),write('\n').
determineSuccessor([H|T],R):-determineSuccessor(T,R1),
                             R=[H|R1],
                             write('second:'),write(R),write('\n').
%determineSuccessor([1,[2,3],4,5,[6,7,9],10,11,[1,2,0],6],R).
%determineSuccessor([1,[2,3],4,5,[6,7,9],10,11,[1,2,0],6,[9,9,9],34,33],R).
