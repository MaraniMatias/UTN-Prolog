% Ejercicio 1
observa(maria,omar).
observa(laura,omar).
observa(maria,flavio).
observa(gabriela,flavio).
observa(maria,carlos).

/*
 observa(maria,flavio). True
 observa(maria,Quien). Quien toma el valor de lo primero que le gust a maria
 observa(maria,_). true, si hay algo que le guste a mria
 observa(Quien,flavio). Quien toma el valor que quien observa a flavio
 observa(Quien1,Quien2). muestra el primer hecho
 observa(_,_). true
*/

% Ejercicio 2
% Teniendo la siguiente base de hechos, definir una regla que permita determinar quienes hablan el idioma inglés y francés.

conoce(franco,ingles).
conoce(renzo,ingles).
conoce(franco,frances).
conoce(renzo,frances).
conoce(franco,italiano).
conoce(marco,ingles).
conoce(omar,ingles).
conoce(maria,frances).

habla_ingles_frances(X) :-
  conoce(X,ingles),
  conoce(X,frances),
  writeln('Es un genio :D').

% Ejercico 3
%
% Escribir un programa Prolog que responda consultas acerca de cuáles son los rivales de una determinada selección en un campeonato mundial.
% Una selección tiene como rivales todos los otros equipos de su mismo  grupo.

% Incluir en el programa la siguiente información:
% • El grupo 1 está formado por Brasil, España, Jamaica e Italia.
% • El grupo 2 está formado por Argentina, Nigeria, Holanda y Escocia.

grupo(1,brasil).
grupo(1,espania).
grupo(1,jamaica).
grupo(1,italia).

grupo(2,argentina).
grupo(2,nigeria).
grupo(2,holanda).
grupo(2,escocia).

rival(X,Y) :- X\=Y, grupo(G,X), grupo(G,Y).

% Ejercio 4
% Dados los siguientes predicados:
%
% a. Construya una base de hechos con los miembros de su familia.
% b. Defina las siguientes reglas: nieto, abuelo, tia
mujer(delfina).
mujer(gabi).
mujer(noemi).
mujer(romina).

mujer(mona).
mujer(lisa).
mujer(maggie).
mujer(patty).
mujer(selma).
mujer(ling).
mujer(jacqueline).
mujer(marge).

hombre(cesar).
hombre(cesarJuan).
hombre(matias).

hombre(clancy).
hombre(abrahan).
hombre(herbert).
hombre(bart).
hombre(homero).

padre(cesarJuan,cesar,delfina).
padre(gabi,cesar,delfina).
padre(matias,cesarJuan,noemi).
padre(romina,cesarJuan,noemi).

padre(homero,abrahan,mona).
padre(herbert,abrahan,mona).

padre(selma,clancy,jacqueline).
padre(patty,clancy,jacqueline).
padre(marge,clancy,jacqueline).

padre(bart,homero,marge).
padre(lisa,homero,marge).
padre(maggie,homero,marge).

padre(noSe,selma,ling).

hermanos(X,Y) :-
  padre(X,W,Z),
  padre(Y,W,Z),
  X\=Y.

hermana(X,Y) :-
  mujer(X),
  hermanos(X,Y),
  format('~w ~s ~s ~n', [X,'es hermana de',Y]).
hermano(X,Y) :-
  hombre(X),
  hermanos(X,Y),
  format('~w ~s ~s ~n', [X,'es hermano de',Y]).

tia(T,X) :-
  padre(X,P,_),
  hermana(T,P),
  X\=T,
  format('~w ~s ~s ~n', [T,'es tia de',X]).
tia(T,X) :-
  padre(X,_,M),
  hermana(T,M),
  X\=T,
  format('~w ~s ~s ~n', [T,'es tia de',X]).

abuelo(A,X) :-
  hombre(A),
  % Buscar los padres de X
  padre(X,_,Mx),
  % Buscar abuelo materno, padre de la madre de x
  padre(Mx,A,_),
  A\=X,
  format('~w ~s ~s ~n', [A,'es abuelo de',X]).
abuelo(A,X) :-
  hombre(A),
  % Buscar los padres de X
  padre(X,Px,_),
  % Buscar abuelo paterno, padre del padre de x
  padre(Px,A,_),
  A\=X,
  format('~w ~s ~s ~n', [A,'es abuelo de',X]).

abuela(A,X) :-
  mujer(A),
  % Buscar los padres de X
  padre(X,Px,_),
  % Buscar abuela paterna, madre del padre de x
  padre(Px,_,A),
  A\=X,
  format('~w ~s ~s ~n', [A,'es abuela de',X]).
abuela(A,X) :-
  mujer(A),
  % Buscar los padres de X
  padre(X,_,Mx),
  % Buscar abuela paterna, madre del padre de x
  padre(Mx,_,A),
  A\=X,
  format('~w ~s ~s ~n', [A,'es abuela de',X]).

nieto(N,A) :-
  hombre(N),
  abuelo_abuela(A,N),
  format('~w ~s ~s ~n', [N,'es nieto de',A]).
nieta(N,A) :-
  mujer(N),
  abuelo_abuela(A,N),
  format('~w ~s ~s ~n', [N,'es nieta de',A]).


