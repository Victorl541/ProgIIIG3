% --- Definición de relaciones de los Simpson usando estructuras y listas ---

personas([
    persona(bart, hombre),
    persona(homero, hombre),
    persona(abrajam, hombre),
    persona(herbert, hombre),
    persona(clancy, hombre),
    persona(marge, mujer),
    persona(lisa, mujer),
    persona(selma, mujer),
    persona(patty, mujer),
    persona(maggie, mujer),
    persona(ling, mujer),
    persona(mona, mujer),
    persona(jacqueline, mujer)
]).


relaciones([
    padre(abrajam, homero),
    padre(abrajam, herbert),
    padre(clancy, selma),
    padre(clancy, patty),
    padre(clancy, marge),
    padre(homero, bart),
    padre(homero, lisa),
    padre(homero, maggie),
    madre(marge, lisa),
    madre(marge, bart),
    madre(marge, maggie),
    madre(selma, ling),
    madre(jacqueline, patty),
    madre(jacqueline, selma),
    madre(jacqueline, marge),
    madre(mona, homero),
    madre(mona, herbert)
]).


% --- Reglas ---

esHombre(X) :- personas(Lista), member(persona(X, hombre), Lista).
esMujer(X) :- personas(Lista), member(persona(X, mujer), Lista).

esPadreDe(P, Hijo) :- relaciones(Lista), member(padre(P, Hijo), Lista).
esMadreDe(M, Hijo) :- relaciones(Lista), member(madre(M, Hijo), Lista).

abueloPaternoDe(X, Y) :- esHombre(X), esPadreDe(X, Z), esPadreDe(Z, Y).
abuelaPaternaDe(X, Y) :- esMujer(X), esMadreDe(X, Z), esPadreDe(Z, Y).

abueloMaternoDe(X, Y) :- esHombre(X), esPadreDe(X, Z), esMadreDe(Z, Y).
abuelaMaternaDe(X, Y) :- esMujer(X), esMadreDe(X, Z), esMadreDe(Z, Y).

esHermanoDe(X, Y) :- 
    esHombre(X), esPadreDe(P, X), esPadreDe(P, Y), esMadreDe(M, X), esMadreDe(M, Y), X \= Y.

esHermanaDe(X, Y) :- 
    esMujer(X), esPadreDe(P, X), esPadreDe(P, Y), esMadreDe(M, X), esMadreDe(M, Y), X \= Y.

esTioDe(X, Y) :- esHermanoDe(X, P), esPadreDe(P, Y).
esTioDe(X, Y) :- esHermanoDe(X, M), esMadreDe(M, Y).

esTiaDe(X, Y) :- esHermanaDe(X, P), esPadreDe(P, Y).
esTiaDe(X, Y) :- esHermanaDe(X, M), esMadreDe(M, Y).

sonPrimos(X, Y) :- 
    esPadreDe(P1, X), esPadreDe(P2, Y), esHermanoDe(P1, P2), X \= Y.
sonPrimos(X, Y) :- 
    esMadreDe(M1, X), esMadreDe(M2, Y), esHermanaDe(M1, M2), X \= Y.
sonPrimos(X, Y) :- 
    esPadreDe(P, X), esMadreDe(M, Y), esHermanoDe(P, M), X \= Y.
sonPrimos(X, Y) :- 
    esMadreDe(M, X), esPadreDe(P, Y), esHermanaDe(M, P), X \= Y.

esPrimoDe(X, Y) :- esHombre(X), sonPrimos(X, Y).
esPrimaDe(X, Y) :- esMujer(X), sonPrimos(X, Y).


