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
