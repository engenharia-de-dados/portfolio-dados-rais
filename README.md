# Desafio de processamento de dados - CAGED e RAIS (Relação Anual de Informações Sociais)

## Proposito:
Este projeto tem como intuíto utilizar a base de dados sobre Demissões no Brasil como base para aprendizado em diferentes ferramentas e arquiteturas de processamento de dados.


A base de dados está disponível via um serviço FTP, ftp://ftp.mtps.gov.br/pdet/microdados/, disponibilizada pelo Ministerio do Trabalho, no [programa PDET (Programa de Disseminação das Estatisticas de Trabalho)](http://pdet.mte.gov.br/o-programa).


## Metodologia:

Para tal levantamos algumas perguntas inicias (analises), disponibilizamos um mapa dos dados disponibilizados pelo serviço FTP, e também sugestões de arquitetura de processamento de dados. 

Cada participante do desafio tem a liberdade de criar a arquitetura e processar os dados da maneira que lhe for mais interessante.

A cada encontro os participantes do desafio devem compartilhar o seu progresso e compatilhar 
histórias sobre o desenvolvimento até então.

Os encontros acontecerão no Discord nas terças às 19 horas do dia 26/07 até 30/08.

Espera-se que ao final do projeto cada participante tenha:
* Desenhado a arquitetura de aquisição e processamento de dados;
* Levantado a Infraestrutura proposta;
* Processado os dados e apresentado as visualizações criadas. 


## Abrindo mapeamentos:
Importar o arquivo `diagrams.xml` no site de diagramação https://app.diagrams.net/.  

* **Mapeamento de dados raw na base FTP:**
  * Aba FTP Diagram;
* **Ideias de arquiteturas a serem implementadas:** 
  * Aba "Architecture 1" para arquitetura mais tradicional de processamento de dados;
  * Aba "Architecture 2" para Mordern Data Stack.

## Perguntas iniciais:
Estas perguntas devem ajudar a guiar o desenvolvimento de visualizações ou reports de dados, e servem como exemplos. Porém o participante está livre para alterar/ampliar o escopo de analises

* Quais são os motivos de desligamento mais frequentes?
    * Há alguma diferença nos motivos ao decorrer dos anos?
    * Há alguma diferença nos motivos por estado?
    * Qual a demografia das pessoas que foram desligadas? 
    * Quais tipos de trabalho tiveram maior número de desligamento?
* Quais são os estados com maior renda média?
   * Existe alguma diferença salarial entre sexos?
   * Quais são as áreas com maior salário por estado?
 
* Qual a média de horas trabalhadas por tipo de carreira?
