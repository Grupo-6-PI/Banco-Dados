
DROP DATABASE IF EXISTS TFG;

CREATE DATABASE IF NOT EXISTS TFG;
	
USE TFG;
    
CREATE TABLE IF NOT EXISTS estado(
	id BIGINT PRIMARY KEY AUTO_INCREMENT ,
    nome VARCHAR(100),
    uf CHAR(2)
);    
    
CREATE TABLE IF NOT EXISTS cidade (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NULL,
  estado_id BIGINT,
  CONSTRAINT cidade_estado FOREIGN KEY (estado_id) REFERENCES estado(id)
);

CREATE TABLE IF NOT EXISTS bairro (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NULL,
  cidade_id BIGINT,
  CONSTRAINT bairro_cidade FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

CREATE TABLE IF NOT EXISTS tipo_situacao (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS situacao (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  situacao VARCHAR(100) NULL,
  tipo_situacao_id BIGINT,
	CONSTRAINT situacao_tipo_situacao FOREIGN KEY (tipo_situacao_id) REFERENCES tipo_situacao(id)
);

CREATE TABLE IF NOT EXISTS endereco (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  logradouro VARCHAR(100) NULL,
  numero INT NULL,
  cep CHAR(15) NULL,
  bairro_id BIGINT,
	CONSTRAINT endereco_bairro FOREIGN KEY (bairro_id) REFERENCES bairro(id),
  situacao_id BIGINT,
	CONSTRAINT endereco_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id)
);

CREATE TABLE IF NOT EXISTS renda_familiar (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  renda DOUBLE,
  situacao_id BIGINT,
	CONSTRAINT renda_familiar_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id)
);

CREATE TABLE IF NOT EXISTS familia (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  apelido VARCHAR(100),
  quantidade_pessoas INT,
  renda_familiar_id BIGINT,
  	CONSTRAINT familia_renda_familiar FOREIGN KEY(renda_familiar_id) REFERENCES renda_familiar(id),
  situacao_id BIGINT,
  	CONSTRAINT familia_situacao FOREIGN KEY(situacao_id) REFERENCES situacao(id),
  data_criacao DATETIME,
  data_ultima_atualizacao DATETIME,
  email_modificador VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS tipo_identificador (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(50),
  situacao_id BIGINT,
	CONSTRAINT tipo_identificador_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id)
);

CREATE TABLE IF NOT EXISTS identificador (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  numeracao VARCHAR(40) NULL,
  tipo_identificador_id BIGINT,
	CONSTRAINT identificador_tipo_identificador FOREIGN KEY (tipo_identificador_id) REFERENCES tipo_identificador(id),
  situacao_id BIGINT,
  	CONSTRAINT identificador_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id)
);

CREATE TABLE IF NOT EXISTS informacoes_adicionais (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  cpf CHAR(15) NULL,
  data_nascimento DATE NULL,
  endereco_id BIGINT,
	CONSTRAINT informacoes_adicionais_endereco FOREIGN KEY (endereco_id) REFERENCES endereco(id),
  familia_id BIGINT,
	CONSTRAINT informacoes_adicionais_familia FOREIGN KEY (familia_id) REFERENCES familia(id),
  identificador_id BIGINT,
	CONSTRAINT informacoes_adicionais_identificador FOREIGN KEY (identificador_id) REFERENCES identificador(id),
  situacao_id BIGINT,
	CONSTRAINT informacoes_adicionais_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id),
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL
);

CREATE TABLE IF NOT EXISTS tipo_contato (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  tipo_contato VARCHAR(30) NULL,
  situacao_id BIGINT,
	CONSTRAINT tipo_contato_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id)
);

CREATE TABLE IF NOT EXISTS contato (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  informacoes_contato VARCHAR(150),
  data_criacao DATETIME,
  data_ultima_atualizacao DATETIME,
  email_modificador VARCHAR(150) NULL,
  tipo_contato_id BIGINT,
	CONSTRAINT contato_tipo_contato FOREIGN KEY (tipo_contato_id) REFERENCES tipo_contato(id),
  informacoes_adicionais_id BIGINT,
	CONSTRAINT contato_informacoes_adicionais FOREIGN KEY (informacoes_adicionais_id) REFERENCES informacoes_adicionais(id)
);

