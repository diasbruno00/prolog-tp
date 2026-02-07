# Trabalho Prático: A Ladra e o Tesouro (CSI107)

Este projeto implementa um agente inteligente em Prolog capaz de navegar por um mapa de cidades, coletar itens obrigatórios e roubar um tesouro, respeitando um limite de carga ($K$).

## 👤 Identificação do Autor

*   **Nome:** Bruno Dias Pinto
*   **Matrícula:** 18.2.8144
*   **Disciplina:** CSI107 - Linguagens de Programação (UFOP)

---

## 🛠️ Requisitos e Instalação

O código foi desenvolvido para ser executado em ambiente **Unix/Linux** utilizando o interpretador **SWI-Prolog**.

### Pré-requisitos
*   SWI-Prolog instalado (`swipl`).

### Como Carregar
1. Abra o terminal na pasta onde o arquivo `trabalho.pl` está salvo.
2. Inicie o Prolog:
   ```bash
   swipl
3. Carregue o programa dentro do interpretador:

--------------------------------------------------------------------------------
🚀 Como Utilizar
A interação principal ocorre através do predicado solve/3.
Sintaxe
solve(Mapa, CidadeInicial, Plano).
• Mapa: Use o átomo exemplo para carregar o cenário de teste padrão ou custom para um mapa definido manualmente.
• CidadeInicial: O átomo representando a cidade de partida (ex: cidade_a).
• Plano: A variável que receberá a lista de ações (ex: P).
Passo a Passo (Exemplo de Execução)
1. Chame o predicado solve:
2. Informe o valor de K: O programa solicitará a capacidade máxima da ladra. Digite o número seguido de um ponto final.
3. Resultado: Se houver solução, o Prolog exibirá o plano de ações:

--------------------------------------------------------------------------------
🗺️ Criando Mapas Customizados
Para testar cenários próprios, você deve limpar a base de conhecimento e inserir os fatos dinâmicos manualmente antes de executar o solve.
Predicados Dinâmicos
• conectado(Origem, Destino).
• tem_item(Cidade, Item).
• local_tesouro(Cidade).
• itens_necessarios([Lista]).
Exemplo de Configuração Manual
No prompt do Prolog, digite:
?- limpar_mapa.
?- assertz(conectado(x, y)).
?- assertz(conectado(y, z)).
?- assertz(tem_item(y, ouro)).
?- assertz(local_tesouro(z)).
?- assertz(itens_necessarios([ouro])).
?- solve(custom, x, Plano).

--------------------------------------------------------------------------------
⚙️ Estrutura das Ações
O plano retornado consistirá em uma lista com as seguintes ações:
Ação
Descrição
mover(A, B)
Move a ladra da cidade A para a cidade B.
roubar(I)
Coleta o item I na cidade atual (se N<K).
roubarTesouro
Finaliza o jogo (se estiver na cidade do tesouro com os itens necessários).

--------------------------------------------------------------------------------
📝 Critérios Atendidos
• [x] Código compila e executa em Unix/Linux.
• [x] Identificação do autor no cabeçalho do código e na documentação.
• [x] Mapa validado (grafo conexo e acessível).
• [x] Interação via prompt com entrada de K pelo usuário.