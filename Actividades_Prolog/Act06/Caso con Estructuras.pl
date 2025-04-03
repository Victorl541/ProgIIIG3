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
