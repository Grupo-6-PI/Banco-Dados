
USE TFG;

INSERT INTO estado (nome, uf) VALUES
('Acre', 'AC'),
('Alagoas', 'AL'),
('Amapá', 'AP'),
('Amazonas', 'AM'),
('Bahia', 'BA'),
('Ceará', 'CE'),
('Distrito Federal', 'DF'),
('Espírito Santo', 'ES'),
('Goiás', 'GO'),
('Maranhão', 'MA'),
('Mato Grosso', 'MT'),
('Mato Grosso do Sul', 'MS'),
('Minas Gerais', 'MG'),
('Pará', 'PA'),
('Paraíba', 'PB'),
('Paraná', 'PR'),
('Pernambuco', 'PE'),
('Piauí', 'PI'),
('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'),
('Rio Grande do Sul', 'RS'),
('Rondônia', 'RO'),
('Roraima', 'RR'),
('Santa Catarina', 'SC'),
('São Paulo', 'SP'),
('Sergipe', 'SE'),
('Tocantins', 'TO');

-- Inserir dados na tabela TipoSituacao
INSERT INTO tipo_situacao (tipo) VALUES ('Estado');
INSERT INTO tipo_situacao (tipo) VALUES ('Ação');

-- Inserir dados na tabela Situacao
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Logado', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Deslogado', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Ativo', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Desativo', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Aberto', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Cumprida', 1);
INSERT INTO situacao (situacao, tipo_situacao_id) VALUES ('Recusada', 1);

INSERT INTO usuario(nome,email,senha) VALUES ('Adiministrador','adm@gmail.com',AES_ENCRYPT('12341234','chave'));

INSERT INTO usuario(nome,email,senha) VALUES ('Julio Dahi','juliocesardahi@gmail.com',AES_ENCRYPT('12341234','chave'));

INSERT INTO informacoes_adicionais(cpf,data_nascimento,data_criacao,email_modificador) VALUES
('48556583830','2005-01-27',current_timestamp(),'adm@gmail.com');

INSERT INTO tipo_contato (tipo_contato) VALUES
('Email'),
('Whatsapp'),
('Telegram'),
('Ligação');

INSERT INTO contato(informacoes_contato,tipo_contato_id,informacoes_adicionais_id,data_criacao,email_modificador) VALUES
('1194066618',3,1,current_timestamp(),'adm@gmail.com');

INSERT INTO tipo_atividade(tipo) VALUES
('Multirão de vacina'),
('Entrega de alimentos'),
('Limpeza');

INSERT INTO atividade(nome,hora_comeco,hora_final,descricao,tipo_atividade_id,data_criacao,email_modificador) VALUES
('teste01','10:10:10','11:11:11','TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE',1,current_timestamp(),'adm@gmail.com'),
('teste02','10:10:10','11:11:11','TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE',1,current_timestamp(),'adm@gmail.com'),
('teste03','10:10:10','11:11:11','TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE',2,current_timestamp(),'adm@gmail.com'),
('teste04','10:10:10','11:11:11','TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE',2,current_timestamp(),'adm@gmail.com'),
('teste05','10:10:10','11:11:11','TESTE TESTE TESTE TESTE TESTE TESTE TESTE TESTE',3,current_timestamp(),'adm@gmail.com');

