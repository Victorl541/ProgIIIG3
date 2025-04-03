

personas([
    persona(bart, hombre, homero, marge),
    persona(homero, hombre, abrajam, mona),
    persona(abrajam, hombre, _, _),
    persona(herbert, hombre, abrajam, mona),
    persona(clancy, hombre, _, _),
    persona(marge, mujer, clancy, jacqueline),
    persona(lisa, mujer, homero, marge),
    persona(selma, mujer, clancy, jacqueline),
    persona(patty, mujer, clancy, jacqueline),
    persona(maggie, mujer, homero, marge),
    persona(ling, mujer, _, selma),
    persona(mona, mujer, _, _),
    persona(jacqueline, mujer, _, _) ]).

% ----- Reglas----

esHombre(X) :- personas(Lista), member(persona(X, hombre, _, _), Lista).
esMujer(X) :- personas(Lista), member(persona(X, mujer, _, _), Lista).

esPadreDe(P, Hijo) :- personas(Lista), member(persona(Hijo, _, P, _), Lista).
esMadreDe(M, Hijo) :- personas(Lista), member(persona(Hijo, _, _, M), Lista).

abueloPaternoDe(X, Y) :- esHombre(X), esPadreDe(X, Z), esPadreDe(Z, Y).
abuelaPaternaDe(X, Y) :- esMujer(X), esMadreDe(X, Z), esPadreDe(Z, Y).

abueloMaternoDe(X, Y) :- esHombre(X), esPadreDe(X, Z), esMadreDe(Z, Y).
abuelaMaternaDe(X, Y) :- esMujer(X), esMadreDe(X, Z), esMadreDe(Z, Y).