% Ejercicio 5

% auto(patente,propietario)
auto(hti687,pedro).
auto(jug144,juan).
auto(gqm758,pedro).
auto(lod445,carlos).
auto(lfz569,miguel).
auto(axk798,maria).
% deuda(patente, monto adeudado)
deuda(lfz569,2000).
deuda(gqm758,15000).
deuda(axk798,1000).

tiene_deuda(X) :-
  auto(Patente,X),
  deuda(Patente,Deuda),
  format('~w ~s ~s ~s ~s ~n', [X,'tiene deuda con la patente',Patente,'por un valor de',Deuda]).

% Ejercicio 6
%
% El programa debe responder si en una ciudad (dato de entrada), se puede o  no formar una banda.

guitarrista(carolina).
guitarrista(jose).
guitarrista(miguel).

cantante(mariano).
cantante(silvia).
cantante(mauro).

baterista(eduardo).
baterista(diego).
baterista(laura).

vive_en(carolina,rosario).
vive_en(jose,rosario).
vive_en(mariano,rosario).
vive_en(laura,rosario).
vive_en(diego,casilda).
vive_en(miguel,funes).
vive_en(silvia,funes).
vive_en(mauro,funes).
vive_en(eduardo,roldan).

% banda son necesarios un guitarrista, un cantante y un baterista.
es_banda(X,Y,Z) :-
  guitarrista(X),
  cantante(Y),
  baterista(Z).
es_banda(X,Y,Z) :-
  guitarrista(X),
  cantante(Z),
  baterista(Y).

es_banda(X,Y,Z) :-
  guitarrista(Y),
  cantante(X),
  baterista(Z).
es_banda(X,Y,Z) :-
  guitarrista(Y),
  cantante(Z),
  baterista(X).

es_banda(X,Y,Z) :-
  guitarrista(Z),
  cantante(Y),
  baterista(X).
es_banda(X,Y,Z) :-
  guitarrista(Z),
  cantante(X),
  baterista(Y).

se_puede_formar_banda(Ciudad) :-
  es_banda(X,Y,Z),
  vive_en(X,Ciudad),
  vive_en(Y,Ciudad),
  vive_en(Z,Ciudad),
  format('en la ciudad de ~s se puede formar una banda con ~s, ~s y ~s ~n', [Ciudad,X,Y,Z]).

% Ejercicio 7
suma(X,Y) :-
  RTA is X + Y,
  format('Resultado ~w',[RTA]).

resta(X,Y) :-
  RTA is X - Y,
  format('Resultado ~w',[RTA]).

multiplicacion(X,Y) :-
  % RTA is X * Y,
  is(RTA, *(X,Y)),
  format('Resultado ~w',[RTA]).

division(X,Y) :-
  RTA is X / Y,
  format('Resultado ~w',[RTA]).

% Ejecicios 8
% horoscopo(Signo,DiaIni,MesIni,DiaFin,MesFin).
horoscopo(aries,21,3,20,4).
horoscopo(tauro,21,4,21,5).
horoscopo(geminis,22,5,21,6).
horoscopo(cancer,21,6,20,7).
horoscopo(leo,21,7,21,8).
horoscopo(virgo,22,8,22,9).
horoscopo(libra,23,9,22,10).
horoscopo(escorpio,23,10,22,11).
horoscopo(sagitario,23,11,20,12).
horoscopo(capricornio,21,12,19,1).
horoscopo(acuario,20,1,18,2).
horoscopo(piscis,19,2,20,3).

%  Ingresar un signo, día y mes y me informe si es correcto ese signo  para esa fecha.
% 15/03 -> 05/4 -> 13/06
valida_fecha_inicio(Dia,Mes,Signo) :-
  horoscopo(Signo,DiaIni,MesIni,_,_),
  MesIni == Mes,
  DiaIni =< Dia.
valida_fecha_fin(Dia,Mes,Signo) :-
  horoscopo(Signo,_,_,DiaFin,MesFin),
  MesIni < Mes,
  MesFin == Mes,
  DiaFin >= Dia.

signo(Dia,Mes,Signo) :-
  horoscopo(Signo,DiaIni,MesIni,DiaFin,MesFin),
  MesIni == Mes,
  DiaIni =< Dia,
  MesFin > Mes.

signo(Dia,Mes,Signo) :-
  horoscopo(Signo,DiaIni,MesIni,DiaFin,MesFin),
  MesFin == Mes,
  DiaFin >= Dia.

signo(Dia,Mes,Signo) :-
  valida_fecha_inicio(Dia,Mes,Signo),
  valida_fecha_fin(Dia,Mes,Signo).

signo(_,Mes,Signo) :-
  horoscopo(Signo,_,MesIni,_,MesFin),
  MesIni < Mes,
  MesFin > Mes.

validar_signo(Dia,Mes,Signo) :-
  signo(Dia,Mes,Signo),
  format('Signo pertenece al periodo').

% Ingresar una fecha (día y mes) y me informe de qué signo soy.
signo(Dia,Mes) :-
  signo(Dia,Mes,Signo),
  format('El signo es ~s ~w',[Signo]).