INSERT calendario(ano,mes_numeracao,mes_nomeacao,dia_numeracao) VALUES
(2024,1,'Janeiro',1),(2024,1,'Janeiro',2),(2024,1,'Janeiro',3),(2024,1,'Janeiro',4),(2024,1,'Janeiro',5),(2024,1,'Janeiro',6),(2024,1,'Janeiro',7),(2024,1,'Janeiro',8),(2024,1,'Janeiro',9),(2024,1,'Janeiro',10),(2024,1,'Janeiro',11),(2024,1,'Janeiro',12),(2024,1,'Janeiro',13),(2024,1,'Janeiro',14),(2024,1,'Janeiro',15),(2024,1,'Janeiro',16),(2024,1,'Janeiro',17),(2024,1,'Janeiro',18),(2024,1,'Janeiro',19),(2024,1,'Janeiro',20),(2024,1,'Janeiro',21),(2024,1,'Janeiro',22),(2024,1,'Janeiro',23),(2024,1,'Janeiro',24),(2024,1,'Janeiro',25),(2024,1,'Janeiro',26),(2024,1,'Janeiro',27),(2024,1,'Janeiro',28),(2024,1,'Janeiro',29),(2024,1,'Janeiro',30),(2024,1,'Janeiro',31),(2024,2,'Fevereiro',1),(2024,2,'Fevereiro',2),(2024,2,'Fevereiro',3),(2024,2,'Fevereiro',4),(2024,2,'Fevereiro',5),(2024,2,'Fevereiro',6),(2024,2,'Fevereiro',7),(2024,2,'Fevereiro',8),(2024,2,'Fevereiro',9),(2024,2,'Fevereiro',10),(2024,2,'Fevereiro',11),(2024,2,'Fevereiro',12),(2024,2,'Fevereiro',13),(2024,2,'Fevereiro',14),(2024,2,'Fevereiro',15),(2024,2,'Fevereiro',16),(2024,2,'Fevereiro',17),(2024,2,'Fevereiro',18),(2024,2,'Fevereiro',19),(2024,2,'Fevereiro',20),(2024,2,'Fevereiro',21),(2024,2,'Fevereiro',22),(2024,2,'Fevereiro',23),(2024,2,'Fevereiro',24),(2024,2,'Fevereiro',25),(2024,2,'Fevereiro',26),(2024,2,'Fevereiro',27),(2024,2,'Fevereiro',28),(2024,2,'Fevereiro',29),(2024,3,'Março',1),(2024,3,'Março',2),(2024,3,'Março',3),(2024,3,'Março',4),(2024,3,'Março',5),(2024,3,'Março',6),(2024,3,'Março',7),(2024,3,'Março',8),(2024,3,'Março',9),(2024,3,'Março',10),(2024,3,'Março',11),(2024,3,'Março',12),(2024,3,'Março',13),(2024,3,'Março',14),(2024,3,'Março',15),(2024,3,'Março',16),(2024,3,'Março',17),(2024,3,'Março',18),(2024,3,'Março',19),(2024,3,'Março',20),(2024,3,'Março',21),(2024,3,'Março',22),(2024,3,'Março',23),(2024,3,'Março',24),(2024,3,'Março',25),(2024,3,'Março',26),(2024,3,'Março',27),(2024,3,'Março',28),(2024,3,'Março',29),(2024,3,'Março',30),(2024,3,'Março',31),(2024,4,'Abril',1),(2024,4,'Abril',2),(2024,4,'Abril',3),(2024,4,'Abril',4),(2024,4,'Abril',5),(2024,4,'Abril',6),(2024,4,'Abril',7),(2024,4,'Abril',8),(2024,4,'Abril',9),(2024,4,'Abril',10),(2024,4,'Abril',11),(2024,4,'Abril',12),(2024,4,'Abril',13),(2024,4,'Abril',14),(2024,4,'Abril',15),(2024,4,'Abril',16),(2024,4,'Abril',17),(2024,4,'Abril',18),(2024,4,'Abril',19),(2024,4,'Abril',20),(2024,4,'Abril',21),(2024,4,'Abril',22),(2024,4,'Abril',23),(2024,4,'Abril',24),(2024,4,'Abril',25),(2024,4,'Abril',26),(2024,4,'Abril',27),(2024,4,'Abril',28),(2024,4,'Abril',29),(2024,4,'Abril',30),(2024,5,'Maio',1),(2024,5,'Maio',2),(2024,5,'Maio',3),(2024,5,'Maio',4),(2024,5,'Maio',5),(2024,5,'Maio',6),(2024,5,'Maio',7),(2024,5,'Maio',8),(2024,5,'Maio',9),(2024,5,'Maio',10),(2024,5,'Maio',11),(2024,5,'Maio',12),(2024,5,'Maio',13),(2024,5,'Maio',14),(2024,5,'Maio',15),(2024,5,'Maio',16),(2024,5,'Maio',17),(2024,5,'Maio',18),(2024,5,'Maio',19),(2024,5,'Maio',20),(2024,5,'Maio',21),(2024,5,'Maio',22),(2024,5,'Maio',23),(2024,5,'Maio',24),(2024,5,'Maio',25),(2024,5,'Maio',26),(2024,5,'Maio',27),(2024,5,'Maio',28),(2024,5,'Maio',29),(2024,5,'Maio',30),(2024,5,'Maio',31),(2024,6,'Junho',1),(2024,6,'Junho',2),(2024,6,'Junho',3),(2024,6,'Junho',4),(2024,6,'Junho',5),(2024,6,'Junho',6),(2024,6,'Junho',7),(2024,6,'Junho',8),(2024,6,'Junho',9),(2024,6,'Junho',10),(2024,6,'Junho',11),(2024,6,'Junho',12),(2024,6,'Junho',13),(2024,6,'Junho',14),(2024,6,'Junho',15),(2024,6,'Junho',16),(2024,6,'Junho',17),(2024,6,'Junho',18),(2024,6,'Junho',19),(2024,6,'Junho',20),(2024,6,'Junho',21),(2024,6,'Junho',22),(2024,6,'Junho',23),(2024,6,'Junho',24),(2024,6,'Junho',25),(2024,6,'Junho',26),(2024,6,'Junho',27),(2024,6,'Junho',28),(2024,6,'Junho',29),(2024,6,'Junho',30),(2024,7,'Julho',1),(2024,7,'Julho',2),(2024,7,'Julho',3),(2024,7,'Julho',4),(2024,7,'Julho',5),(2024,7,'Julho',6),(2024,7,'Julho',7),(2024,7,'Julho',8),(2024,7,'Julho',9),(2024,7,'Julho',10),(2024,7,'Julho',11),(2024,7,'Julho',12),(2024,7,'Julho',13),(2024,7,'Julho',14),(2024,7,'Julho',15),(2024,7,'Julho',16),(2024,7,'Julho',17),(2024,7,'Julho',18),(2024,7,'Julho',19),(2024,7,'Julho',20),(2024,7,'Julho',21),(2024,7,'Julho',22),(2024,7,'Julho',23),(2024,7,'Julho',24),(2024,7,'Julho',25),(2024,7,'Julho',26),(2024,7,'Julho',27),(2024,7,'Julho',28),(2024,7,'Julho',29),(2024,7,'Julho',30),(2024,7,'Julho',31),(2024,8,'Agosto',1),(2024,8,'Agosto',2),(2024,8,'Agosto',3),(2024,8,'Agosto',4),(2024,8,'Agosto',5),(2024,8,'Agosto',6),(2024,8,'Agosto',7),(2024,8,'Agosto',8),(2024,8,'Agosto',9),(2024,8,'Agosto',10),(2024,8,'Agosto',11),(2024,8,'Agosto',12),(2024,8,'Agosto',13),(2024,8,'Agosto',14),(2024,8,'Agosto',15),(2024,8,'Agosto',16),(2024,8,'Agosto',17),(2024,8,'Agosto',18),(2024,8,'Agosto',19),(2024,8,'Agosto',20),(2024,8,'Agosto',21),(2024,8,'Agosto',22),(2024,8,'Agosto',23),(2024,8,'Agosto',24),(2024,8,'Agosto',25),(2024,8,'Agosto',26),(2024,8,'Agosto',27),(2024,8,'Agosto',28),(2024,8,'Agosto',29),(2024,8,'Agosto',30),(2024,8,'Agosto',31),(2024,9,'Setembro',1),(2024,9,'Setembro',2),(2024,9,'Setembro',3),(2024,9,'Setembro',4),(2024,9,'Setembro',5),(2024,9,'Setembro',6),(2024,9,'Setembro',7),(2024,9,'Setembro',8),(2024,9,'Setembro',9),(2024,9,'Setembro',10),(2024,9,'Setembro',11),(2024,9,'Setembro',12),(2024,9,'Setembro',13),(2024,9,'Setembro',14),(2024,9,'Setembro',15),(2024,9,'Setembro',16),(2024,9,'Setembro',17),(2024,9,'Setembro',18),(2024,9,'Setembro',19),(2024,9,'Setembro',20),(2024,9,'Setembro',21),(2024,9,'Setembro',22),(2024,9,'Setembro',23),(2024,9,'Setembro',24),(2024,9,'Setembro',25),(2024,9,'Setembro',26),(2024,9,'Setembro',27),(2024,9,'Setembro',28),(2024,9,'Setembro',29),(2024,9,'Setembro',30),(2024,10,'Outubro',1),(2024,10,'Outubro',2),(2024,10,'Outubro',3),(2024,10,'Outubro',4),(2024,10,'Outubro',5),(2024,10,'Outubro',6),(2024,10,'Outubro',7),(2024,10,'Outubro',8),(2024,10,'Outubro',9),(2024,10,'Outubro',10),(2024,10,'Outubro',11),(2024,10,'Outubro',12),(2024,10,'Outubro',13),(2024,10,'Outubro',14),(2024,10,'Outubro',15),(2024,10,'Outubro',16),(2024,10,'Outubro',17),(2024,10,'Outubro',18),(2024,10,'Outubro',19),(2024,10,'Outubro',20),(2024,10,'Outubro',21),(2024,10,'Outubro',22),(2024,10,'Outubro',23),(2024,10,'Outubro',24),(2024,10,'Outubro',25),(2024,10,'Outubro',26),(2024,10,'Outubro',27),(2024,10,'Outubro',28),(2024,10,'Outubro',29),(2024,10,'Outubro',30),(2024,10,'Outubro',31),(2024,11,'Novembro',1),(2024,11,'Novembro',2),(2024,11,'Novembro',3),(2024,11,'Novembro',4),(2024,11,'Novembro',5),(2024,11,'Novembro',6),(2024,11,'Novembro',7),(2024,11,'Novembro',8),(2024,11,'Novembro',9),(2024,11,'Novembro',10),(2024,11,'Novembro',11),(2024,11,'Novembro',12),(2024,11,'Novembro',13),(2024,11,'Novembro',14),(2024,11,'Novembro',15),(2024,11,'Novembro',16),(2024,11,'Novembro',17),(2024,11,'Novembro',18),(2024,11,'Novembro',19),(2024,11,'Novembro',20),(2024,11,'Novembro',21),(2024,11,'Novembro',22),(2024,11,'Novembro',23),(2024,11,'Novembro',24),(2024,11,'Novembro',25),(2024,11,'Novembro',26),(2024,11,'Novembro',27),(2024,11,'Novembro',28),(2024,11,'Novembro',29),(2024,11,'Novembro',30),(2024,12,'Dezembro',1),(2024,12,'Dezembro',2),(2024,12,'Dezembro',3),(2024,12,'Dezembro',4),(2024,12,'Dezembro',5),(2024,12,'Dezembro',6),(2024,12,'Dezembro',7),(2024,12,'Dezembro',8),(2024,12,'Dezembro',9),(2024,12,'Dezembro',10),(2024,12,'Dezembro',11),(2024,12,'Dezembro',12),(2024,12,'Dezembro',13),(2024,12,'Dezembro',14),(2024,12,'Dezembro',15),(2024,12,'Dezembro',16),(2024,12,'Dezembro',17),(2024,12,'Dezembro',18),(2024,12,'Dezembro',19),(2024,12,'Dezembro',20),(2024,12,'Dezembro',21),(2024,12,'Dezembro',22),(2024,12,'Dezembro',23),(2024,12,'Dezembro',24),(2024,12,'Dezembro',25),(2024,12,'Dezembro',26),(2024,12,'Dezembro',27),(2024,12,'Dezembro',28),(2024,12,'Dezembro',29),(2024,12,'Dezembro',30),(2024,12,'Dezembro',31),(2025,1,'Janeiro',1),(2025,1,'Janeiro',2),(2025,1,'Janeiro',3),(2025,1,'Janeiro',4),(2025,1,'Janeiro',5),(2025,1,'Janeiro',6),(2025,1,'Janeiro',7),(2025,1,'Janeiro',8),(2025,1,'Janeiro',9),(2025,1,'Janeiro',10),(2025,1,'Janeiro',11),(2025,1,'Janeiro',12),(2025,1,'Janeiro',13),(2025,1,'Janeiro',14),(2025,1,'Janeiro',15),(2025,1,'Janeiro',16),(2025,1,'Janeiro',17),(2025,1,'Janeiro',18),(2025,1,'Janeiro',19),(2025,1,'Janeiro',20),(2025,1,'Janeiro',21),(2025,1,'Janeiro',22),(2025,1,'Janeiro',23),(2025,1,'Janeiro',24),(2025,1,'Janeiro',25),(2025,1,'Janeiro',26),(2025,1,'Janeiro',27),(2025,1,'Janeiro',28),(2025,1,'Janeiro',29),(2025,1,'Janeiro',30),(2025,1,'Janeiro',31),(2025,2,'Fevereiro',1),(2025,2,'Fevereiro',2),(2025,2,'Fevereiro',3),(2025,2,'Fevereiro',4),(2025,2,'Fevereiro',5),(2025,2,'Fevereiro',6),(2025,2,'Fevereiro',7),(2025,2,'Fevereiro',8),(2025,2,'Fevereiro',9),(2025,2,'Fevereiro',10),(2025,2,'Fevereiro',11),(2025,2,'Fevereiro',12),(2025,2,'Fevereiro',13),(2025,2,'Fevereiro',14),(2025,2,'Fevereiro',15),(2025,2,'Fevereiro',16),(2025,2,'Fevereiro',17),(2025,2,'Fevereiro',18),(2025,2,'Fevereiro',19),(2025,2,'Fevereiro',20),(2025,2,'Fevereiro',21),(2025,2,'Fevereiro',22),(2025,2,'Fevereiro',23),(2025,2,'Fevereiro',24),(2025,2,'Fevereiro',25),(2025,2,'Fevereiro',26),(2025,2,'Fevereiro',27),(2025,2,'Fevereiro',28),(2025,3,'Março',1),(2025,3,'Março',2),(2025,3,'Março',3),(2025,3,'Março',4),(2025,3,'Março',5),(2025,3,'Março',6),(2025,3,'Março',7),(2025,3,'Março',8),(2025,3,'Março',9),(2025,3,'Março',10),(2025,3,'Março',11),(2025,3,'Março',12),(2025,3,'Março',13),(2025,3,'Março',14),(2025,3,'Março',15),(2025,3,'Março',16),(2025,3,'Março',17),(2025,3,'Março',18),(2025,3,'Março',19),(2025,3,'Março',20),(2025,3,'Março',21),(2025,3,'Março',22),(2025,3,'Março',23),(2025,3,'Março',24),(2025,3,'Março',25),(2025,3,'Março',26),(2025,3,'Março',27),(2025,3,'Março',28),(2025,3,'Março',29),(2025,3,'Março',30),(2025,3,'Março',31),(2025,4,'Abril',1),(2025,4,'Abril',2),(2025,4,'Abril',3),(2025,4,'Abril',4),(2025,4,'Abril',5),(2025,4,'Abril',6),(2025,4,'Abril',7),(2025,4,'Abril',8),(2025,4,'Abril',9),(2025,4,'Abril',10),(2025,4,'Abril',11),(2025,4,'Abril',12),(2025,4,'Abril',13),(2025,4,'Abril',14),(2025,4,'Abril',15),(2025,4,'Abril',16),(2025,4,'Abril',17),(2025,4,'Abril',18),(2025,4,'Abril',19),(2025,4,'Abril',20),(2025,4,'Abril',21),(2025,4,'Abril',22),(2025,4,'Abril',23),(2025,4,'Abril',24),(2025,4,'Abril',25),(2025,4,'Abril',26),(2025,4,'Abril',27),(2025,4,'Abril',28),(2025,4,'Abril',29),(2025,4,'Abril',30),(2025,5,'Maio',1),(2025,5,'Maio',2),(2025,5,'Maio',3),(2025,5,'Maio',4),(2025,5,'Maio',5),(2025,5,'Maio',6),(2025,5,'Maio',7),(2025,5,'Maio',8),(2025,5,'Maio',9),(2025,5,'Maio',10),(2025,5,'Maio',11),(2025,5,'Maio',12),(2025,5,'Maio',13),(2025,5,'Maio',14),(2025,5,'Maio',15),(2025,5,'Maio',16),(2025,5,'Maio',17),(2025,5,'Maio',18),(2025,5,'Maio',19),(2025,5,'Maio',20),(2025,5,'Maio',21),(2025,5,'Maio',22),(2025,5,'Maio',23),(2025,5,'Maio',24),(2025,5,'Maio',25),(2025,5,'Maio',26),(2025,5,'Maio',27),(2025,5,'Maio',28),(2025,5,'Maio',29),(2025,5,'Maio',30),(2025,5,'Maio',31),(2025,6,'Junho',1),(2025,6,'Junho',2),(2025,6,'Junho',3),(2025,6,'Junho',4),(2025,6,'Junho',5),(2025,6,'Junho',6),(2025,6,'Junho',7),(2025,6,'Junho',8),(2025,6,'Junho',9),(2025,6,'Junho',10),(2025,6,'Junho',11),(2025,6,'Junho',12),(2025,6,'Junho',13),(2025,6,'Junho',14),(2025,6,'Junho',15),(2025,6,'Junho',16),(2025,6,'Junho',17),(2025,6,'Junho',18),(2025,6,'Junho',19),(2025,6,'Junho',20),(2025,6,'Junho',21),(2025,6,'Junho',22),(2025,6,'Junho',23),(2025,6,'Junho',24),(2025,6,'Junho',25),(2025,6,'Junho',26),(2025,6,'Junho',27),(2025,6,'Junho',28),(2025,6,'Junho',29),(2025,6,'Junho',30),(2025,7,'Julho',1),(2025,7,'Julho',2),(2025,7,'Julho',3),(2025,7,'Julho',4),(2025,7,'Julho',5),(2025,7,'Julho',6),(2025,7,'Julho',7),(2025,7,'Julho',8),(2025,7,'Julho',9),(2025,7,'Julho',10),(2025,7,'Julho',11),(2025,7,'Julho',12),(2025,7,'Julho',13),(2025,7,'Julho',14),(2025,7,'Julho',15),(2025,7,'Julho',16),(2025,7,'Julho',17),(2025,7,'Julho',18),(2025,7,'Julho',19),(2025,7,'Julho',20),(2025,7,'Julho',21),(2025,7,'Julho',22),(2025,7,'Julho',23),(2025,7,'Julho',24),(2025,7,'Julho',25),(2025,7,'Julho',26),(2025,7,'Julho',27),(2025,7,'Julho',28),(2025,7,'Julho',29),(2025,7,'Julho',30),(2025,7,'Julho',31),(2025,8,'Agosto',1),(2025,8,'Agosto',2),(2025,8,'Agosto',3),(2025,8,'Agosto',4),(2025,8,'Agosto',5),(2025,8,'Agosto',6),(2025,8,'Agosto',7),(2025,8,'Agosto',8),(2025,8,'Agosto',9),(2025,8,'Agosto',10),(2025,8,'Agosto',11),(2025,8,'Agosto',12),(2025,8,'Agosto',13),(2025,8,'Agosto',14),(2025,8,'Agosto',15),(2025,8,'Agosto',16),(2025,8,'Agosto',17),(2025,8,'Agosto',18),(2025,8,'Agosto',19),(2025,8,'Agosto',20),(2025,8,'Agosto',21),(2025,8,'Agosto',22),(2025,8,'Agosto',23),(2025,8,'Agosto',24),(2025,8,'Agosto',25),(2025,8,'Agosto',26),(2025,8,'Agosto',27),(2025,8,'Agosto',28),(2025,8,'Agosto',29),(2025,8,'Agosto',30),(2025,8,'Agosto',31),(2025,9,'Setembro',1),(2025,9,'Setembro',2),(2025,9,'Setembro',3),(2025,9,'Setembro',4),(2025,9,'Setembro',5),(2025,9,'Setembro',6),(2025,9,'Setembro',7),(2025,9,'Setembro',8),(2025,9,'Setembro',9),(2025,9,'Setembro',10),(2025,9,'Setembro',11),(2025,9,'Setembro',12),(2025,9,'Setembro',13),(2025,9,'Setembro',14),(2025,9,'Setembro',15),(2025,9,'Setembro',16),(2025,9,'Setembro',17),(2025,9,'Setembro',18),(2025,9,'Setembro',19),(2025,9,'Setembro',20),(2025,9,'Setembro',21),(2025,9,'Setembro',22),(2025,9,'Setembro',23),(2025,9,'Setembro',24),(2025,9,'Setembro',25),(2025,9,'Setembro',26),(2025,9,'Setembro',27),(2025,9,'Setembro',28),(2025,9,'Setembro',29),(2025,9,'Setembro',30),(2025,10,'Outubro',1),(2025,10,'Outubro',2),(2025,10,'Outubro',3),(2025,10,'Outubro',4),(2025,10,'Outubro',5),(2025,10,'Outubro',6),(2025,10,'Outubro',7),(2025,10,'Outubro',8),(2025,10,'Outubro',9),(2025,10,'Outubro',10),(2025,10,'Outubro',11),(2025,10,'Outubro',12),(2025,10,'Outubro',13),(2025,10,'Outubro',14),(2025,10,'Outubro',15),(2025,10,'Outubro',16),(2025,10,'Outubro',17),(2025,10,'Outubro',18),(2025,10,'Outubro',19),(2025,10,'Outubro',20),(2025,10,'Outubro',21),(2025,10,'Outubro',22),(2025,10,'Outubro',23),(2025,10,'Outubro',24),(2025,10,'Outubro',25),(2025,10,'Outubro',26),(2025,10,'Outubro',27),(2025,10,'Outubro',28),(2025,10,'Outubro',29),(2025,10,'Outubro',30),(2025,10,'Outubro',31),(2025,11,'Novembro',1),(2025,11,'Novembro',2),(2025,11,'Novembro',3),(2025,11,'Novembro',4),(2025,11,'Novembro',5),(2025,11,'Novembro',6),(2025,11,'Novembro',7),(2025,11,'Novembro',8),(2025,11,'Novembro',9),(2025,11,'Novembro',10),(2025,11,'Novembro',11),(2025,11,'Novembro',12),(2025,11,'Novembro',13),(2025,11,'Novembro',14),(2025,11,'Novembro',15),(2025,11,'Novembro',16),(2025,11,'Novembro',17),(2025,11,'Novembro',18),(2025,11,'Novembro',19),(2025,11,'Novembro',20),(2025,11,'Novembro',21),(2025,11,'Novembro',22),(2025,11,'Novembro',23),(2025,11,'Novembro',24),(2025,11,'Novembro',25),(2025,11,'Novembro',26),(2025,11,'Novembro',27),(2025,11,'Novembro',28),(2025,11,'Novembro',29),(2025,11,'Novembro',30),(2025,12,'Dezembro',1),(2025,12,'Dezembro',2),(2025,12,'Dezembro',3),(2025,12,'Dezembro',4),(2025,12,'Dezembro',5),(2025,12,'Dezembro',6),(2025,12,'Dezembro',7),(2025,12,'Dezembro',8),(2025,12,'Dezembro',9),(2025,12,'Dezembro',10),(2025,12,'Dezembro',11),(2025,12,'Dezembro',12),(2025,12,'Dezembro',13),(2025,12,'Dezembro',14),(2025,12,'Dezembro',15),(2025,12,'Dezembro',16),(2025,12,'Dezembro',17),(2025,12,'Dezembro',18),(2025,12,'Dezembro',19),(2025,12,'Dezembro',20),(2025,12,'Dezembro',21),(2025,12,'Dezembro',22),(2025,12,'Dezembro',23),(2025,12,'Dezembro',24),(2025,12,'Dezembro',25),(2025,12,'Dezembro',26),(2025,12,'Dezembro',27),(2025,12,'Dezembro',28),(2025,12,'Dezembro',29),(2025,12,'Dezembro',30),(2025,12,'Dezembro',31);

UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 1;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 8;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 15;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 22;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 29;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 36;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 43;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 50;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 57;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 64;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 71;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 78;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 85;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 92;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 99;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 106;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 113;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 120;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 127;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 134;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 141;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 148;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 155;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 162;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 169;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 176;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 183;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 190;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 197;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 204;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 211;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 218;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 225;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 232;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 239;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 246;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 253;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 260;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 267;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 274;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 281;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 288;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 295;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 302;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 309;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 316;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 323;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 330;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 337;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 344;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 351;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 358;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 365;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 372;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 379;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 386;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 393;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 400;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 407;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 414;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 421;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 428;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 435;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 442;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 449;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 456;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 463;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 470;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 477;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 484;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 491;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 498;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 505;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 512;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 519;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 526;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 533;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 540;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 547;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 554;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 561;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 568;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 575;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 582;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 589;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 596;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 603;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 610;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 617;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 624;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 631;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 638;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 645;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 652;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 659;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 666;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 673;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 680;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 687;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 694;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 701;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 708;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 715;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 722;
UPDATE calendario SET dia_nomeacao = 'Segunda-Feira' WHERE id = 729;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 2;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 9;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 16;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 23;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 30;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 37;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 44;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 51;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 58;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 65;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 72;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 79;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 86;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 93;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 100;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 107;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 114;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 121;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 128;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 135;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 142;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 149;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 156;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 163;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 170;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 177;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 184;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 191;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 198;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 205;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 212;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 219;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 226;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 233;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 240;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 247;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 254;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 261;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 268;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 275;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 282;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 289;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 296;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 303;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 310;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 317;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 324;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 331;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 338;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 345;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 352;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 359;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 366;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 373;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 380;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 387;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 394;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 401;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 408;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 415;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 422;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 429;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 436;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 443;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 450;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 457;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 464;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 471;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 478;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 485;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 492;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 499;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 506;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 513;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 520;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 527;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 534;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 541;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 548;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 555;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 562;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 569;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 576;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 583;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 590;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 597;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 604;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 611;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 618;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 625;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 632;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 639;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 646;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 653;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 660;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 667;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 674;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 681;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 688;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 695;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 702;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 709;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 716;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 723;
UPDATE calendario SET dia_nomeacao = 'Terça-Feira' WHERE id = 730;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 3;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 10;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 17;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 24;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 31;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 38;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 45;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 52;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 59;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 66;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 73;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 80;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 87;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 94;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 101;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 108;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 115;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 122;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 129;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 136;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 143;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 150;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 157;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 164;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 171;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 178;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 185;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 192;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 199;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 206;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 213;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 220;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 227;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 234;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 241;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 248;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 255;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 262;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 269;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 276;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 283;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 290;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 297;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 304;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 311;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 318;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 325;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 332;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 339;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 346;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 353;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 360;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 367;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 374;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 381;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 388;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 395;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 402;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 409;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 416;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 423;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 430;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 437;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 444;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 451;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 458;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 465;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 472;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 479;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 486;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 493;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 500;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 507;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 514;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 521;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 528;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 535;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 542;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 549;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 556;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 563;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 570;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 577;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 584;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 591;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 598;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 605;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 612;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 619;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 626;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 633;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 640;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 647;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 654;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 661;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 668;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 675;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 682;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 689;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 696;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 703;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 710;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 717;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 724;
UPDATE calendario SET dia_nomeacao = 'Quarta-Feira' WHERE id = 731;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 4;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 11;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 18;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 25;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 32;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 39;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 46;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 53;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 60;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 67;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 74;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 81;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 88;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 95;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 102;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 109;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 116;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 123;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 130;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 137;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 144;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 151;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 158;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 165;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 172;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 179;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 186;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 193;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 200;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 207;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 214;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 221;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 228;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 235;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 242;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 249;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 256;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 263;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 270;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 277;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 284;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 291;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 298;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 305;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 312;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 319;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 326;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 333;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 340;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 347;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 354;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 361;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 368;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 375;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 382;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 389;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 396;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 403;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 410;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 417;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 424;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 431;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 438;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 445;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 452;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 459;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 466;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 473;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 480;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 487;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 494;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 501;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 508;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 515;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 522;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 529;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 536;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 543;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 550;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 557;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 564;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 571;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 578;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 585;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 592;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 599;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 606;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 613;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 620;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 627;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 634;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 641;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 648;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 655;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 662;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 669;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 676;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 683;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 690;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 697;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 704;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 711;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 718;
UPDATE calendario SET dia_nomeacao = 'Quinta-Feira' WHERE id = 725;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 5;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 12;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 19;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 26;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 33;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 40;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 47;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 54;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 61;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 68;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 75;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 82;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 89;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 96;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 103;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 110;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 117;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 124;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 131;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 138;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 145;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 152;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 159;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 166;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 173;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 180;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 187;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 194;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 201;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 208;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 215;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 222;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 229;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 236;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 243;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 250;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 257;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 264;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 271;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 278;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 285;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 292;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 299;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 306;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 313;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 320;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 327;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 334;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 341;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 348;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 355;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 362;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 369;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 376;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 383;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 390;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 397;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 404;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 411;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 418;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 425;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 432;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 439;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 446;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 453;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 460;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 467;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 474;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 481;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 488;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 495;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 502;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 509;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 516;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 523;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 530;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 537;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 544;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 551;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 558;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 565;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 572;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 579;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 586;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 593;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 600;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 607;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 614;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 621;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 628;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 635;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 642;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 649;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 656;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 663;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 670;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 677;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 684;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 691;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 698;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 705;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 712;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 719;
UPDATE calendario SET dia_nomeacao = 'Sexta-Feira' WHERE id = 726;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 6;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 13;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 20;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 27;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 34;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 41;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 48;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 55;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 62;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 69;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 76;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 83;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 90;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 97;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 104;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 111;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 118;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 125;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 132;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 139;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 146;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 153;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 160;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 167;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 174;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 181;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 188;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 195;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 202;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 209;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 216;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 223;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 230;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 237;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 244;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 251;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 258;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 265;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 272;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 279;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 286;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 293;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 300;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 307;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 314;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 321;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 328;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 335;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 342;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 349;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 356;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 363;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 370;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 377;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 384;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 391;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 398;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 405;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 412;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 419;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 426;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 433;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 440;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 447;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 454;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 461;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 468;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 475;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 482;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 489;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 496;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 503;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 510;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 517;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 524;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 531;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 538;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 545;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 552;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 559;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 566;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 573;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 580;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 587;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 594;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 601;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 608;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 615;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 622;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 629;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 636;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 643;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 650;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 657;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 664;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 671;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 678;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 685;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 692;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 699;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 706;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 713;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 720;
UPDATE calendario SET dia_nomeacao = 'Sábado' WHERE id = 727;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 7;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 14;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 21;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 28;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 35;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 42;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 49;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 56;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 63;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 70;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 77;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 84;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 91;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 98;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 105;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 112;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 119;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 126;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 133;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 140;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 147;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 154;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 161;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 168;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 175;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 182;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 189;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 196;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 203;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 210;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 217;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 224;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 231;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 238;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 245;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 252;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 259;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 266;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 273;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 280;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 287;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 294;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 301;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 308;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 315;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 322;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 329;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 336;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 343;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 350;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 357;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 364;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 371;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 378;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 385;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 392;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 399;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 406;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 413;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 420;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 427;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 434;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 441;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 448;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 455;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 462;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 469;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 476;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 483;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 490;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 497;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 504;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 511;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 518;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 525;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 532;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 539;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 546;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 553;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 560;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 567;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 574;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 581;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 588;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 595;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 602;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 609;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 616;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 623;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 630;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 637;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 644;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 651;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 658;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 665;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 672;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 679;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 686;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 693;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 700;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 707;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 714;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 721;
UPDATE calendario SET dia_nomeacao = 'Domingo' WHERE id = 728;

