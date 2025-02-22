%1)---Hechos para la definición de personas en los Simpson y sus relaciones familiares ---

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

% --- Reglas para las relaciones familiares ---


abueloPaternoDe(X, Y):- 
    esHombre(X), esPadreDe(X, Z) , esPadreDe(Z, Y).
abuelaPaternaDe(X, Y):- 
    esMujer(X), esMadre(X, Z) , esPadreDe(Z, Y).

abuelaMaternaDe(X, Y):- 
    esMujer(X), esMadre(X, Z) , esMadre(Z, Y).
abueloMaternoDe(X, Y):- 
    esHombre(X), esPadreDe(X, Z) , esMadre(Z, Y).

esHermanaDe(X, Y):-
    esMujer(X), esPadreDe(P, X) , esPadreDe(P, Y) , esMadre(M, X) , esMadre(M, Y) , X \= Y.
esHermanoDe(X, Y):-
    esHombre(X) , esPadreDe(P, X) , esPadreDe(P, Y) , esMadre(M, X) , esMadre(M, Y) , X \= Y.                                                                  

esTioDe(X, Y):-
    esHermanoDe(X, P) , esPadreDe(P, Y).
esTioDe(X, Y):-
    esHermanoDe(X, M) , esMadre(M, Y).

esTiaDe(X, Y):-
    esHermanaDe(X, P) , esPadreDe(P, Y).
esTiaDe(X, Y):-
    esHermanaDe(X, M) , esMadre(M, Y).
    
sonPrimos(X, Y):-
    esPadreDe(P1, X), esPadreDe(P2, Y), esHermanoDe(P1, P2), X \= Y.
sonPrimos(X, Y):-
    esMadre(M1, X), esMadre(M2, Y), esHermanaDe(M1, M2), X \= Y.

sonPrimos(X, Y):-
    esPadreDe(P, X), esMadre(M, Y), esHermanoDe(P, M), X \= Y.

sonPrimos(X, Y):-
    esMadre(M, X), esPadreDe(P, Y), esHermanaDe(M, P), X \= Y.  
    
esPrimaDe(X, Y):-
    esMujer(X), sonPrimos(X, Y).
esPrimoDe(X, Y):-
    esHombre(X), sonPrimos(X, Y).
    

%---------------------------------------------------------------------------------------------



%2) ---Hechos del enunciado entregados:

esHostil(coreaDelSur).
esEstadoUnidense(coronelWest).
vendioArmasA(coronelWest, coreaDelSur).

%---La regla sera la ley que se nos indica en el inicio del enunciado quien determinara veredicto
% por los hechos actuales---

esCriminal(X, Y):-
    esEstadoUnidense(X), vendioArmasA(X, Y), esHostil(Y).







    
