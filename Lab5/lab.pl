sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).

pr_ein2:-FriendHair=[_,_,_],

in_list(FriendHair,[belokurov,_]),
in_list(FriendHair,[rizhov,_]),
in_list(FriendHair,[chernov,_]),
in_list(FriendHair,[_,blond]),
in_list(FriendHair,[_,brunet]),
in_list(FriendHair,[_,red]),
not(in_list(FriendHair,[belokurov,blond])),
not(in_list(FriendHair,[belokurov,brunet])),
not(in_list(FriendHair,[rizhov,red])),
not(in_list(FriendHair,[chernov,brunet])),
write(FriendHair).

pr_ein3:- Outfit=[_,_,_],

in_list(Outfit,[anna,_,_]),
in_list(Outfit,[valya,_,_]),
in_list(Outfit,[natasha,_,_]),
in_list(Outfit,[_,white,_]),
in_list(Outfit,[_,green,_]),
in_list(Outfit,[_,blue,_]),
in_list(Outfit,[_,_,white]),
in_list(Outfit,[_,_,green]),
in_list(Outfit,[_,_,blue]),
(   in_list(Outfit,[anna,white,white]);
in_list(Outfit,[anna,green,green]);
in_list(Outfit,[anna,blue,blue])),
not(in_list(Outfit,[valya,white,_])),
not(in_list(Outfit,[valya,_,white])),
not(in_list(Outfit,[valya,white,white])),
    in_list(Outfit,[natasha,_,green]),
not(in_list(Outfit,[valya,green,green])),
not(in_list(Outfit,[valya,blue,blue])),
not(in_list(Outfit,[natasha,white,white])),
not(in_list(Outfit,[natasha,green,green])),
not(in_list(Outfit,[natasha,blue,blue])),
write(Outfit).

