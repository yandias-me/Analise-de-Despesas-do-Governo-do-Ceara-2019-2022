----------------INSERÇÃO DE DADOS DIMENSÃO TEMPO----------------------------------
INSERT INTO data_warehouse.dim_tempo( data_inteira, ano, mes, dia)
SELECT
dt as data_inteira,
EXTRACT(YEAR FROM dt) AS ano,
EXTRACT(MONTH FROM dt) AS mes,
EXTRACT(DAY FROM dt) AS dia
FROM generate_series
(CURRENT_DATE - INTERVAL '30 years', 
CURRENT_DATE + INTERVAL '5 years', 
INTERVAL '1 day') AS dt;

----------------INSERÇÃO DE DADOS DIMENSÃO ITEM CATEGORIA-------------------------
INSERT INTO data_warehouse.dim_item_categoria (cod_item_categoria, dsc_item_categoria)
SELECT DISTINCT cod_item_categoria, dsc_item_categoria
FROM public.execucao_financeira_despesa
ORDER BY cod_item_categoria;

----------------INSERÇÃO DE DADOS DIMENSÃO ITEM ELEMENTO--------------------------
INSERT INTO data_warehouse.dim_item_elemento(cod_item_elemento, dsc_item_elemento)
SELECT DISTINCT cod_item_elemento, dsc_item_elemento
FROM public.execucao_financeira_despesa;

----------------INSERÇÃO DE DADOS DIMENSÃO ORGAO----------------------------------
INSERT INTO data_warehouse.dim_orgao (codigo_orgao, dsc_orgao)
SELECT DISTINCT codigo_orgao, dsc_orgao
FROM public.execucao_financeira_despesa;

----------------INSERÇÃO DE DADOS FATO_EXECUCAO_FINANCEIRA----------------------------------
INSERT INTO data_warehouse.fato_execucao_financeira(
id_orgao, id_data_empenho, id_data_pagamento, id_item_elemento, id_item_categoria,
cod_ne, cod_np, valor_empenho, valor_liquidado, valor_pago, valor_resto_pagar)
SELECT dor.id as id_orgao, dt_empenho.id as id_data_empenho, dt_pagamento.id as id_data_pagamento, die.id as id_item_elemento, dic.id as id_item_categoria,
cod_ne, cod_np, vlr_empenho as valor_empenho, vlr_liquidado as valor_liquidado, valor_pago, vlr_resto_pagar as valor_resto_pagar
FROM public.execucao_financeira_despesa efd
INNER JOIN data_warehouse.dim_orgao dor on dor.codigo_orgao = efd.codigo_orgao
INNER JOIN data_warehouse.dim_tempo dt_empenho on dt_empenho.data_inteira = efd.dth_empenho
LEFT JOIN data_warehouse.dim_tempo dt_pagamento on dt_pagamento.data_inteira = efd.dth_pagamento
INNER JOIN data_warehouse.dim_item_categoria dic on dic.cod_item_categoria = efd.cod_item_categoria
INNER JOIN data_warehouse.dim_item_elemento die on die.cod_item_elemento = efd.cod_item_elemento;