CREATE TABLE IF NOT EXISTS tamanho_roupa (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  tamanho VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS tamanho_calcado (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  tamanho VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS dependente(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    data_nascimento DATETIME,
    deficiente TINYINT,
    tamanho_roupa_id BIGINT,
		CONSTRAINT dependente_tamanho_roupa FOREIGN KEY (tamanho_roupa_id) REFERENCES tamanho_roupa(id),
	tamanho_calcado_id BIGINT,
		CONSTRAINT dependente_tamanho_calcado FOREIGN KEY (tamanho_calcado_id) REFERENCES tamanho_calcado(id),
    situacao_id BIGINT,
		CONSTRAINT dependente_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id),
    familia_id BIGINT,
		CONSTRAINT dependente_familia FOREIGN KEY (familia_id) REFERENCES familia(id)
);

CREATE TABLE IF NOT EXISTS nivel_acesso (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  apelido VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS permissao (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  permissao VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS grupo_permissao (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  permissao_id BIGINT,
  nivel_acesso_id BIGINT,
  CONSTRAINT grupo_permissao_nivel_accesso FOREIGN KEY (nivel_acesso_id) REFERENCES nivel_acesso(id),
  CONSTRAINT grupo_permissao_permissao FOREIGN KEY (permissao_id) REFERENCES permissao(id)
);

CREATE TABLE IF NOT EXISTS usuario (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(150),
  email VARCHAR(150),
  senha VARBINARY(255),
  informacoes_adicionais_id BIGINT,
	CONSTRAINT usuario_informacoes_adicionais FOREIGN KEY (informacoes_adicionais_id) REFERENCES informacoes_adicionais(id),
  situacao_id BIGINT,
	CONSTRAINT usuario_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id),
  nivel_acesso_id BIGINT,
	CONSTRAINT usuario_nivel_acesso FOREIGN KEY (nivel_acesso_id) REFERENCES nivel_acesso(id)
);

CREATE TABLE IF NOT EXISTS acesso(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    data_acesso DATETIME,
    situacao_id BIGINT,
		CONSTRAINT acesso_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id),
    usuario_id BIGINT,
		CONSTRAINT acesso_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE IF NOT EXISTS calendario (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  ano INT,
  mes_nomeacao VARCHAR(50),
  mes_numeracao INT,
  dia_nomeacao VARCHAR(50),
  dia_numeracao INT
);

CREATE TABLE IF NOT EXISTS disponibilidade_voluntario(
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  hora_comeco TIME,
  hora_final TIME,
  usuario_id BIGINT,
	CONSTRAINT disponibilidade_voluntario_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  calendario_id BIGINT,
	CONSTRAINT disponibilidade_voluntario_calendario FOREIGN KEY (calendario_id) REFERENCES calendario(id),
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL
);

CREATE TABLE IF NOT EXISTS repeticao(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    escolha_repeticao VARCHAR(50),
    disponibilidade_voluntario_id BIGINT,
		CONSTRAINT repeticao_disponibilidade_voluntario FOREIGN KEY (disponibilidade_voluntario_id) REFERENCES disponibilidade_voluntario(id)
);

CREATE TABLE IF NOT EXISTS tipo_atividade (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS atividade (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  hora_comeco TIME,
  hora_final TIME,
  descricao VARCHAR(150),
  tipo_atividade_id BIGINT,
	CONSTRAINT atividade_tipo_atividade FOREIGN KEY (tipo_atividade_id) REFERENCES tipo_atividade(id),
  data_criacao DATETIME,
  data_ultima_atualizacao DATETIME,
  email_modificador VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS reserva_atividade(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    atividade_id BIGINT,
		CONSTRAINT reserva_atividade_atividade FOREIGN KEY (atividade_id) REFERENCES atividade(id),
	calendario_id BIGINT,
		CONSTRAINT reserva_atividade_calendario FOREIGN KEY (calendario_id) REFERENCES calendario(id),
	endereco_id BIGINT,
		CONSTRAINT reserva_atividade_endereco FOREIGN KEY (endereco_id) REFERENCES endereco(id),
	data_criacao DATETIME,
	data_ultima_atualizacao DATETIME,
	email_modificador VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS assunto_requisicao (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  assunto VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS requisicoes (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  hora_abertura TIME,
  hora_fechamento TIME,
  descricao VARCHAR(500),
  usuario_id BIGINT,
	CONSTRAINT requisicoes_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  assunto_requisicao_id BIGINT,
	CONSTRAINT requisicoes_assunto_requisicao FOREIGN KEY (assunto_requisicao_id) REFERENCES assunto_requisicao(id),
  situacao_id BIGINT,
	CONSTRAINT requisicoes_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id),
  data_criacao DATETIME,
  calendario_id BIGINT,
	CONSTRAINT requisicoes_calendario FOREIGN KEY (calendario_id) REFERENCES calendario(id),
  data_ultima_atualizacao DATETIME,
  email_modificador VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS categoria(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS venda(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	quantidade INT,
    valor DOUBLE,
    email_modificador VARCHAR(150),
    calendario_id BIGINT,
    CONSTRAINT venda_calendario FOREIGN KEY (calendario_id) REFERENCES calendario(id),
	categoria_id BIGINT,
    CONSTRAINT venda_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- SELECT datediff(now(),data_nascimento)/365 AS teste FROM informacoes_adicionais;

CREATE VIEW login AS 
SELECT 
	id,
    nome,
    email,
    CAST(AES_DECRYPT(senha,'chave') as CHAR) AS senha,
	nivel_acesso_id
FROM usuario;

CREATE VIEW acoes_pendentes AS 
	SELECT 
		acao.id,
        acao.nome,
        calendario.dia_numeracao,
        calendario.mes_numeracao,
        calendario.ano
        FROM atividade AS acao
			JOIN reserva_atividade AS reserva 
				ON acao.id = reserva.atividade_id
			JOIN calendario 
				ON reserva.calendario_id = calendario.id;
                
DELIMITER //

CREATE PROCEDURE inserir_dias_calendario()
BEGIN
    DECLARE data_atual DATE;
    DECLARE data_fim DATE;
    DECLARE nome_dia VARCHAR(30);
    DECLARE nome_mes VARCHAR(20);

    SET data_atual = '2024-01-01';
    SET data_fim = '2025-12-31';

    WHILE data_atual <= data_fim DO
        SET nome_dia = CASE DAYOFWEEK(data_atual)
                          WHEN 1 THEN 'Domingo'
                          WHEN 2 THEN 'Segunda-Feira'
                          WHEN 3 THEN 'Terça-Feira'
                          WHEN 4 THEN 'Quarta-Feira'
                          WHEN 5 THEN 'Quinta-Feira'
                          WHEN 6 THEN 'Sexta-Feira'
                          WHEN 7 THEN 'Sábado'
                       END;

        SET nome_mes = CASE MONTH(data_atual)
                          WHEN 1 THEN 'Janeiro'
                          WHEN 2 THEN 'Fevereiro'
                          WHEN 3 THEN 'Março'
                          WHEN 4 THEN 'Abril'
                          WHEN 5 THEN 'Maio'
                          WHEN 6 THEN 'Junho'
                          WHEN 7 THEN 'Julho'
                          WHEN 8 THEN 'Agosto'
                          WHEN 9 THEN 'Setembro'
                          WHEN 10 THEN 'Outubro'
                          WHEN 11 THEN 'Novembro'
                          WHEN 12 THEN 'Dezembro'
                       END;

        INSERT INTO calendario (ano, mes_nomeacao, mes_numeracao, dia_nomeacao, dia_numeracao)
        VALUES (YEAR(data_atual), nome_mes, MONTH(data_atual), nome_dia, DAY(data_atual));

        SET data_atual = DATE_ADD(data_atual, INTERVAL 1 DAY);
    END WHILE;

END //

DELIMITER ;

CREATE VIEW requisicoes_total AS
SELECT 
	requisicoes.id as req_id,
	requisicoes.assunto_requisicao_id,
    requisicoes.situacao_id,
    requisicoes.calendario_id,
    calendario.id as cal_id,
    calendario.ano,
    calendario.mes_nomeacao,
    calendario.mes_numeracao,
    calendario.dia_nomeacao,
    calendario.dia_numeracao
    FROM requisicoes 
    JOIN calendario 
    ON requisicoes.calendario_id = calendario.id;

CREATE VIEW requisicoes_grafico AS
SELECT 
	1 as id ,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 1 AND mes_numeracao IN (1, 2, 3)) AS Cestas_T1_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao IN (1, 2, 3)) AS Cestas_T1_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 1 AND mes_numeracao IN (4, 5, 6)) AS Cestas_T2_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao IN (4, 5, 6)) AS Cestas_T2_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 1 AND mes_numeracao IN (7, 8, 9)) AS Cestas_T3_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao IN (7, 8, 9)) AS Cestas_T3_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 1 AND mes_numeracao IN (10, 11, 12)) AS Cestas_T4_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao IN (10, 11, 12)) AS Cestas_T4_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 2 AND mes_numeracao IN (1, 2, 3)) AS Vestuario_T1_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao IN (1, 2, 3)) AS Vestuario_T1_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 2 AND mes_numeracao IN (4, 5, 6)) AS Vestuario_T2_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao IN (4, 5, 6)) AS Vestuario_T2_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 2 AND mes_numeracao IN (7, 8, 9)) AS Vestuario_T3_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao IN (7, 8, 9)) AS Vestuario_T3_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 2 AND mes_numeracao IN (10, 11, 12)) AS Vestuario_T4_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao IN (10, 11, 12)) AS Vestuario_T4_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 3 AND mes_numeracao IN (1, 2, 3)) AS Saude_T1_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao IN (1, 2, 3)) AS Saude_T1_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 3 AND mes_numeracao IN (4, 5, 6)) AS Saude_T2_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao IN (4, 5, 6)) AS Saude_T2_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 3 AND mes_numeracao IN (7, 8, 9)) AS Saude_T3_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao IN (7, 8, 9)) AS Saude_T3_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 3 AND mes_numeracao IN (10, 11, 12)) AS Saude_T4_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao IN (10, 11, 12)) AS Saude_T4_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 4 AND mes_numeracao IN (1, 2, 3)) AS Outros_T1_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao IN (1, 2, 3)) AS Outros_T1_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 4 AND mes_numeracao IN (4, 5, 6)) AS Outros_T2_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao IN (4, 5, 6)) AS Outros_T2_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 4 AND mes_numeracao IN (7, 8, 9)) AS Outros_T3_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao IN (7, 8, 9)) AS Outros_T3_cumpridas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 4 AND mes_numeracao IN (10, 11, 12)) AS Outros_T4_pedidas,
    (SELECT COUNT(req_id) FROM requisicoes_total WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao IN (10, 11, 12)) AS Outros_T4_cumpridas