INSERT INTO reserva_atividade(atividade_id,calendario_id,data_criacao,email_modificador) VALUES
(1,165,current_timestamp(),'adm@gmail.com'),
(2,166,current_timestamp(),'adm@gmail.com'),
(3,166,current_timestamp(),'adm@gmail.com'),
(4,167,current_timestamp(),'adm@gmail.com'),
(5,168,current_timestamp(),'adm@gmail.com');

INSERT INTO nivel_urgencia(nivel) VALUES
('Baixa'),
('Média'),
('Alta');

INSERT INTO assunto_requisicao(assunto) VALUES
('Cestas'),
('Vestuário'),
('Saúde e Bem-estar'),
('Outros');

INSERT INTO requisicoes(usuario_id,situacao_id,calendario_id,nivel_urgencia_id,assunto_requisicao_id,data_criacao,email_modificador) VALUES
(1,5,1,1,1,current_timestamp(),'adm@gmail.com'),
(1,5,17,1,1,current_timestamp(),'adm@gmail.com'),
(1,6,90,3,1,current_timestamp(),'adm@gmail.com');

INSERT INTO requisicoes(usuario_id,situacao_id,calendario_id,nivel_urgencia_id,assunto_requisicao_id,data_criacao,email_modificador) VALUES
(1,5,91,2,2,current_timestamp(),'adm@gmail.com'),
(1,5,132,2,2,current_timestamp(),'adm@gmail.com'),
(1,6,180,1,2,current_timestamp(),'adm@gmail.com');

INSERT INTO requisicoes(usuario_id,situacao_id,calendario_id,nivel_urgencia_id,assunto_requisicao_id,data_criacao,email_modificador) VALUES
(1,5,181,1,3,current_timestamp(),'adm@gmail.com'),
(1,6,197,1,3,current_timestamp(),'adm@gmail.com'),
(1,6,270,3,3,current_timestamp(),'adm@gmail.com');

INSERT INTO requisicoes(usuario_id,situacao_id,calendario_id,nivel_urgencia_id,assunto_requisicao_id,data_criacao,email_modificador) VALUES
(1,6,271,1,4,current_timestamp(),'adm@gmail.com'),
(1,6,293,1,4,current_timestamp(),'adm@gmail.com'),
(1,6,360,3,4,current_timestamp(),'adm@gmail.com');


