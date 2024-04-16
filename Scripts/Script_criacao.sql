CREATE DATABASE IF NOT EXISTS TFG;

CREATE TABLE IF NOT EXISTS Cidade (
  id_cidade INT NOT NULL,
  nome VARCHAR(100) NULL,
  PRIMARY KEY (id_cidade)
);

CREATE TABLE IF NOT EXISTS Bairro (
  id_bairro INT NOT NULL,
  nome VARCHAR(100) NULL,
  fk_cidade INT NOT NULL,
  PRIMARY KEY (id_bairro),
  CONSTRAINT fk_Bairro_Cidade1
    FOREIGN KEY (fk_cidade)
    REFERENCES Cidade (id_cidade)
);

CREATE TABLE IF NOT EXISTS TipoSituacao (
  id_tipo_situacao INT NOT NULL,
  tipo VARCHAR(60) NULL,
  PRIMARY KEY (id_tipo_situacao)
);

CREATE TABLE IF NOT EXISTS Situacao (
  id_situacao INT NOT NULL,
  situacao VARCHAR(100) NULL,
  fk_tipo_situacao INT NOT NULL,
  PRIMARY KEY (id_situacao),
  CONSTRAINT fk_Situacao_TipoSituacao1
    FOREIGN KEY (fk_tipo_situacao)
    REFERENCES TipoSituacao (id_tipo_situacao)
);

CREATE TABLE IF NOT EXISTS Endereco (
  id_endereco INT NOT NULL,
  logradouro VARCHAR(100) NULL,
  numero INT NULL,
  cep CHAR(8) NULL,
  fk_bairro INT NOT NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_endereco),
  CONSTRAINT fk_Endereco_Bairro1
    FOREIGN KEY (fk_bairro)
    REFERENCES Bairro (id_bairro),
  CONSTRAINT fk_Endereco_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS QuantidadePessoas (
  id_quantidade_pessoas INT NOT NULL,
  minimo INT NULL,
  maximo INT NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_quantidade_pessoas),
  CONSTRAINT fk_QuantidadePessoas_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS Deficiencia (
  id_deficiencia INT NOT NULL,
  nome_deficiencia VARCHAR(150) NULL,
  PRIMARY KEY (id_deficiencia)
);

CREATE TABLE IF NOT EXISTS PessoaDeficiencia (
  id_pessoa_deficiencia INT NOT NULL,
  verificacao TINYINT NULL,
  fk_deficiencia INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_pessoa_deficiencia),
  CONSTRAINT fk_PessoaDeficiencia_Deficiencia1
    FOREIGN KEY (fk_deficiencia)
    REFERENCES Deficiencia (id_deficiencia)
);

CREATE TABLE IF NOT EXISTS UrgenciaFamiliar (
  id_urgencia_familiar INT NOT NULL,
  descricao VARCHAR(150) NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_urgencia_familiar),
  CONSTRAINT fk_UrgenciaFamiliar_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS RendaFamiliar (
  id_renda_familiar INT NOT NULL,
  renda DOUBLE NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_renda_familiar),
  CONSTRAINT fk_RendaFamiliar_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS Familia (
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
  CONSTRAINT fk_Familia_QuantidadePessoas1
    FOREIGN KEY (fk_quantidade_pessoas)
    REFERENCES QuantidadePessoas (id_quantidade_pessoas),
  CONSTRAINT fk_Familia_PessoaDeficiencia1
    FOREIGN KEY (fk_pessoa_deficiencia)
    REFERENCES PessoaDeficiencia (id_pessoa_deficiencia),
  CONSTRAINT fk_Familia_UrgenciaFamiliar1
    FOREIGN KEY (fk_urgencia_familiar)
    REFERENCES UrgenciaFamiliar (id_urgencia_familiar),
  CONSTRAINT fk_Familia_RendaFamiliar1
    FOREIGN KEY (fk_renda_familiar)
    REFERENCES RendaFamiliar (id_renda_familiar),
  CONSTRAINT fk_Familia_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS TipoIdentificador (
  id_tipo_identificador INT NOT NULL,
  tipo VARCHAR(50) NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_tipo_identificador),
  CONSTRAINT fk_TipoIdentificador_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS Identificador (
  id_identificador INT NOT NULL,
  numeracao VARCHAR(40) NULL,
  fk_tipo_identificador INT NOT NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_identificador),
  CONSTRAINT fk_Identificador_TipoIdentificador1
    FOREIGN KEY (fk_tipo_identificador)
    REFERENCES TipoIdentificador (id_tipo_identificador),
  CONSTRAINT fk_Identificador_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS Contato (
  id_contato INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_contato)
);