FROM
    requisicoes_total
LIMIT 1;

DELIMITER //

DELIMITER //

CREATE PROCEDURE consulta_requisicoes_semanal_por_mes(IN mes INT, IN ano INT)
BEGIN
    SELECT 
        -- Cestas
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 1 AND 7) AS Cestas_S1_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 1 AND 7) AS Cestas_S1_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 8 AND 14) AS Cestas_S2_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 8 AND 14) AS Cestas_S2_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 15 AND 21) AS Cestas_S3_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 15 AND 21) AS Cestas_S3_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 22 AND 28) AS Cestas_S4_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 22 AND 28) AS Cestas_S4_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND mes_numeracao = mes AND ano = ano AND dia_numeracao >= 29) AS Cestas_S5_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 1 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao >= 29) AS Cestas_S5_cumpridas,

        -- Vestuário
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 1 AND 7) AS Vestuario_S1_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 1 AND 7) AS Vestuario_S1_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 8 AND 14) AS Vestuario_S2_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 8 AND 14) AS Vestuario_S2_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 15 AND 21) AS Vestuario_S3_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 15 AND 21) AS Vestuario_S3_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 22 AND 28) AS Vestuario_S4_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 22 AND 28) AS Vestuario_S4_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND mes_numeracao = mes AND ano = ano AND dia_numeracao >= 29) AS Vestuario_S5_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 2 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao >= 29) AS Vestuario_S5_cumpridas,

        -- Saúde
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 1 AND 7) AS Saude_S1_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 1 AND 7) AS Saude_S1_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 8 AND 14) AS Saude_S2_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 8 AND 14) AS Saude_S2_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 15 AND 21) AS Saude_S3_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 15 AND 21) AS Saude_S3_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 22 AND 28) AS Saude_S4_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 22 AND 28) AS Saude_S4_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND mes_numeracao = mes AND ano = ano AND dia_numeracao >= 29) AS Saude_S5_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 3 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao >= 29) AS Saude_S5_cumpridas,

        -- Outros
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 1 AND 7) AS Outros_S1_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 1 AND 7) AS Outros_S1_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 8 AND 14) AS Outros_S2_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 8 AND 14) AS Outros_S2_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 15 AND 21) AS Outros_S3_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 15 AND 21) AS Outros_S3_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 22 AND 28) AS Outros_S4_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao BETWEEN 22 AND 28) AS Outros_S4_cumpridas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND mes_numeracao = mes AND ano = ano AND dia_numeracao >= 29) AS Outros_S5_pedidas,
        (SELECT COUNT(req_id) 
         FROM requisicoes_total 
         WHERE assunto_requisicao_id = 4 AND situacao_id = 6 AND mes_numeracao = mes AND ano = ano AND dia_numeracao >= 29) AS Outros_S5_cumpridas;
