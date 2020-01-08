%7. A player wants to choose the predictions for 4 games. The predictions can be 1, X, 2. Write a predicate
%to generate all possible variants considering that: last prediction can’t be 2 and no more than two
%possible predictions X

% candidate():-1
%             -2
%             -3 (which means x)
candidate(1).
candidate(3).
candidate(2).
%p=number of x's so far
%t=1 if the previous number is 2, 0 otherwise
% predict(length, c, p, t):-c, length = 4
%                     -predict(length+1, a+c, p+1,0),p!=2,a=candidate(),a=3
%                     -predict(length+1, a+c, p,1),t=0,a=candidate(),a=2
%                     -predict(length+1, a+c, p,0),a=candidate(),a=1

%predict(len:number,C:list, R:list, P:integer, PT: integer)
%(i,i,o,i,i)

predict(4,R,R,_,_):-!,write(R),write('\n').
predict(Len,C,R,P,_):-candidate(X),X=:=3,P\=2,
                   Len1 is Len+1,
                   P1 is P+1,
                   predict(Len1,[x|C],R,P1,0).

predict(Len,C,R,P,_):-candidate(X),X=:=2,
                   Len1 is Len+1,
%                   PT=:=0,
                   predict(Len1,[X|C],R,P,1).

predict(Len,C,R,P,_):-candidate(X),X=:=1,
                   Len1 is Len+1,
                   predict(Len1,[X|C],R,P,0).


% wrapper(R:list)
% (o)

wrapper(R):-predict(1,[1],R,0,0).
wrapper(R):-predict(1,[x],R,1,0).
%wrapper(R):-predict(1,[2],R,0,1).

% predictAll(R:list)
% (o)
predictAll(R) :- findall(R1, wrapper(R1), R).
