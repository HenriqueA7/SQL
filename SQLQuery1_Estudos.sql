CREATE DATABASE ESTUDOS_01

CREATE TABLE [ESTADOS]
([ID_ESTADO] [CHAR] (2) NOT NULL,
[NOME] [VARCHAR] (50) NOT NULL,
CONSTRAINT PK_ID_ESTADO
PRIMARY KEY CLUSTERED ([ID_ESTADO])
);

SELECT * FROM ESTADOS;

CREATE TABLE [CIDADES]
([ID_CIDADE] [CHAR] (2) NOT NULL,
[NOME] [VARCHAR] (100) NOT NULL,
[ESTADO] [CHAR] (2) NOT NULL,
CONSTRAINT PK_ID_CIDADE
PRIMARY KEY CLUSTERED ([ID_CIDADE])
);

ALTER TABLE [CIDADES]
DROP CONSTRAINT PK_ID_CIDADE

ALTER TABLE [CIDADES]
ALTER COLUMN [ID_CIDADE] [SMALLINT] NOT NULL;

ALTER TABLE [CIDADES]
ADD CONSTRAINT PK_ID_CIDADE PRIMARY KEY CLUSTERED ([ID_CIDADE])

SELECT * FROM CIDADES;

ALTER TABLE CIDADES
ADD CONSTRAINT FK_ID_ESTADO
FOREIGN KEY ([ESTADO]) REFERENCES ESTADOS([ID_ESTADO]);

INSERT INTO [ESTADOS]
( NOME, [ID_ESTADO])
VALUES
('Acre','AC'),
('Alagoas','AL'),
('Amap?','AP'),
('Amazonas','AM'),
('Bahia','BA'),
('Cear?', 'CE'),
('Esp?rito Santo','ES'),
('Goi?s','GO'),
('Maranh?o','MA'),
('Mato Grosso','MT'),
('Mato Grosso do Sul','MS'),
('Minas Gerais','MG'),
('Par?','PA'),
('Para?ba','PB'),
('Paran?','PR'),
('Pernambuco','PE'),
('Piau?','PI'),
('Rio de Janeiro','RJ'),
('Rio Grande do Norte','RN'),
('Rio Grande do Sul','RS'),
('Rond?nia','RO'),
('Roraima','RR'),
('Santa Catarina','SC'),
('S?o Paulo','SP'),
('Sergipe','SE'),
('Tocantins','TO'),
('Distrito Federal','DF');

INSERT INTO [CIDADES]
Values
(001, 'Acrel?ndia', 'AC'),
(002, 'Assis Brasil', 'AC'),
(003, 'Rio Branco','AC'),
(004, 'Macei?', 'AL'),
(005, 'Arapiraca','AL'),
(045, 'Curitiba', 'PR'),
(046, 'Londrina', 'PR'),
(047, 'Londrina', 'PR'),
(054, 'Angra dos Reis', 'RJ'),
(055, 'Niter?i', 'RJ'),
(056, 'Rio de Janeiro', 'RJ'),
(072, 'S?o Paulo', 'SP'),
(073, 'Guarulhos', 'SP'),
(074, 'S?o Jos? dos Campos', 'SP')

--TESTE FOREIGN KEY

--INSERT INTO [CIDADES]
--VALUES
--(075, 'Aracaju', 'xx')

--INSERT INTO [ESTADOS]
--VALUES
--('ZN', 'ZONA NORTE')

--DELETE FROM [ESTADOS] WHERE [ID_ESTADO] = 'ZN'

--EXIBE TODOS OS ESTADOS E CIDADES CORRESPONDENTES. QUANDO N?O H? CIDADE CADASTRADA, IMPRIME NULL
SELECT A.ID_ESTADO, B.NOME 
FROM ESTADOS A LEFT JOIN CIDADES B 
ON A.ID_ESTADO = B.ESTADO

--IGUAL O ANTERIOR, POR?M, QUANDO ? NULL IMPRIME NDA
SELECT A.ID_ESTADO,
CASE
	WHEN B.NOME IS NULL THEN'NDA'
	ELSE B.NOME
END
FROM ESTADOS A LEFT JOIN CIDADES B ON A.ID_ESTADO = B.ESTADO

--RETORNA QUANTIDADE DE CIDADES DE CADA ESTADO (APENAS CIDADES QUE T?M CIDADES CADASTRADAS)
SELECT ESTADO, COUNT(*) [CIDADES POR ESTADO] FROM CIDADES GROUP BY ESTADO


--RETORNA QUANTIDADE DE CIDADES DE CADA ESTADO 2
SELECT ESTADOS.ID_ESTADO, ISNULL (COUNT(CIDADES.NOME), 0) [CIDADES POR ESTADO]
FROM ESTADOS LEFT JOIN CIDADES 
ON ESTADOS.ID_ESTADO = CIDADES.ESTADO 
GROUP BY CIDADES.ESTADO, ESTADOS.ID_ESTADO

--RETORNA QUANTIDADE DE CIDADES DE CADA ESTADO 3
SELECT A.ID_ESTADO, COUNT(B.NOME) [CIDADES POR ESTADO]
FROM ESTADOS A LEFT JOIN CIDADES B 
ON A.ID_ESTADO = B.ESTADO 
GROUP BY B.ESTADO, A.ID_ESTADO

--RETORNA QUANTIDADE DE CIDADES DE CADA ESTADO 4 (APENAS ESTADOS COM 3 OU MAIS CIDADES CADASTRADAS)
SELECT A.ID_ESTADO, COUNT(B.NOME) [CIDADES POR ESTADO]
FROM ESTADOS A LEFT JOIN CIDADES B 
ON A.ID_ESTADO = B.ESTADO 
GROUP BY B.ESTADO, A.ID_ESTADO
HAVING COUNT (B.NOME) >=3

--RETORNA O MELHOR TIME DE CADA ESTADO
SELECT ID_ESTADO,
CASE
	WHEN ID_ESTADO = 'RJ' THEN 'MENG?O'
	WHEN ID_ESTADO = 'MG' THEN 'GALO'
	WHEN ID_ESTADO = 'SP' THEN '15 DE PIRACICABA'
	ELSE 'NENHUM'
END AS MELHORES_TIMES
FROM ESTADOS;

--RETORNA TODAS AS CIDADES QUE CONT?M: "S?O"
SELECT NOME, ESTADO
FROM CIDADES
WHERE NOME LIKE '%S?o%';