CREATE TABLE IF NOT EXISTS InformacoesAdicionais (
  id_informacoes_adicionais INT NOT NULL,
  cpf CHAR(11) NULL,
  data_nascimento DATETIME NULL,
  fk_endereco INT NOT NULL,
  fk_familia INT NOT NULL,
  fk_identificador INT NOT NULL,
  fk_contato INT NOT NULL,
  fk_situacao INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_informacoes_adicionais),
  CONSTRAINT fk_InformacoesAdicionais_Endereco1
    FOREIGN KEY (fk_endereco)
    REFERENCES Endereco (id_endereco),
  CONSTRAINT fk_InformacoesAdicionais_Familia1
    FOREIGN KEY (fk_familia)
    REFERENCES Familia (id_familia),
  CONSTRAINT fk_InformacoesAdicionais_Identificador1
    FOREIGN KEY (fk_identificador)
    REFERENCES Identificador (id_identificador),
  CONSTRAINT fk_InformacoesAdicionais_Contato1
    FOREIGN KEY (fk_contato)
    REFERENCES Contato (id_contato),
  CONSTRAINT fk_InformacoesAdicionais_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS NivelAcesso (
  id_nivel_acesso INT NOT NULL,
  apelido VARCHAR(60) NULL,
  PRIMARY KEY (id_nivel_acesso)
);

