%---hechos de las conexiones direccionales de cada grafo y el costo de sus aristas---

conectadoA(vancouver, edmonton, 16).
conectadoA(vancouver, calgary, 13).

conectadoA(edmonton, saskatoon, 12).

conectadoA(calgary, edmonton, 4).
conectadoA(calgary, regina, 14).

conectadoA(regina, saskatoon, 7).
conectadoA(regina, winnipeg, 4).

conectadoA(saskatoon, calgary, 9).
conectadoA(saskatoon, winnipeg, 4).


%---Regla para determinar si un nodo tiene o no tiene aristas---

tieneArista(X):-
    conectadoA(X, _, _).


%---Regla para determinar el costo de ir de X a F pasando por Y---

costoDeIrA(X, Z, Y, Costo):-
    conectadoA(X, Y, C1) , conectadoA(Y, Z, C2) , Costo is C1 + C2.

%---Regla para saber si hay un camino entre dos nodos---

caminoDe(X, Y):- conectadoA(X, Y,_).
caminoDe(X, Y):- conectadoA(X, Z,_) , caminoDe(Z, Y).  
