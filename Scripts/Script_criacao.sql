
DROP DATABASE IF EXISTS TFG;

CREATE DATABASE IF NOT EXISTS TFG;
	
USE TFG;
    
CREATE TABLE IF NOT EXISTS cidade (
  id_cidade INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS bairro (
  id_bairro INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NULL,
  fk_cidade INT NOT NULL,
  CONSTRAINT fk_bairro_cidade1 FOREIGN KEY (fk_cidade) REFERENCES cidade (id_cidade)
);

CREATE TABLE IF NOT EXISTS tipo_situacao (
  id_tipo_situacao INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS situacao (
  id_situacao INT NOT NULL,
  situacao VARCHAR(100) NULL,
  fk_tipo_situacao INT NOT NULL,
  PRIMARY KEY (id_situacao),
  CONSTRAINT fk_situacao_tipo_situacao1
    FOREIGN KEY (fk_tipo_situacao)
    REFERENCES tipo_situacao (id_tipo_situacao)
);

CREATE TABLE IF NOT EXISTS endereco (
  id_endereco INT NOT NULL,
  logradouro VARCHAR(100) NULL,
  numero INT NULL,
  cep CHAR(8) NULL,
  fk_bairro INT NOT NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_endereco),
  CONSTRAINT fk_endereco_bairro1
    FOREIGN KEY (fk_bairro)
    REFERENCES bairro (id_bairro),
  CONSTRAINT fk_endereco_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS quantidade_pessoas (
  id_quantidade_pessoas INT NOT NULL,
  minimo INT NULL,
  maximo INT NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_quantidade_pessoas),
  CONSTRAINT fk_quantidade_pessoas_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS deficiencia (
  id_deficiencia INT NOT NULL,
  nome_deficiencia VARCHAR(150) NULL,
  PRIMARY KEY (id_deficiencia)
);

CREATE TABLE IF NOT EXISTS pessoa_deficiencia (
  id_pessoa_deficiencia INT NOT NULL,
  verificacao TINYINT NULL,
  fk_deficiencia INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_pessoa_deficiencia),
  CONSTRAINT fk_pessoa_deficiencia_deficiencia1
    FOREIGN KEY (fk_deficiencia)
    REFERENCES deficiencia (id_deficiencia)
);

CREATE TABLE IF NOT EXISTS urgencia_familiar (
  id_urgencia_familiar INT NOT NULL,
  descricao VARCHAR(150) NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_urgencia_familiar),
  CONSTRAINT fk_urgencia_familiar_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS renda_familiar (
  id_renda_familiar INT NOT NULL,
  renda DOUBLE NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_renda_familiar),
  CONSTRAINT fk_renda_familiar_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS familia (
  id_familia INT NOT NULL,
  fk_quantidade_pessoas INT NOT NULL,
  fk_pessoa_deficiencia INT NOT NULL,
  fk_urgencia_familiar INT NOT NULL,
  fk_renda_familiar INT NOT NULL,
  fk_situacao INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_familia),
  CONSTRAINT fk_familia_quantidade_pessoas1
    FOREIGN KEY (fk_quantidade_pessoas)
    REFERENCES quantidade_pessoas (id_quantidade_pessoas),
  CONSTRAINT fk_familia_pessoa_deficiencia1
    FOREIGN KEY (fk_pessoa_deficiencia)
    REFERENCES pessoa_deficiencia (id_pessoa_deficiencia),
  CONSTRAINT fk_familia_urgencia_familiar1
    FOREIGN KEY (fk_urgencia_familiar)
    REFERENCES urgencia_familiar (id_urgencia_familiar),
  CONSTRAINT fk_familia_renda_familiar1
    FOREIGN KEY (fk_renda_familiar)
    REFERENCES renda_familiar (id_renda_familiar),
  CONSTRAINT fk_familia_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS tipo_identificador (
  id_tipo_identificador INT NOT NULL,
  tipo VARCHAR(50) NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_tipo_identificador),
  CONSTRAINT fk_tipo_identificador_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS identificador (
  id_identificador INT NOT NULL,
  numeracao VARCHAR(40) NULL,
  fk_tipo_identificador INT NOT NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_identificador),
  CONSTRAINT fk_identificador_tipo_identificador1
    FOREIGN KEY (fk_tipo_identificador)
    REFERENCES tipo_identificador (id_tipo_identificador),
  CONSTRAINT fk_identificador_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS contato (
  id_contato INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_contato)
);

