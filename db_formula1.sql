
CREATE DATABASE db_formula1;
USE db_formula1;

CREATE TABLE paises (
    codigo VARCHAR(3) PRIMARY KEY,
    nome   VARCHAR(100) NOT NULL
);

CREATE TABLE equipes (
    sigla    VARCHAR(10) PRIMARY KEY,
    nome     VARCHAR(100) NOT NULL,
    cod_pais VARCHAR(3) NOT NULL,
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo)
);

CREATE TABLE pilotos (
    numero       INT PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    cod_pais     VARCHAR(3) NOT NULL,
    sigla_equipe VARCHAR(10) NOT NULL,
    FOREIGN KEY (cod_pais)     REFERENCES paises(codigo),
    FOREIGN KEY (sigla_equipe) REFERENCES equipes(sigla)
);

CREATE TABLE corridas (
    sigla_gp   VARCHAR(10) PRIMARY KEY,
    nome_gp    VARCHAR(100) NOT NULL,
    cod_pais   VARCHAR(3) NOT NULL,
    qtd_voltas INT NOT NULL,
    FOREIGN KEY (cod_pais) REFERENCES paises(codigo)
);

CREATE TABLE participantes (
    sigla_gp        VARCHAR(10) NOT NULL,
    num_piloto      INT NOT NULL,
    posicao_largada INT,
    PRIMARY KEY (sigla_gp, num_piloto),
    FOREIGN KEY (sigla_gp)   REFERENCES corridas(sigla_gp),
    FOREIGN KEY (num_piloto) REFERENCES pilotos(numero)
);

-- 1. Insira no mínimo 5 pilotos do Brasil, 3 da Itália e 2 da França
INSERT INTO paises VALUES ('BRA', 'Brasil');
INSERT INTO paises VALUES ('ITA', 'Itália');
INSERT INTO paises VALUES ('FRA', 'França');
INSERT INTO paises VALUES ('GBR', 'Reino Unido');
INSERT INTO paises VALUES ('ALE', 'Alemanha');

-- 2. Popule todas as tabelas
INSERT INTO equipes VALUES ('RED', 'Red Bull Racing', 'ALE');
INSERT INTO equipes VALUES ('FER', 'Ferrari', 'ITA');
INSERT INTO equipes VALUES ('MER', 'Mercedes', 'ALE');
INSERT INTO equipes VALUES ('ALP', 'Alpine', 'FRA');
INSERT INTO equipes VALUES ('WIL', 'Williams', 'GBR');

INSERT INTO pilotos VALUES (1,  'Ayrton Senna',      'BRA', 'WIL');
INSERT INTO pilotos VALUES (2,  'Rubens Barrichello', 'BRA', 'FER');
INSERT INTO pilotos VALUES (3,  'Felipe Massa',       'BRA', 'FER');
INSERT INTO pilotos VALUES (4,  'Nelson Piquet',      'BRA', 'WIL');
INSERT INTO pilotos VALUES (5,  'Carlos Pace',        'BRA', 'WIL');
INSERT INTO pilotos VALUES (6,  'Michael Schumacher', 'ALE', 'FER');
INSERT INTO pilotos VALUES (7,  'Alberto Ascari',     'ITA', 'FER');
INSERT INTO pilotos VALUES (8,  'Nino Farina',        'ITA', 'FER');
INSERT INTO pilotos VALUES (9,  'Jarno Trulli',       'ITA', 'RED');
INSERT INTO pilotos VALUES (10, 'Alain Prost',        'FRA', 'MER');
INSERT INTO pilotos VALUES (11, 'Romain Grosjean',    'FRA', 'ALP');

INSERT INTO corridas VALUES ('MON', 'Grande Prêmio de Mônaco',    'FRA', 78);
INSERT INTO corridas VALUES ('ITA', 'Grande Prêmio da Itália',    'ITA', 53);
INSERT INTO corridas VALUES ('BRA', 'Grande Prêmio do Brasil',    'BRA', 71);
INSERT INTO corridas VALUES ('GBR', 'Grande Prêmio da Inglaterra','GBR', 52);
INSERT INTO corridas VALUES ('ALE', 'Grande Prêmio da Alemanha',  'ALE', 64);

INSERT INTO participantes VALUES ('MON', 1,  1);
INSERT INTO participantes VALUES ('MON', 6,  2);
INSERT INTO participantes VALUES ('MON', 10, 3);
INSERT INTO participantes VALUES ('ITA', 7,  1);
INSERT INTO participantes VALUES ('ITA', 8,  2);
INSERT INTO participantes VALUES ('BRA', 2,  1);
INSERT INTO participantes VALUES ('BRA', 3,  2);
INSERT INTO participantes VALUES ('GBR', 4,  1);
INSERT INTO participantes VALUES ('ALE', 9,  1);
INSERT INTO participantes VALUES ('ALE', 11, 2);

-- 3. Liste o nome dos países que começam com a letra B e terminam com a letra L
SELECT nome
FROM paises
WHERE nome LIKE 'B%L';

-- 4. Liste o nome dos pilotos que são dos países BRASIL, ITÁLIA e FRANÇA
SELECT pi.nome
FROM pilotos pi
JOIN paises pa ON pi.cod_pais = pa.codigo
WHERE pa.nome IN ('Brasil', 'Itália', 'França');

-- 5. Liste o nome dos pilotos
SELECT nome
FROM pilotos;

-- 6. Liste o nome dos gp e a quantidade de voltas (use ALIAS)
SELECT nome_gp AS "Nome do GP", qtd_voltas AS "Quantidade de Voltas"
FROM corridas;

-- 7. Liste o nome dos pilotos e seus países
SELECT pi.nome AS "Piloto", pa.nome AS "País"
FROM pilotos pi
JOIN paises pa ON pi.cod_pais = pa.codigo;

-- 8. Insira o atributo salário na tabela piloto
ALTER TABLE pilotos ADD COLUMN salario DECIMAL(10,2);

-- 9. Popule o atributo salário da tabela piloto
UPDATE pilotos SET salario = 95000.00  WHERE numero = 1;
UPDATE pilotos SET salario = 72000.00  WHERE numero = 2;
UPDATE pilotos SET salario = 68000.00  WHERE numero = 3;
UPDATE pilotos SET salario = 85000.00  WHERE numero = 4;
UPDATE pilotos SET salario = 73000.00  WHERE numero = 5;
UPDATE pilotos SET salario = 110000.00 WHERE numero = 6;
UPDATE pilotos SET salario = 60000.00  WHERE numero = 7;
UPDATE pilotos SET salario = 55000.00  WHERE numero = 8;
UPDATE pilotos SET salario = 78000.00  WHERE numero = 9;
UPDATE pilotos SET salario = 98000.00  WHERE numero = 10;
UPDATE pilotos SET salario = 65000.00  WHERE numero = 11;

-- 10. Liste o nome dos pilotos cujos salários sejam entre 70 e 100 mil
SELECT nome
FROM pilotos
WHERE salario BETWEEN 70000 AND 100000;

-- 11. Retorne para cada cod_pais, a média salarial dos empregados
SELECT cod_pais, AVG(salario) AS "Média Salarial"
FROM pilotos
GROUP BY cod_pais;

-- 12. Exiba todos os diferentes valores dos salários contidos na tabela pilotos ordenados em ordem crescente de valor
SELECT DISTINCT salario
FROM pilotos
ORDER BY salario ASC;


