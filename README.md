# Trabalho Prático: A Ladra e o Tesouro (CSI107)

Este projeto consiste na modelagem de um problema de inteligência artificial em **Prolog**, onde um agente (a ladra) deve navegar por um mapa de cidades, coletar itens necessários e roubar um tesouro, respeitando um limite máximo de itens carregados ($K$).

## 👤 Autor

*   **Nome:** Bruno Dias Pinto
*   **Matrícula:** 18.2.8144
*   **Disciplina:** CSI107 - Linguagens de Programação (UFOP)

## 📋 Descrição do Problema

O objetivo é encontrar um plano de ações para a ladra. O cenário possui as seguintes características:
*   O mapa contém cidades conectadas (mínimo de 4).
*   Cidades contêm itens e uma delas contém o tesouro.
*   Para roubar o tesouro, é necessário possuir um conjunto específico de itens.
*   A ladra possui um limite $K$ de capacidade de itens.
*   O mapa é validado para garantir que não existam cidades inacessíveis e que o grafo seja conexo.

## 🛠️ Requisitos e Execução

O código foi desenvolvido para ser executado em ambiente Unix/Linux utilizando um interpretador Prolog (como o SWI-Prolog).

### Como rodar
1. Abra o terminal na pasta do arquivo.
2. Inicie o interpretador Prolog:
   ```bash
   swipl
3. Carregue o arquivo do programa (supondo que o nome seja trabalho.pl):

🚀 Como Utilizar
A interação principal ocorre através do predicado solve/3.
Predicado Principal
solve(Mapa, CidadeInicial, Plano).
• Mapa: Pode ser o átomo exemplo (para carregar o mapa de teste embutido) ou outro identificador caso um mapa customizado já tenha sido carregado na base de fatos.
• CidadeInicial: O átomo representando a cidade onde a ladra começa (ex: cidade_a).
• Plano: A variável que receberá a lista de ações resultantes.
Fluxo de Execução
Ao executar o comando solve, o programa solicitará ao usuário o valor de K (capacidade máxima da ladra).
Exemplo de Uso (Cenário Padrão)
O código já inclui um cenário de exemplo (carregar_exemplo) com 4 cidades e itens (bússola, chave, mapa, lanterna).
No prompt do Prolog:
?- solve(exemplo, cidade_a, Plano).
O sistema irá perguntar:
Informe o valor de K (maximo de itens que podem ser roubados):
|: 3.
Se houver solução, o Plano retornará algo como:
Plano = [mover(cidade_a, cidade_b), roubar(chave), mover(cidade_b, cidade_c), roubar(mapa), ..., roubarTesouro]

🗺️ Definindo um Mapa Customizado
Para utilizar um mapa próprio, você deve limpar a base de conhecimento e inserir os fatos dinâmicos antes de chamar o solve. O formato deve seguir os predicados dinâmicos definidos:
• conectado(Origem, Destino).
• tem_item(Cidade, Item).
• local_tesouro(Cidade).
• itens_necessarios([ListaDeItens]).
Exemplo de carregamento manual:
?- limpar_mapa.
?- assertz(conectado(x, y)).
?- assertz(tem_item(x, chave)).
% ... inserir demais fatos ...
?- solve(custom, x, Plano).

⚙️ Estrutura das Ações
O plano gerado consistirá em uma lista contendo as seguintes ações:
• mover(A, B): Move da cidade A para B.
• roubar(I): Coleta o item I na cidade atual.
• roubarTesouro: Finaliza o jogo se a ladra tiver os itens necessários e estiver na cidade do tesouro.