%b. Write a predicate to create a list (m, ..., n) of all integer numbers from the interval [m, n].

%(i,i,o)
%intFromInterval(M:Int, N:Int, R:List)
%intFromInterval(m,n)=[n],m=n
%                     mUintFromInterval(m+1,n),m<n
%                     [],otherwise

intFromInterval(M,N,R):-M=:=N, R=[N].
intFromInterval(M,N,[M|R]):-M<N,M1 is M+1,intFromInterval(M1,N,R).
intFromInterval(_,_,[]).
