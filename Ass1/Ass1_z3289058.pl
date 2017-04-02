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

% Question 2

parent(jim, brian).
parent(brian, jenny).
parent(john,jimmy).
parent(jimmy,josh).
parent(pat, brian).
parent(jim,john).
female(pat).
female(jenny).
male(jim).
male(brian).
male(jimmy).
male(josh).
male(john).

% Child : Person2 is child of Person1

same_name(Person1,Person2) :-
	male(Person1),
	parent(Person1,Person2).


same_name(Person1,Person2) :-
	male(Person1),
	parent(Person1, Child),
	same_name(Child,Person2).

same_name(Person1,Person2) :-
	Person1 = Person2.


%% GrandChild: Person2 is Grandchild of Person1
%
%same_name(Person1,Person2) :-
%	male(Person1),
%	parent(Person1,Child),
%	male(Child),
%	parent(Child, Person2).


% Child : Person1 is child of Person2

%same_name(Person1,Person2) :-
%	male(Person2),
%	parent(Person2,Person1).

% GrandChild: Person1 is Grandchild of Person2
%
%same_name(Person1,Person2) :-
%	male(Person2),
%	parent(Person2,Child),
%	male(Child),
%	parent(Child,Person1).

% Siblings

same_name(Person1,Person2) :-
	parent(Parent,Person1),
	male(Parent),
	parent(Parent,Person2),
	Person1 \= Person2. 