CREATE TABLE IF NOT EXISTS QuantidadeCriancas (
  id_quantidade_criancas INT NOT NULL,
  quantidade INT NULL,
  fk_familia INT NOT NULL,
  fk_situacao INT NOT NULL,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  PRIMARY KEY (id_quantidade_criancas),
  CONSTRAINT fk_QuantidadeCriancas_Familia1
    FOREIGN KEY (fk_familia)
    REFERENCES Familia (id_familia),
  CONSTRAINT fk_QuantidadeCriancas_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS TamanhoRoupa (
  id_tamanho_roupa INT NOT NULL,
  tamanho VARCHAR(10) NULL,
  PRIMARY KEY (id_tamanho_roupa)
);

CREATE TABLE IF NOT EXISTS TamanhoCalcado (
  id_tamanho_calcado INT NOT NULL,
  tamanho VARCHAR(10) NULL,
  PRIMARY KEY (id_tamanho_calcado)
);

CREATE TABLE IF NOT EXISTS Crianca (
  id_Crianca INT NOT NULL,
  genero VARCHAR(60) NULL,
  data_nascimento DATETIME NULL,
  fk_quantidade_criancas INT NOT NULL,
  fk_tamanho_roupa INT NOT NULL,
  fk_tamanho_calcado INT NOT NULL,
  fk_situacao INT NOT NULL,
  PRIMARY KEY (id_Crianca),
  CONSTRAINT fk_Familia_has_QuantidadeCriancas_QuantidadeCriancas1
    FOREIGN KEY (fk_quantidade_criancas)
    REFERENCES QuantidadeCriancas (id_quantidade_criancas),
  CONSTRAINT fk_Crianca_TamanhoRoupa1
    FOREIGN KEY (fk_tamanho_roupa)
    REFERENCES TamanhoRoupa (id_tamanho_roupa),
  CONSTRAINT fk_Crianca_TamanhoCalcado1
    FOREIGN KEY (fk_tamanho_calcado)
    REFERENCES TamanhoCalcado (id_tamanho_calcado),
  CONSTRAINT fk_Crianca_Situacao1
    FOREIGN KEY (fk_situacao)
    REFERENCES Situacao (id_situacao)
);

CREATE TABLE IF NOT EXISTS TipoDoacao (
  id_tipo_doacao INT PRIMARY KEY,
  doacao VARCHAR(100) NULL,
  fk_situacao INT,
  FOREIGN KEY (fk_situacao) REFERENCES Situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS DoacaoPedida (
  idDoacaoPedida INT PRIMARY KEY,
  fk_TipoDoacao INT,
  fk_Familia INT,
  Situacao_idSituacao INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_TipoDoacao) REFERENCES TipoDoacao(id_tipo_doacao),
  FOREIGN KEY (fk_Familia) REFERENCES Familia(id_familia),
  FOREIGN KEY (Situacao_idSituacao) REFERENCES Situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS TipoContato (
  id_tipo_contato INT PRIMARY KEY,
  tipo_contato VARCHAR(30) NULL,
  fk_situacao INT,
  FOREIGN KEY (fk_situacao) REFERENCES Situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS InformacoesContato (
  id_informacoes_contato INT PRIMARY KEY,
  contato VARCHAR(150) NULL,
  fk_tipo_contato INT,
  fk_contato INT,
  fk_situacao INT,
  FOREIGN KEY (fk_tipo_contato) REFERENCES TipoContato(id_tipo_contato),
  FOREIGN KEY (fk_contato) REFERENCES Contato(id_contato),
  FOREIGN KEY (fk_situacao) REFERENCES Situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS Permissao (
  id_permissao INT PRIMARY KEY,
  permissao VARCHAR(30) NULL
);

CREATE TABLE IF NOT EXISTS GrupoPermissao (
  id_grupo_permissao INT PRIMARY KEY,
  fk_permissao INT,
  fk_nivel_acesso INT,
  FOREIGN KEY (fk_permissao) REFERENCES Permissao(id_permissao),
  FOREIGN KEY (fk_nivel_acesso) REFERENCES NivelAcesso(id_nivel_acesso)
);

CREATE TABLE IF NOT EXISTS TipoAtividade (
  id_tipo_atividade INT PRIMARY KEY,
  tipo VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS Atividade (
  id_atividade INT PRIMARY KEY,
  comeco DATETIME NULL,
  final DATETIME NULL,
  descricao VARCHAR(150) NULL,
  fk_tipo_atividade INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_tipo_atividade) REFERENCES TipoAtividade(id_tipo_atividade)
);

CREATE TABLE IF NOT EXISTS EscalaVoluntario (
  id_escala_voluntario INT PRIMARY KEY,
  fk_usuario INT,
  fk_atividade INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (fk_atividade) REFERENCES Atividade(id_atividade)
);

CREATE TABLE IF NOT EXISTS NIvelUrgencia (
  id_nIvel_urgencia INT PRIMARY KEY,
  nivel VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS AssuntoRequisicao (
  id_assunto_requisicao INT PRIMARY KEY,
  assunto VARCHAR(150) NULL
);

CREATE TABLE IF NOT EXISTS Requisicoes (
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
  FOREIGN KEY (fk_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (fk_nIvel_urgencia) REFERENCES NIvelUrgencia(id_nIvel_urgencia),
  FOREIGN KEY (fk_assunto_requisicao) REFERENCES AssuntoRequisicao(id_assunto_requisicao),
  FOREIGN KEY (fk_situacao) REFERENCES Situacao(id_situacao)
);

CREATE TABLE IF NOT EXISTS Ano (
  id_ano INT PRIMARY KEY,
  ano VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS Mes (
  id_mes INT PRIMARY KEY,
  mes VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS Dia (
  id_dia INT PRIMARY KEY,
  dia INT NULL
);

CREATE TABLE IF NOT EXISTS DiaSemana (
  id_dia_semana INT PRIMARY KEY,
  dia_semana VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS Calendario (
  id_calendario INT PRIMARY KEY,
  fk_dia INT,
  fk_ano INT,
  fk_mes INT,
  fk_dia_semana INT,
  FOREIGN KEY (fk_dia) REFERENCES Dia(id_dia),
  FOREIGN KEY (fk_ano) REFERENCES Ano(id_ano),
  FOREIGN KEY (fk_mes) REFERENCES Mes(id_mes),
  FOREIGN KEY (fk_dia_semana) REFERENCES DiaSemana(id_dia_semana)
);

CREATE TABLE IF NOT EXISTS ReservaAtividade (
  id_reserva_atividade INT PRIMARY KEY,
  fk_calendario INT,
  fk_atividade INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_calendario) REFERENCES Calendario(id_calendario),
  FOREIGN KEY (fk_atividade) REFERENCES Atividade(id_atividade)
);

CREATE TABLE IF NOT EXISTS TipoTransacao (
  id_tipo_transacao INT PRIMARY KEY,
  tipo VARCHAR(60) NULL
);

CREATE TABLE IF NOT EXISTS CategoriaVenda (
  id_categoria_venda INT PRIMARY KEY,
  categoria VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS Transacao (
  id_transacao INT PRIMARY KEY,
  valor DOUBLE NULL,
  fk_tipo_transacao INT,
  fk_categoria_venda INT,
  data_criacao DATETIME NULL,
  data_ultima_atualizacao DATETIME NULL,
  email_modificador VARCHAR(150) NULL,
  FOREIGN KEY (fk_tipo_transacao) REFERENCES TipoTransacao(id_tipo_transacao),
  FOREIGN KEY (fk_categoria_venda) REFERENCES CategoriaVenda(id_categoria_venda)
);

CREATE TABLE IF NOT EXISTS RelatorioFinanceiro (
  id_relatorio_financeiro INT PRIMARY KEY,
  fk_calendario INT,
  fk_transacao INT,
  FOREIGN KEY (fk_calendario) REFERENCES Calendario(id_calendario),
  FOREIGN KEY (fk_transacao) REFERENCES Transacao(id_transacao)
);

CREATE TABLE IF NOT EXISTS Conta (
  id_conta INT PRIMARY KEY,
  apelido VARCHAR(100) NULL
);

CREATE TABLE IF NOT EXISTS Extrato (
  id_extrato INT PRIMARY KEY,
  saldo VARCHAR(45) NULL,
  ultima_atualizacao DATETIME NULL,
  fk_conta INT,
  FOREIGN KEY (fk_conta) REFERENCES Conta(id_conta)
);
