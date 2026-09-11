-------------------------CRIANDO VIEW PARA VALOR DE EMPENHO POR ANO----------------------------
CREATE OR REPLACE VIEW data_warehouse.view_empenho_ano_mes
AS
SELECT mes, ano, SUM(valor_empenho)::money as total_empenho, SUM(valor_pago)::money as valor_pago
FROM (
SELECT id_orgao, cod_ne, dt.mes, dt.ano, valor_empenho, SUM(valor_pago) as valor_pago
FROM data_warehouse.fato_execucao_financeira fef
INNER JOIN data_warehouse.dim_tempo dt on dt.id = fef.id_data_empenho
LEFT JOIN data_warehouse.dim_tempo dtp on dtp.id = fef.id_data_pagamento
GROUP BY id_orgao, cod_ne, dt.mes, dt.ano, valor_empenho
) tb
GROUP BY mes, ano;

-------------------------CRIANDO VIEW PARA VALORES DE CATEGORIA--------------------------------
CREATE OR REPLACE VIEW data_warehouse.view_categoria_valores
AS
SELECT mes, ano, dsc_item_categoria, SUM(valor_empenho)::money as valor_empenho, sum(valor_pago)::money as valor_pago
FROM (
SELECT dt.mes, dt.ano,fef.id_orgao, fef.cod_ne, dic.dsc_item_categoria, fef.valor_empenho, sum(fef.valor_pago) AS valor_pago
FROM data_warehouse.fato_execucao_financeira fef
INNER JOIN data_warehouse.dim_tempo dt ON dt.id = fef.id_data_empenho
INNER JOIN data_warehouse.dim_item_categoria dic ON dic.id = fef.id_item_categoria
GROUP BY dt.mes, dt.ano,fef.id_orgao, fef.cod_ne, dic.dsc_item_categoria, fef.valor_empenho) tb
GROUP BY mes, ano, dsc_item_categoria;

-------------------------CRIANDO VIEW PARA VALORES DE ELEMENTO--------------------------------
CREATE OR REPLACE VIEW data_warehouse.view_elemento_valores
AS
SELECT mes, ano, dsc_item_elemento, SUM(valor_empenho)::money as valor_empenho, sum(valor_pago)::money as valor_pago
FROM (
SELECT dt.mes, dt.ano,fef.id_orgao, fef.cod_ne, die.dsc_item_elemento, fef.valor_empenho, sum(fef.valor_pago) AS valor_pago
FROM data_warehouse.fato_execucao_financeira fef
INNER JOIN data_warehouse.dim_tempo dt ON dt.id = fef.id_data_empenho
INNER JOIN data_warehouse.dim_item_elemento die ON die.id = fef.id_item_elemento
GROUP BY dt.mes, dt.ano,fef.id_orgao, fef.cod_ne, die.dsc_item_elemento, fef.valor_empenho) tb
GROUP BY mes, ano, dsc_item_elemento;

-------------------------CRIANDO VIEW PARA VALORES DE ORGÃO--------------------------------
CREATE OR REPLACE VIEW data_warehouse.view_orgao_valores
AS
SELECT mes, ano, dsc_orgao, SUM(valor_empenho)::money as valor_empenho, sum(valor_pago)::money as valor_pago
FROM (
SELECT dt.mes, dt.ano,fef.id_orgao, fef.cod_ne, dio.dsc_orgao, fef.valor_empenho, sum(fef.valor_pago) AS valor_pago
FROM data_warehouse.fato_execucao_financeira fef
INNER JOIN data_warehouse.dim_tempo dt ON dt.id = fef.id_data_empenho
INNER JOIN data_warehouse.dim_orgao dio ON dio.id = fef.id_orgao
GROUP BY dt.mes, dt.ano,fef.id_orgao, fef.cod_ne, dio.dsc_orgao, fef.valor_empenho) tb
GROUP BY mes, ano, dsc_orgao;