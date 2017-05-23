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
%incorporate_goals(goals([],[]),_,Intentions,Intentions):- !.

% Case where restaurant goal is already in Restaurants list
%incorporate_goals(goals([goal(X,Y,S)|Goals_rest],Goals_truff), Beliefs, intents(Int_sell,Int_pick), Intentions1):-
%	member(goal(X,Y,S),Int_sell),
%	incorporate_goals(goals(Goals_rest,Goals_truff),Beliefs,intents(Int_sell,Int_pick),Intentions1).

% Case where restaurant goal is already in Restaurants list
%incorporate_goals(goals(Goals_rest,[goals(X,Y,S)|Goals_truff]), Beliefs, intents(Int_sell,Int_pick), Intentions1):-
	%member(goal(X,Y,S),Int_pick),
	%incorporate_goals(goals(Goals_rest,Goals_truff),Beliefs, intents(Int_sell,Int_pick),Intentions1).

% Case where restaurant goal is not in int_sell
%incorporate_goals(goals([goal(X,Y,S)|Goals_rest],Goals_truff), Beliefs, [Int_sell,Int_pick] Intentions1):-
	%insert_goal(goal(X,Y,S),Beliefs,Int_sell,AccumIntents),
	%incorporate_goals(goals(Goals_rest,Goals_truff), Beliefs, AccumIntents, Intentions).

% Base case where there are no goals in the intentions list
%insert_goal(goal(X,Y,S),_,[],[[goal(X,Y,S)],[]]):- !.
%
% Case where truffle goal is not in int_sell.
%incorporate_goals(goals(Goals_rest,[goals(X,Y,S)|Goals_truff]), Beliefs, [Int_sell|Int_pick], Intentions1):-

%insert_goal(goal(X,Y,S),Beliefs,[[goal(X1,Y1,S1),_],Intentions],New_Intentions):-





% Question 3

get_action(belief(at(X,Y),_),intents([],[]),intents([],[]),move(X,Y)):- !.


% Possible to sell to restaurant, plan already set
get_action(Belief, [Goal,Plan|Intentions1], [[Goal,Remaining_Actions]|[Intentions1]], Action):-
	can_sell(Belief,Goal),
	get_first_action(Plan, Action, Remaining_Actions).


% Return first move from plan list
get_first_action([Action|Remaining_Actions], Action, Remaining_Actions).

can_sell(belief(at(_,_),stock(T)),goal(_,_,S)):-
	S =< T.


% Possible to sell to restaurant, need to set plan
%get_action(belief(at(X,Y),stock(T)), intents([[goal(X1,Y1,S), [First_Action|Remaining_Actions]]|Remaining_Int_sell],Int_pick), Intentions1, Action):-
%	S =< T.




get_action(belief(at(2,3),stock(5)), intents([[goal(2,4,3), [3,4]]],[]),Intentions1,Action).