CREATE TABLE IF NOT EXISTS informacoes_adicionais (
  id_informacoes_adicionais INT NOT NULL,
  cpf CHAR(11) NULL,
  data_nascimento DATE NULL,
  fk_endereco INT NOT NULL,
  fk_familia INT NOT NULL,
  fk_contato INT NOT NULL,
  fk_identificador INT NOT NULL,
  fk_situacao INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_informacoes_adicionais),
  CONSTRAINT fk_informacoes_adicionais_endereco1
    FOREIGN KEY (fk_endereco)
    REFERENCES endereco (id_endereco),
  CONSTRAINT fk_informacoes_adicionais_familia1
    FOREIGN KEY (fk_familia)
    REFERENCES familia (id_familia),
  CONSTRAINT fk_informacoes_adicionais_identificador1
    FOREIGN KEY (fk_identificador)
    REFERENCES identificador (id_identificador),
  CONSTRAINT fk_informacoes_adicionais_contato1
    FOREIGN KEY (fk_contato)
    REFERENCES contato (id_contato),
  CONSTRAINT fk_informacoes_adicionais_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS nivel_acesso (
  id_nivel_acesso INT NOT NULL,
  apelido VARCHAR(60) NULL,
  PRIMARY KEY (id_nivel_acesso)
);

CREATE TABLE IF NOT EXISTS quantidade_criancas (
  id_quantidade_criancas INT NOT NULL,
  quantidade INT NULL,
  fk_familia INT NOT NULL,
  fk_situacao INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_quantidade_criancas),
  CONSTRAINT fk_quantidade_criancas_familia1
    FOREIGN KEY (fk_familia)
    REFERENCES familia (id_familia),
  CONSTRAINT fk_quantidade_criancas_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS tamanho_roupa (
  id_tamanho_roupa INT NOT NULL,
  tamanho VARCHAR(10) NULL,
  PRIMARY KEY (id_tamanho_roupa)
);

CREATE TABLE IF NOT EXISTS tamanho_calcado (
  id_tamanho_calcado INT NOT NULL,
  tamanho VARCHAR(10) NULL,
  PRIMARY KEY (id_tamanho_calcado)
);

