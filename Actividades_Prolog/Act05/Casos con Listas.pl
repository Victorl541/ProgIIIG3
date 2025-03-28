% --- Hechos familia Simpson usando listas --- 

esHombre([bart, homero, abraham, herbert, clancy]).

esMujer([marge, lisa, selma, patty, maggie, ling, mona, jacqueline]).


esPadre([padre(abraham, homero), padre(abraham, herbert), padre(clancy, selma), padre(clancy, patty), padre(clancy, marge),
    padre(homero, bart), padre(homero, lisa), padre(homero, maggie)
]).


esMadre([madre(marge, lisa), madre(marge, bart), madre(marge, maggie), madre(selma, ling), madre(jacqueline, patty), madre(jacqueline, selma), madre(jacqueline, marge),
    madre(mona, homero), madre(mona, herbert)
]).

