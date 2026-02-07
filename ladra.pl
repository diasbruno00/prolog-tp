
% Nome: Bruno Dias Pinto     | Matrícula: 18.2.8144

:- dynamic conectado/2.
:- dynamic tem_item/2.
:- dynamic local_tesouro/1.
:- dynamic itens_necessarios/1.
:- dynamic k_max/1.

:- use_module(library(lists)).

limpar_mapa :-
    retractall(conectado(_, _)),
    retractall(tem_item(_, _)),
    retractall(local_tesouro(_)),
    retractall(itens_necessarios(_)),
    retractall(k_max(_)).

carregar_exemplo :-
    limpar_mapa,
    assertz(conectado(cidade_a, cidade_b)),
    assertz(conectado(cidade_b, cidade_c)),
    assertz(conectado(cidade_c, cidade_d)),
    assertz(conectado(cidade_a, cidade_c)),
    assertz(tem_item(cidade_a, bussola)),
    assertz(tem_item(cidade_b, chave)),
    assertz(tem_item(cidade_c, mapa)),
    assertz(tem_item(cidade_d, lanterna)),
    assertz(itens_necessarios([chave, mapa])),
    assertz(local_tesouro(cidade_d)).

conexao_bidirecional(A, B) :- conectado(A, B).
conexao_bidirecional(A, B) :- conectado(B, A).

busca_alcancaveis([], V, V).
busca_alcancaveis([A|F], V, R) :-
    findall(X,
        (conexao_bidirecional(A, X), \+ member(X, V)),
        N),
    append(F, N, F2),
    append(V, N, V2),
    busca_alcancaveis(F2, V2, R).

todas_cidades_tem_item([]).
todas_cidades_tem_item([C|R]) :-
    tem_item(C, _),
    todas_cidades_tem_item(R).

itens_existentes(Itens) :-
    findall(I, tem_item(_, I), L),
    sort(L, Itens).

mapa_valido(Inicio) :-
    findall(C, (conectado(C,_); conectado(_,C)), L),
    sort(L, Cidades),
    length(Cidades, N),
    N >= 4,
    busca_alcancaveis([Inicio], [Inicio], Visitadas),
    sort(Visitadas, VisitadasOrd),
    length(VisitadasOrd, N),
    todas_cidades_tem_item(Cidades),
    local_tesouro(_),
    itens_necessarios(Nec),
    itens_existentes(ItensMapa),
    subset(Nec, ItensMapa).

acao(estado(A, I), mover(A, B), estado(B, I)) :-
    conexao_bidirecional(A, B),
    A \= B.

acao(estado(C, I), roubar(Item), estado(C, [Item|I])) :-
    tem_item(C, Item),
    \+ member(Item, I),
    k_max(K),
    length(I, N),
    N < K.

acao(estado(C, I), roubarTesouro, estado(C, [tesouro|I])) :-
    local_tesouro(C),
    itens_necessarios(Nec),
    subset(Nec, I).

buscar_plano(estado(_, I), _, []) :-
    member(tesouro, I).

buscar_plano(E, V, [A|P]) :-
    (   acao(E, roubarTesouro, E2), A = roubarTesouro
    ;   acao(E, roubar(Item), E2), A = roubar(Item)
    ;   acao(E, mover(X,Y), E2), A = mover(X,Y)
    ),
    \+ member(E2, V),
    buscar_plano(E2, [E2|V], P).

perguntar_k(K) :-
    write('Informe o valor de K (maximo de itens que podem ser roubados): '),
    read(K).

solve(Mapa, CidadeInicial, Plano) :-
    (Mapa = exemplo -> carregar_exemplo ; true),
    perguntar_k(K),
    retractall(k_max(_)),
    assertz(k_max(K)),
    mapa_valido(CidadeInicial),
    EstadoInicial = estado(CidadeInicial, []),
    buscar_plano(EstadoInicial, [EstadoInicial], Plano).
