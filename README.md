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
1. Abra o terminal na pasta onde o arquivo `ladra.pl` está salvo.
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
Exemplo de Execução Completa
?- solve(exemplo, cidade_a, Plano).
Informe o valor de K (maximo de itens que podem ser roubados): 3.

Plano = [mover(cidade_a, cidade_b), roubar(chave), mover(cidade_b, cidade_c), roubar(mapa), mover(cidade_c, cidade_d), roubarTesouro]

--------------------------------------------------------------------------------
🗺️ Criando Mapas Customizados
Para testar cenários próprios, você deve limpar a base de conhecimento e inserir os fatos dinâmicos manualmente antes de executar o solve.
Predicados Dinâmicos
• conectado(Origem, Destino).
• tem_item(Cidade, Item).
• local_tesouro(Cidade).
• itens_necessarios([Lista]).
Exemplo de Configuração Manual
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
• [x] Suporte a mapas customizados via assertz/1.
• [x] Todas as ações implementadas: mover/2, roubar/1, roubarTesouro/0.
• [x] Validação completa do mapa (≥4 cidades, conectividade, itens disponíveis).
• [x] Documentação completa com exemplos práticos.