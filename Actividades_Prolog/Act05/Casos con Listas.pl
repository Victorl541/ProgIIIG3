% --- Hechos familia Simpson usando listas --- 

esHombre([bart, homero, abraham, herbert, clancy]).

esMujer([marge, lisa, selma, patty, maggie, ling, mona, jacqueline]).


esPadre([padre(abraham, homero), padre(abraham, herbert), padre(clancy, selma), padre(clancy, patty), padre(clancy, marge),
    padre(homero, bart), padre(homero, lisa), padre(homero, maggie)
]).


esMadre([madre(marge, lisa), madre(marge, bart), madre(marge, maggie), madre(selma, ling), madre(jacqueline, patty), madre(jacqueline, selma), madre(jacqueline, marge),
    madre(mona, homero), madre(mona, herbert)
]).


% --- Reglas --- 


esPadreDe(P, Hijo) :- esPadre(Lista), member(padre(P, Hijo), Lista).
esMadre(M, Hijo) :- esMadre(Lista), member(madre(M, Hijo), Lista).


abueloPaternoDe(X, Y) :- 
    esHombre(Hombres), member(X, Hombres),
    esPadreDe(X, Z), esPadreDe(Z, Y).


abuelaPaternaDe(X, Y) :- 
    esMujer(Mujeres), member(X, Mujeres),
    esMadre(X, Z), esPadreDe(Z, Y).


abueloMaternoDe(X, Y) :- 
    esHombre(Hombres), member(X, Hombres),
    esPadreDe(X, Z), esMadre(Z, Y).


abuelaMaternaDe(X, Y) :- 
    esMujer(Mujeres), member(X, Mujeres),
    esMadre(X, Z), esMadre(Z, Y).



    
