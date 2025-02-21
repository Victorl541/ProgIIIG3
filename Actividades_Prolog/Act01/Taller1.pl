esHombre(bart).
esHombre(homero).
esHombre(abrajam).
esHombre(herbert).
esHombre(clancy).

esMujer(marge).
esMujer(lisa).
esMujer(selma).
esMujer(patty).
esMujer(maggie).
esMujer(ling).
esMujer(mona).
esMujer(jacqueline).

esPadreDe(abrajam, homero).
esPadreDe(abrajam, herbert).
esPadreDe(clancy, selma).
esPadreDe(clancy, patty).
esPadreDe(clancy, marge).
esPadreDe(homero, bart).
esPadreDe(homero, lisa).
esPadreDe(homero, maggie).

esMadre(marge, lisa).
esMadre(marge, bart).
esMadre(marge, maggie).
esMadre(selma, ling).
esMadre(jacqueline, patty).
esMadre(jacqueline, selma).
esMadre(jacqueline, marge).
esMadre(mona, homero).
esMadre(mona, herbert).

esHijo(homero, mona).
esHijo(homero, abrajam).
esHijo(herbert, mona).
esHijo(herbert, abrajam).
esHijo(bart, homero).
esHijo(bart, marge).
esHijo(lisa, homero).
esHijo(lisa, marge).
esHijo(maggie, homero).
esHijo(maggie, marge).
esHijo(ling, selma).
esHijo(marge, jacqueline).
esHijo(marge, clancy).
esHijo(patty, jacqueline).
esHijo(patty, clancy).
esHijo(selma, clancy).
esHijo(selma, jacqueline).


abueloPaternoDe(X, Y):- 
    esHombre(X), esPadreDe(X, Z) , esPadreDe(Z, Y).
abuelaPaternaDe(X, Y):- 
    esMujer(X), esMadre(X, Z) , esPadreDe(Z, Y).

abuelaMaternaDe(X, Y):- 
    esMujer(X), esMadre(X, Z) , esMadre(Z, Y).
abueloMaternoDe(X, Y):- 
    esHombre(X), esPadreDe(X, Z) , esMadre(Z, Y).

sonHermanos(X, Y):-
    (esHijo(X, Z) , esHijo(X, W)) , (esHijo(Y, Z) , esHijo(Y, W)) , (X \= Y).
