
USE TFG;

CREATE VIEW requisicoes_total AS
SELECT id,assunto_requisicao_id,situacao_id,calendario_id FROM requisicoes WHERE situacao_id = 5 OR situacao_id = 6;

CREATE VIEW requisicoes_aberta AS
SELECT id,assunto_requisicao_id,situacao_id,calendario_id FROM requisicoes WHERE situacao_id = 5;

CREATE VIEW requisicoes_cumpridas AS
SELECT id,assunto_requisicao_id,situacao_id,calendario_id FROM requisicoes WHERE situacao_id = 6;
    
CREATE VIEW requisicoes_total_mes AS
SELECT 
	requisicoes_total.id AS numeracao,
    requisicoes_total.assunto_requisicao_id,
    requisicoes_total.situacao_id,
    requisicoes_total.calendario_id,
    calendario.*
FROM requisicoes_total JOIN calendario ON requisicoes_total.calendario_id = calendario.id;

CREATE VIEW grafico_mes AS
SELECT 
    SUM(CASE WHEN mes_numeracao = 1 THEN 1 ELSE 0 END) AS JANEIRO,
    SUM(CASE WHEN mes_numeracao = 2 THEN 1 ELSE 0 END) AS FEVEREIRO,
    SUM(CASE WHEN mes_numeracao = 3 THEN 1 ELSE 0 END) AS MARCO,
    SUM(CASE WHEN mes_numeracao = 4 THEN 1 ELSE 0 END) AS ABRIL,
    SUM(CASE WHEN mes_numeracao = 5 THEN 1 ELSE 0 END) AS MAIO,
    SUM(CASE WHEN mes_numeracao = 6 THEN 1 ELSE 0 END) AS JUNHO,
    SUM(CASE WHEN mes_numeracao = 7 THEN 1 ELSE 0 END) AS JULHO,
    SUM(CASE WHEN mes_numeracao = 8 THEN 1 ELSE 0 END) AS AGOSTO,
    SUM(CASE WHEN mes_numeracao = 9 THEN 1 ELSE 0 END) AS SETEMBRO,
    SUM(CASE WHEN mes_numeracao = 10 THEN 1 ELSE 0 END) AS OUTUBRO,
    SUM(CASE WHEN mes_numeracao = 11 THEN 1 ELSE 0 END) AS NOVEMBRO,
    SUM(CASE WHEN mes_numeracao = 12 THEN 1 ELSE 0 END) AS DEZEMBRO
FROM requisicoes_total_mes;

SELECT * FROM grafico_mes;


