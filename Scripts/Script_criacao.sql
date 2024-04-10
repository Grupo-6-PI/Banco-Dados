
DROP DATABASE IF EXISTS TFG;

CREATE DATABASE IF NOT EXISTS TFG;

USE TFG;

-- TABELAS

CREATE TABLE TipoSituacao(
	id_tipo_situacao INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(200)
);

CREATE TABLE Situacao(
	id_situacao INT PRIMARY KEY AUTO_INCREMENT,
    situacao VARCHAR(100),
    fk_tipo_situacao INT,
	CONSTRAINT fk_tipo_situacao_situacao FOREIGN KEY (fk_tipo_situacao) REFERENCES TipoSituacao(id_tipo_situacao)
);

CREATE TABLE Permissao(
	id_permissao INT PRIMARY KEY AUTO_INCREMENT,
    permissao VARCHAR(30)
);

CREATE TABLE NivelAcesso(
	id_nivel_acesso INT PRIMARY KEY AUTO_INCREMENT,
    apelido VARCHAR(60)
);

CREATE TABLE GrupoPermissao(
	id_grupo_acesso INT PRIMARY KEY AUTO_INCREMENT,
    fk_permissao INT,
    fk_nivel_accesso INT,
    CONSTRAINT fk_permissao_grupo_permissao FOREIGN KEY (fk_permissao) REFERENCES Permissao(id_permissao),
    CONSTRAINT fk_nivel_acesso_grupo_permissao FOREIGN KEY (fk_nivel_acesso) REFERENCES NivelAcesso(id_nivel_acesso)
);


