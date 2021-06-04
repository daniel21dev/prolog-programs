hombre(pedro).
hombre(enrique).
hombre(manuel).
hombre(gerardo).
hombre(francisco).
hombre(juan).
hombre(jose).
mujer(alicia).
mujer(luisa).
mujer(pilar).
mujer(maria).

padre(pedro, enrique).
padre(pedro, manuel).
padre(pedro, gerardo).
padre(enrique, francisco).
padre(enrique, juan).
padre(manuel, jose).
padre(manuel, luisa).
padre(gerardo, pilar).
padre(gerardo, maria).
madre(alicia, enrique).
madre(alicia, manuel).
madre(alicia, gerardo).

progenitor(X,Y) :- padre(X,Y).
progenitor(X,Y) :- madre(X,Y).
nino(X,Y):- progenitor(Y,X).
hijo(X,Y) :- nino(X,Y), hombre(X,Y).
hija(X,Y) :- nino(X,Y), mujer(X,Y).
hermanolna(X,Y) :- padre(P,X), padre(P,Y), madre(M,X), madre(M,Y), dif(X,Y).
hermano(X,Y) :- hermanolna(X,Y), hombre(X).
hermana(X,Y) :- hermanolna(X,Y), mujer(X).
abuelos(X,Y) :- progenitor(X,Z), progenitor(Z,Y).
abuelo(X,Y) :- abuelos(X,Y), hombre(X).
abuela(X,Y) :- abuelos(X,Y), mujer(X).
tioltia(X,Y) :- progenitor(Z,Y), hermanolna(X,Z).
tio(X,Y) :- tioltia(X,Y), hombre(X).
tia(X,Y) :- tioltia(X,Y), mujer(X).
primolma(X,Y) :- tioltia(Z,X), nino(Y,Z).
primo(X,Y) :- primolma(X,Y), hombre(X).
prima(X,Y) :- primolma(X,Y), mujer(X).