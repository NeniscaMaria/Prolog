%factorialM(A:integer,R:integer)
%(i,o)
%factorialM(a):-a!=0, a*factorialM(a-1)
%              -otherwise, 1
factorialM(0,1).
factorialM(A,R):-B is A-1, factorialM(B,R1), R is A*R1.

%substitute(L:list,R:list)
%(i,o)
%substitute(l1..ln)=substituteWrapper(l1..ln,0)
substitute(T,R):-substituteWrapper(T,1,R1),R=R1,
                 write("The result is: "),write(R).

%substituteWrapper(L:list,Index:Integer,R:list)
%(i,i,o)
%substituteWrapper(l1..ln,index):-l=[],[]
%                                -index%2!=0,factorial(l1)UsubstituteWrapper(l2..ln,index+1)
%                                -otherwise,l1Usubstitute(l2..ln,index+1)

substituteWrapper([],_,[]).
substituteWrapper([_|T],Index,R):-mod(Index,2)=\=0,factorialM(Index,Fact),
                                  NextIndex is Index+1,
                                  substituteWrapper(T,NextIndex,R1),
                                  R=[Fact|R1].
substituteWrapper([H|T],Index,R):-NextIndex is Index+1,
                                substituteWrapper(T,NextIndex,R1),
                                R=[H|R1].



%tests for the substitute function
test1(R):-substitute([],R1),R=R1.
test2(R):-substitute([2],R1),R=R1.
test3(R):-substitute([10,11,12,13,14,15,16,17,18,19,20],R1),R=R1.

%test for the factorial function
testF1(R):-factorialM(0,R1),R is R1.
testF2(R):-factorialM(1,R1),R is R1.
testF3(R):-factorialM(3,R1),R is R1.
