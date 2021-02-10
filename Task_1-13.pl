man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(pasha).
man(kondrat).
man(timofei).
man(samuil).
man(dmitry).
man(oleg).
man(nikita).
man(sava).
man(igor).
man(ivan).


woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).
woman(elena).
woman(maria).
woman(sveta).
woman(inna).
woman(anna).
woman(kate).
woman(natalia).
woman(anastasia).
woman(angela).
woman(kristina).
woman(daria).
woman(slava).
woman(luda).
woman(lidia).


parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).
parent(kondrat,voeneg).
parent(maria,voeneg).


parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(timofei,goluba).
parent(sveta,goluba).


parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).
parent(semen,lubomila).
parent(inna,lubomila).
parent(anna,ratibor).


parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).
parent(dmitry,boguslav).
parent(kate,boguslav).
parent(natalia,bratislava).


parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).
parent(oleg,velerad).
parent(anastasia,velerad).
parent(pasha,veslava).
parent(angela,veslava).


parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).
parent(nikita,duhovlad).
parent(kristina,duhovlad).
parent(elena,zhdana).
parent(elena,ivan).
parent(elena,igor).
parent(elena,luda).
parent(elena,lidia).

men(X):-man(X),write(X),nl,fail.
women(X):-woman(X),write(X),nl,fail.

children(X,Y):-parent(Y,X).
allChildren(Y):-parent(Y,X),write(X),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

son(X,Y):-parent(Y,X),man(X),!.
son(X):-son(Y,X),write(Y),nl,fail.

brother(X,Y):-parent(Z,X),parent(Z,Y),man(X),woman(Z),not(X=Y).
brothers(X):-brother(Y,X),man(Y),write(Y),nl,fail.

sister(X,Y):-parent(Z,X),parent(Z,Y),woman(X),!.
sisters(X):-parent(Z,X),parent(Z,Y),woman(Y),woman(Z),not(Y=X),write(Y),nl,fail.

b_s(X,Y):-parent(Z,X),parent(Z,Y),not(X=Y).
b_s(X):-b_s(Y,X),write(Y),nl,fail.

grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X).
grand_pas(X):-grand_pa(Y,X),write(Y),nl,fail.

daughter(X,Y):-parent(Y,X),woman(X),!.
grand_so(X,Y):-son(X,Z),(son(Z,Y);daughter(Z,Y)),man(X),!.
grand_sons(X):-parent(X,Z),parent(Z,Y),man(Y),write(Y),nl,fail.

grand_pa_and_son(X,Y):-(grand_pa(X,Y),!,man(X));grand_so(X,Y),man(Y).

grand_da(X,Y):-daughter(X,Z),(son(Z,Y);daughter(Z,Y)),woman(X),!.
grand_pa_and_da(X,Y):-(grand_pa(X,Y),woman(Y),!);grand_da(X,Y),man(Y).

uncle(X,Y):-brother(X,Z),mother(Z,Y);brother(X,Z),father(Z,Y).
uncle(X):-uncle(Y,X),write(Y),nl,fail.

aunt(X,Y):-sister(X,Z),mother(Z,Y);sister(X,Z),father(Z,Y).
aunt(X):-aunt(Y,X),write(Y),nl,fail.

