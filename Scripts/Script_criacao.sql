
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
  cep CHAR(8) NULL,
  bairro_id BIGINT,
	CONSTRAINT endereco_bairro FOREIGN KEY (bairro_id) REFERENCES bairro(id),
  situacao_id BIGINT,
	CONSTRAINT endereco_situacao FOREIGN KEY (situacao_id) REFERENCES situacao(id)
);

CREATE TABLE IF NOT EXISTS quantidade_pessoas (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  minimo INT NULL,
  maximo INT NULL,
  situacao_id BIGINT,
	CONSTRAINT quantidade_pessoas_situacao FOREIGN KEY (situacao_id) REFERENCES situacao (id)
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
  quantidade_pessoas_id BIGINT,
	CONSTRAINT familia_quantidade_pessoas FOREIGN KEY(quantidade_pessoas_id) REFERENCES quantidade_pessoas(id),
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
  cpf CHAR(11) NULL,
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

CREATE TABLE IF NOT EXISTS faixa_etaria(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    faixa VARCHAR(70)
);

CREATE TABLE IF NOT EXISTS tamanho_roupa (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  tamanho VARCHAR(10),
  faixa_etaria_id BIGINT,
	CONSTRAINT tamanho_roupa_faixa_etaria FOREIGN KEY (faixa_etaria_id) REFERENCES faixa_etaria(id)
);

CREATE TABLE IF NOT EXISTS tamanho_calcado (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  tamanho VARCHAR(10),
  faixa_etaria_id BIGINT,
	CONSTRAINT tamanho_calcado_faixa_etaria FOREIGN KEY (faixa_etaria_id) REFERENCES faixa_etaria(id)
);

CREATE TABLE IF NOT EXISTS dependente(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    genero VARCHAR(60),
    data_nascimento DATETIME,
    definiente TINYINT,
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

CREATE TABLE IF NOT EXISTS disponibilidade_funcionario (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  hora_comeco TIME,
  hora_final TIME,
  usuario_id BIGINT,
	CONSTRAINT disponibilidade_funcionario_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  calendario_id BIGINT,
	CONSTRAINT disponibilidade_funcionario_calendario FOREIGN KEY (calendario_id) REFERENCES calendario(id),
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL
);

CREATE TABLE IF NOT EXISTS repeticao(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    escolha_repeticao VARCHAR(50),
    disponibilidade_funcionario_id BIGINT,
		CONSTRAINT repeticao_disponibilidade_funcionario FOREIGN KEY (disponibilidade_funcionario_id) REFERENCES disponibilidade_funcionario(id)
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
	data_criacao DATETIME,
	data_ultima_atualizacao DATETIME,
	email_modificador VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS nivel_urgencia (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  nivel VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS assunto_requisicao (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  assunto VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS requisicoes (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  hora_abertura TIME,
  hora_fechamento TIME,
  usuario_id BIGINT,
	CONSTRAINT requisicoes_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  nivel_urgencia_id BIGINT,
	CONSTRAINT requisicoes_nivel_urgencia FOREIGN KEY (nivel_urgencia_id) REFERENCES nivel_urgencia(id),
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

CREATE TABLE IF NOT EXISTS respostas_possiveis(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    resposta VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS areas_atendimento(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    area VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS opcoes_atendimento(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    opcao VARCHAR(100),
    areas_atendimento_id BIGINT,
		CONSTRAINT opcoes_atendimento_areas_atendimento FOREIGN KEY (areas_atendimento_id) REFERENCES areas_atendimento(id)
);

CREATE TABLE IF NOT EXISTS perguntas_frequentes(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    pergunta VARCHAR(60),
    opcoes_atendimento_id BIGINT,
		CONSTRAINT perguntas_frequentes_opcoes_atendimentos foreign key (opcoes_atendimento_id) REFERENCES opcoes_atendimento(id)
);

CREATE TABLE IF NOT EXISTS apresentacao_resposta(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    perguntas_frequentes_id BIGINT,
		CONSTRAINT apresentacao_resposta_perguntas_frequentes FOREIGN KEY (perguntas_frequentes_id) REFERENCES perguntas_frequentes(id),
    respostas_possiveis_id BIGINT,
		CONSTRAINT apresentacao_resposta_respostas_possiveis FOREIGN KEY (respostas_possiveis_id) REFERENCES respostas_possiveis(id)
);

CREATE TABLE IF NOT EXISTS entrada_usuario(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    usuario_id BIGINT,
		CONSTRAINT entrada_usuario_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE IF NOT EXISTS tipo_mensagem(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS mensagem_bot(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    areas_atendimento_id BIGINT,
		CONSTRAINT mensagem_bot_areas_atendimento FOREIGN KEY (areas_atendimento_id) REFERENCES areas_atendimento(id),
	tipo_mensagem_id BIGINT,
		CONSTRAINT mensagem_bot_tipo_mensagem FOREIGN KEY (tipo_mensagem_id) REFERENCES tipo_mensagem(id)
);

CREATE TABLE IF NOT EXISTS historico_conversa(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    entrada_usuario_id BIGINT,
		CONSTRAINT historico_conversa_entrada_usuario FOREIGN KEY (entrada_usuario_id) REFERENCES entrada_usuario(id),
    mensagem_bot_id BIGINT,
		CONSTRAINT historico_conversa_entrada_bot FOREIGN KEY (mensagem_bot_id) REFERENCES mensagem_bot(id)
);

-- SELECT datediff(now(),data_nascimento)/365 AS teste FROM informacoes_adicionais;

CREATE VIEW login AS SELECT id,nome,email,CAST(AES_DECRYPT(senha,'chave') as CHAR) AS senha FROM usuario;

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

/*
CREATE VIEW get_details_requisicao
	AS 
    SELECT 
		requisicoes.id AS ID_REQUISICAO,
        usuario.nome AS SOLICITANTE,
        informacoes_adicionais.cpf AS 'CPF',
        informacoes_adicionais.data_nascimento AS 'DATA NASCIMENTO',
        endereco.logradouro AS 'LOGRADOURO',
        endereco.numero AS 'NÚMERO',
        bairro.nome AS 'BAIRRO',
        familia.id AS 'ID FAMILIA',
        familia.apelido AS 'NOME DA FAMILIA',
        (SELECT COUNT(dependente.id) FROM dependente WHERE dependente.familia_id = familia.id) AS 'QUANTIDADE DEPENDENTES'
	FROM requisicoes
		JOIN usuario ON requisicoes.usuario_id = usuario.id
        JOIN informacoes_adicionais ON usuario.informacoes_adicionais_id = informacoes_adicionais.id
        JOIN endereco ON informacoes_adicionais.endereco_id = endereco.id
        JOIN bairro ON endereco.bairro_id = bairro.id
        JOIN familia ON informacoes_adicionais.familia_id = familia.id;

-- SELECT * FROM get_details_requisicao WHERE ID_REQUISIÇÃO = 1;