CREATE TABLE IF NOT EXISTS crianca (
  id_crianca INT NOT NULL,
  genero VARCHAR(60) NULL,
  data_nascimento DATE NULL,
  fk_quantidade_criancas INT NOT NULL,
  fk_tamanho_roupa INT NOT NULL,
  fk_tamanho_calcado INT NOT NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_crianca),
  CONSTRAINT fk_familia_has_quantidade_criancas_quantidade_criancas1
    FOREIGN KEY (fk_quantidade_criancas)
    REFERENCES quantidade_criancas (id_quantidade_criancas),
  CONSTRAINT fk_crianca_tamanho_roupa1
    FOREIGN KEY (fk_tamanho_roupa)
    REFERENCES tamanho_roupa (id_tamanho_roupa),
  CONSTRAINT fk_crianca_tamanho_calcado1
    FOREIGN KEY (fk_tamanho_calcado)
    REFERENCES tamanho_calcado (id_tamanho_calcado),
  CONSTRAINT fk_crianca_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS tipo_doacao (
  id_tipo_doacao INT PRIMARY KEY,
  doacao VARCHAR(100) NULL,
  fk_situacao INT,
  FOREIGN KEY (fk_situacao) REFERENCES situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS doacao_pedida (
  iddoacao_pedida INT PRIMARY KEY,
  fk_tipo_doacao INT,
  fk_familia INT,
  situacao_idsituacao INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_tipo_doacao) REFERENCES tipo_doacao(id_tipo_doacao),
  FOREIGN KEY (fk_familia) REFERENCES familia(id_familia),
  FOREIGN KEY (situacao_idsituacao) REFERENCES situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS tipo_contato (
  id_tipo_contato INT PRIMARY KEY,
  tipo_contato VARCHAR(30) NULL,
  fk_situacao INT,
  FOREIGN KEY (fk_situacao) REFERENCES situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS informacoes_contato (
  id_informacoes_contato INT PRIMARY KEY,
  contato VARCHAR(150) NULL,
  fk_tipo_contato INT,
  fk_contato INT,
  fk_situacao INT,
  FOREIGN KEY (fk_tipo_contato) REFERENCES tipo_contato(id_tipo_contato),
  FOREIGN KEY (fk_contato) REFERENCES contato(id_contato),
  FOREIGN KEY (fk_situacao) REFERENCES situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS permissao (
  id_permissao INT PRIMARY KEY,
  permissao VARCHAR(30) NULL
);

CREATE TABLE IF NOT EXISTS grupo_permissao (
  id_grupo_permissao INT PRIMARY KEY,
  fk_permissao INT,
  fk_nivel_acesso INT,
  FOREIGN KEY (fk_permissao) REFERENCES permissao(id_permissao),
  FOREIGN KEY (fk_nivel_acesso) REFERENCES nivel_acesso(id_nivel_acesso)
);

CREATE TABLE IF NOT EXISTS tipo_atividade (
  id_tipo_atividade INT PRIMARY KEY,
  tipo VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS atividade (
  id_atividade INT PRIMARY KEY,
  comeco DATETIME NULL,
  final DATETIME NULL,
  descricao VARCHAR(150) NULL,
  fk_tipo_atividade INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_tipo_atividade) REFERENCES tipo_atividade(id_tipo_atividade)
);

CREATE TABLE IF NOT EXISTS usuario (
  id_usuario INT NOT NULL,
  nome VARCHAR(150) NULL,
  email VARCHAR(150) NULL,
  senha VARBINARY(255) NULL,
  fk_informacoes_adicionais INT NOT NULL,
  fk_situacao INT NOT NULL,
  fk_nivel_acesso INT NOT NULL,
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_usuario_informacoes_adicionais1
    FOREIGN KEY (fk_informacoes_adicionais)
    REFERENCES informacoes_adicionais (id_informacoes_adicionais),
  CONSTRAINT fk_usuario_situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES situacao (id_situacao),
  CONSTRAINT fk_usuario_nivel_acesso1
    FOREIGN KEY (fk_nivel_acesso)
    REFERENCES nivel_acesso (id_nivel_acesso)
);

CREATE TABLE IF NOT EXISTS acesso(
	id_acesso INT PRIMARY KEY AUTO_INCREMENT,
    data_acesso DATETIME,
    fk_situacao INT,
    CONSTRAINT fk_situacao_acesso FOREIGN KEY (fk_situacao) REFERENCES situacao(id_situacao),
    fk_usuario INT,
		CONSTRAINT fk_usuario_acesso FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE IF NOT EXISTS escala_voluntario (
  id_escala_voluntario INT PRIMARY KEY,
  fk_usuario INT,
  fk_atividade INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (fk_atividade) REFERENCES atividade(id_atividade)
);

CREATE TABLE IF NOT EXISTS nivel_urgencia (
  id_nIvel_urgencia INT PRIMARY KEY,
  nivel VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS assunto_requisicao (
  id_assunto_requisicao INT PRIMARY KEY,
  assunto VARCHAR(150) NULL
);

CREATE TABLE IF NOT EXISTS requisicoes (
  id_eequisicao INT PRIMARY KEY,
  fk_usuario INT,
  fk_nIvel_urgencia INT,
  fk_assunto_requisicao INT,
  data_abertura DATETIME NULL,
  data_fechamento DATETIME NULL,
  fk_situacao INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (fk_nIvel_urgencia) REFERENCES nivel_urgencia(id_nIvel_urgencia),
  FOREIGN KEY (fk_assunto_requisicao) REFERENCES assunto_requisicao(id_assunto_requisicao),
  FOREIGN KEY (fk_situacao) REFERENCES situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS ano (
  id_ano INT PRIMARY KEY,
  ano VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS mes (
  id_mes INT PRIMARY KEY,
  mes VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS dia (
  id_dia INT PRIMARY KEY,
  dia INT NULL
);

CREATE TABLE IF NOT EXISTS dia_semana (
  id_dia_semana INT PRIMARY KEY,
  dia_semana VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS calendario (
  id_calendario INT PRIMARY KEY,
  fk_dia INT,
  fk_ano INT,
  fk_mes INT,
  fk_dia_semana INT,
  FOREIGN KEY (fk_dia) REFERENCES dia(id_dia),
  FOREIGN KEY (fk_ano) REFERENCES ano(id_ano),
  FOREIGN KEY (fk_mes) REFERENCES mes(id_mes),
  FOREIGN KEY (fk_dia_semana) REFERENCES dia_semana(id_dia_semana)
);

CREATE TABLE IF NOT EXISTS reserva_atividade (
  id_reserva_atividade INT PRIMARY KEY,
  fk_calendario INT,
  fk_atividade INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_calendario) REFERENCES calendario(id_calendario),
  FOREIGN KEY (fk_atividade) REFERENCES atividade(id_atividade)
);
