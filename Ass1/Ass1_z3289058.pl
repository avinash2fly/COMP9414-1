% Daniel Farrugia
% z3289058
% Assignment_1

% Question 1
% Function to produce Weird sum
% The Squared sum of numbers greater then five
% minus the abs value of numbers less then two.
% The includes filter the orginal list based 
% upon the less then and greater then predicates.
% The square and absolute transformaitons are applied 
% via maplist. 
% Sumlist then produces the respective sums

weirdsum(Numbers,Weird) :-
	include(greater_than_five,Numbers,Gtf),
	include(less_then_two,Numbers,Ltt),
	maplist(sqr,Gtf,SqrGtf),
	maplist(abs,Ltt,AbsLtt),
	sumlist(SqrGtf,SmSqr),
	sumlist(AbsLtt,AbsSum),
	Weird is SmSqr - AbsSum.

greater_than_five(Number) :-
	Number >= 5.

less_then_two(Number) :-
	Number =< 2.

sqr(X,Y) :-
	Y is X * X.

% Question 2 ++++++++++++++++++++++++++++++++++++++++++++++++++++++

parent(jim, brian).
parent(brian, jenny).
parent(john,jimmy).
parent(jimmy,josh).
parent(pat, brian).
parent(jim,john).
parent(john, jan).
female(jan).
female(pat).
female(jenny).
male(jim).
male(brian).
male(jimmy).
male(josh).
male(john).

% Descendant : Person2 is descendant of Person1

male_descendant(Person1,Person2) :-
	male(Person1),
	parent(Person1,Person2),
	male(Person2).

male_descendant(Person1,Person2) :-
	male(Person1),
	parent(Person1,Child),
	male_descendant(Child,Person2).


same_name(Person1,Person2) :-
	male_descendant(Person1,Person2).

% Siblings

same_name(Person1,Person2) :-
	parent(Parent,Person1),
	male(Parent),
	parent(Parent,Person2),
	Person1 \= Person2. 

% Daughters

same_name(Person1, Person2) :-
	male(Person1),
	parent(Person1,Person2).

% Grandaughters

same_name(Person1,Person2) :-
	male_descendant(Person1,Descendant),
	parent(Descendant,Person2).
	
%Uncles and Nephews

same_name(Person1, Person2) :-
 	parent(Parent,Person1),
 	male(Parent),
 	parent(Parent, Sibling),
 	Sibling \= Person1,
 	male(Sibling),
 	parent(Sibling,Person2).

% Grand-Uncles and Nephews

 same_name(Person1, Person2) :-
 	parent(Parent,Person1),
 	male(Parent),
 	parent(Parent, Sibling),
 	Sibling \= Person1,
 	male_descendant(Sibling,Descendant),
 	parent(Descendant,Person2).
	

% Question 3 ++++++++++++++++++++++++++++++++++++++++++++++++++++++


log_table(NumberList, LogList) :-
	maplist(log,NumberList,Logs),
	maplist(pair,NumberList,Logs,LogList).

pair(L1,L2,[L1,L2]).
	

% Question 4 ++++++++++++++++++++++++++++++++++++++++++++++++++++++

% Find the even prefix and remaining suffix, followed by the odd prefix
% of the suffix. Pass remaining suffix back to function and append
% Even and Odd preffixes to list. Delete filters [] of edge cases i.e 
% there is no even or odd prefix returned
paruns([],[]).
paruns(List, RunList):-
 	find_even(List,EL,OL),
 	find_odd(OL,OL1,EL1),
 	paruns(EL1,RList),
 	RunListTemp = [EL,OL1|RList],
 	delete(RunListTemp,[],RunList).

% Odd and Even Predicates
odd(Num) :- 
	1 is Num mod 2.
even(Num) :- 
	0 is Num mod 2.

% Find the first even prefix of a list.
find_even([],[],[]). % Base Cases
find_even([],_,_).
% Stop recursion if odd found, return empty accumulator and suffix incl head.
find_even([H|T],[],[H|T]):-
	odd(H).
%  If head of list is even add to accumulator and recurse on tail
find_even([H|T],[H|R],Suffix):-
	even(H),
	find_even(T,R,Suffix).

% Same but for odd
find_odd([],[],[]).
find_odd([],_,_).
find_odd([H|T],[],[H|T]):-
	even(H).
find_odd([H|T],[H|R],Suffix):-
	odd(H),
	find_odd(T,R,Suffix).

% Question 5 ++++++++++++++++++++++++++++++++++++++++++++++++++++++

% First predicate called to recurse into tree.
is_hea(tree(LL,LastNode,RL)):-
	is_hea(LL, LastNode),
	is_hea(RL, LastNode).	
% Base Case
is_hea(empty).


% Second recursive predicate, called by is_hea/1 with 
% parent node of caller for equality check. 
is_hea(tree(LL,N,RL),LastNode):-
	N >= LastNode,
	is_hea(LL, N),
	is_hea(RL, N).
% Base Case i.e bottom of right and left nodes
is_hea(empty,_).
%Case when single tree
is_hea(t(_,X,_),X).




