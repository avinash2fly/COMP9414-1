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

log_table([],[]).
log_table([H|T], LogPairs) :-
	LogH is log(H),
	log_table(T,LogHList),
	LogPairs = [[H, LogH]|LogHList].


% Question 4 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% paruns([],[]):-!.
%% paruns([],_):-!.
%% paruns(List, RunList):-
%% 	even_list(List,EL,OL),
%% 	odd_list(OL,OL1,EL1),
%% 	paruns(EL1,RemList),
%% 	RunList = [EL,OL1|RemList].


%% paruns([H|T], RunList):-
%% 	find_even()



% Odd and Even Predicates
odd(Num) :- 
	1 is Num mod 2.
even(Num) :- 
	0 is Num mod 2.

prefix(_,[],[],[]).

prefix(0,[X|Xs],[],[X|Xs]). 

prefix(N,[X|Xs],[X|P],S):- 
  N > 0,                                     
  N1 is N-1,                                 
  prefix(N1,Xs,P,S). 

find_even([H|T],[H|R],Suffix):-
	even(H),
	find_even(T,R,Suffix).

find_even([H|T],[],[H|T]):-
	odd(H).

find_odd([H|T],[H|R],Suffix):-
	odd(H),
	find_odd(T,R,Suffix).

find_odd([H|T],[],[H|T]):-
	even(H).




	




