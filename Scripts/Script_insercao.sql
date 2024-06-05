
USE TFG;

-- Inserir dados na tabela TipoSituacao
INSERT INTO tipo_situacao (tipo) VALUES ('Estado');
INSERT INTO tipo_situacao (tipo) VALUES ('Ação');

-- Inserir dados na tabela Situacao

INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Logado', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Deslogado', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Ativo', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Desativo', 1);

INSERT INTO usuario(nome,email,senha) VALUES ('Davi Silva','davirodrigues0506@gmail.com',AES_ENCRYPT('12341234','chave'));