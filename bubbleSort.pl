swap([A,B|List], [B,A|List]) :-
                        B<A.
swap([A,B|List],[B|List]):-A=:=B.
swap([A|List], [A|NewList]) :-
                       swap(List, NewList).

bubblesort(List, SortedList) :-
                      swap(List, NewList), !,
                      bubblesort(NewList, SortedList).
bubblesort(SortedList, SortedList).