END;
//

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE consulta_requisicoes_por_semana(
    IN ano INT,
    IN mes INT,
    IN semana INT
)
BEGIN
    DECLARE inicio_semana INT;
    DECLARE fim_semana INT;

    -- Calcular início e fim da semana
    SELECT 
        MIN(dia_numeracao), MAX(dia_numeracao)
    INTO 
        inicio_semana, fim_semana
    FROM calendario
    WHERE ano = ano
      AND mes_numeracao = mes
      AND FLOOR((dia_numeracao - 1) / 7) + 1 = semana;

    -- Realizar a consulta com os valores calculados
    SELECT 
        cal.dia_numeracao,
        cal.dia_nomeacao,
        
        -- Cestas
        COUNT(CASE WHEN req.assunto_requisicao_id = 1 THEN req.req_id END) AS Cestas_pedidas,
        COUNT(CASE WHEN req.assunto_requisicao_id = 1 AND req.situacao_id = 6 THEN req.req_id END) AS Cestas_cumpridas,
        
        -- Vestuário
        COUNT(CASE WHEN req.assunto_requisicao_id = 2 THEN req.req_id END) AS Vestuario_pedidas,
        COUNT(CASE WHEN req.assunto_requisicao_id = 2 AND req.situacao_id = 6 THEN req.req_id END) AS Vestuario_cumpridas,
        
        -- Saúde
        COUNT(CASE WHEN req.assunto_requisicao_id = 3 THEN req.req_id END) AS Saude_pedidas,
        COUNT(CASE WHEN req.assunto_requisicao_id = 3 AND req.situacao_id = 6 THEN req.req_id END) AS Saude_cumpridas,
        
        -- Outros
        COUNT(CASE WHEN req.assunto_requisicao_id = 4 THEN req.req_id END) AS Outros_pedidas,
        COUNT(CASE WHEN req.assunto_requisicao_id = 4 AND req.situacao_id = 6 THEN req.req_id END) AS Outros_cumpridas

    FROM calendario cal
    LEFT JOIN requisicoes_total req
        ON cal.ano = req.ano
        AND cal.mes_numeracao = req.mes_numeracao
        AND cal.dia_numeracao = req.dia_numeracao
    WHERE cal.ano = ano
      AND cal.mes_numeracao = mes
      AND cal.dia_numeracao BETWEEN inicio_semana AND fim_semana
    GROUP BY cal.dia_numeracao, cal.dia_nomeacao
    ORDER BY cal.dia_numeracao;
END$$

DELIMITER ;