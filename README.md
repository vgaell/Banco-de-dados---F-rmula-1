Aqui está a descrição sem nenhuma formatação:

---

Banco de Dados Relacional — Fórmula 1

Este projeto consiste na modelagem e implementação de um banco de dados relacional desenvolvido no MySQL Workbench, com o tema de gerenciamento de dados da Fórmula 1.

---

Estrutura do Banco de Dados

O banco é composto por 5 tabelas interligadas por relacionamentos via chaves primárias e estrangeiras:

"paises" — armazena os países participantes, com um código de identificação único e o nome do país.

"equipes" — armazena as equipes da Fórmula 1, identificadas por uma sigla, com nome e vínculo ao país de origem através de uma chave estrangeira referenciando a tabela "paises".

"pilotos" — armazena os pilotos, identificados por um número, contendo nome, país de origem e equipe à qual pertencem, ambos referenciados via chaves estrangeiras nas tabelas "paises" e "equipes".

"corridas" — armazena os Grandes Prêmios, identificados por uma sigla, com nome completo, país onde ocorrem e quantidade de voltas, referenciando a tabela "paises" via chave estrangeira.

"participantes" — tabela associativa que registra a relação entre pilotos e corridas, armazenando a posição de largada. Possui chave primária composta pelas colunas "sigla_gp" e "num_piloto", referenciando as tabelas "corridas" e "pilotos".

---

Povoamento do Banco

O banco foi populado com dados representativos da Fórmula 1:

5 países cadastrados: Brasil, Itália, França, Reino Unido e Alemanha
5 equipes cadastradas: Red Bull Racing, Ferrari, Mercedes, Alpine e Williams
11 pilotos cadastrados, sendo 5 brasileiros, 3 italianos e 2 franceses, além de 1 alemão
5 corridas cadastradas representando Grandes Prêmios históricos
10 registros de participações vinculando pilotos às corridas com suas posições de largada

---

Alteração de Estrutura

Após a criação e população inicial do banco, a tabela "pilotos" foi alterada com o comando ALTER TABLE para receber uma nova coluna chamada "salario", do tipo DECIMAL(10,2), permitindo armazenar valores monetários com precisão de duas casas decimais. Em seguida, os salários de todos os pilotos foram individualmente atualizados via UPDATE, com valores variando entre 55 mil e 110 mil.

---

Consultas SQL Realizadas

Foram desenvolvidas 10 consultas cobrindo diferentes recursos da linguagem SQL:

Filtro com LIKE — busca de países cujo nome começa com a letra B e termina com a letra L, utilizando o operador LIKE com o curinga %.

Filtro com IN e JOIN — listagem dos pilotos pertencentes ao Brasil, Itália e França, unindo as tabelas "pilotos" e "paises" através de JOIN e filtrando com o operador IN.

Listagem simples — exibição de todos os nomes de pilotos cadastrados sem nenhum filtro aplicado.

Uso de ALIAS — exibição dos Grandes Prêmios e suas quantidades de voltas, utilizando AS para renomear as colunas na saída da consulta, tornando-a mais legível.

JOIN entre tabelas — listagem dos pilotos junto ao nome de seus respectivos países, unindo as tabelas "pilotos" e "paises" pelo código do país.

Filtro com BETWEEN — listagem dos pilotos cujos salários estão dentro do intervalo entre 70 mil e 100 mil, utilizando o operador BETWEEN que considera os valores extremos como inclusivos.

Agrupamento com AVG e GROUP BY — cálculo da média salarial dos pilotos agrupados por país, utilizando a função de agregação AVG combinada com GROUP BY, retornando uma média por código de país.

Valores distintos com ORDER BY — exibição de todos os valores de salários sem repetição, utilizando DISTINCT para eliminar duplicatas e ORDER BY ASC para ordenar do menor para o maior valor.

---

Conceitos Aplicados

Criação de tabelas com CREATE TABLE
Definição de chaves primárias simples e compostas
Definição de chaves estrangeiras com FOREIGN KEY e REFERENCES
Inserção de dados com INSERT INTO
Alteração de estrutura com ALTER TABLE
Atualização de dados com UPDATE
Consultas com SELECT, WHERE, JOIN, GROUP BY, ORDER BY
Operadores LIKE, IN, BETWEEN, DISTINCT
Funções de agregação com AVG
Uso de apelidos com AS
