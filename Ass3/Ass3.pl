% Question 1

trigger([], goals([],[])).

trigger([restaurant(X,Y,S)|Tail1], goals([goal(X,Y,S)|Tail2], Truffles)):-
		trigger(Tail1, goals(Tail2, Truffles)).

trigger([truffle(X,Y,S)|Tail1], goals(Restaurant, [goal(X,Y,S)|Tail2])):-
		trigger(Tail1, goals(Restaurant, Tail2)).

% Question 2

% This procedure should take three inputs, as follows:
% a set of Goals in the form goals(Goals_rest,Goals_truff)
% a set of Beliefs in the form beliefs(at(X,Y),stock(T))
% the current Intentions of the agent, in the form intents(Int_sell,Int_pick) where:
%           Int_sell, Int_pick are lists of intentions in the form [goal(X,Y,S), Plan]


% Base case there are no more goals to be incorperated.
incorporate_goals(goals([],[]),_,Intentions,Intentions):- !.

% Case where restaurant goal is already in Restaurants list
incorporate_goals(goals([goal(X,Y,S)|Goals_rest],Goals_truff), Beliefs, [Int_sell|Int_pick], Intentions1):-
	member(goal(X,Y,S),Int_sell),
	incorporate_goals(goals(Goals_rest,Goals_truff),Beliefs,[Int_sell|Int_pick],Intentions1).

% Case where restaurant goal is already in Restaurants list
incorporate_goals(goals(Goals_rest,[goals(X,Y,S)|Goals_truff]), Beliefs, [Int_sell|Int_pick], Intentions1):-
	member(goal(X,Y,S),Int_pick),
	incorporate_goals(goals(Goals_rest,Goals_truff),Beliefs, [Int_sell|Int_pick],Intentions1).

% Case where goal is not in lists
%incorporate_goals([goal(X,Y,S)|Tail], Beliefs, Intentions, Intentions1):-

incorporate_goals(goals([goal(3,4,5)],[]),[],intents([goal(3,4,5)],int_pick),newintentions).



% Question 3

%get_action(Beliefs, Intentions, Intentions1, Action)
