----------ANALISE EXPLORATÓRIA DIMENSÃO ORGÃO-------------------------------------------------------

---TOTAIS DE CÓDIGO E DESCRIÇÃO-----
SELECT count(*) as total, count(codigo_orgao) as total_codigo, count(dsc_orgao) as total_descricao
FROM public.execucao_financeira_despesa;

---VERIFICAÇÃO DE CAMPOS NULOS-------
SELECT codigo_orgao, dsc_orgao
FROM public.execucao_financeira_despesa
WHERE dsc_orgao is null;

SELECT DISTINCT codigo_orgao, dsc_orgao
FROM public.execucao_financeira_despesa
WHERE dsc_orgao is null;

SELECT codigo_orgao, dsc_orgao
FROM public.execucao_financeira_despesa
WHERE codigo_orgao is null;

-----VERIFICAÇÃO DE DESCRIÇÃO E DUPLICIDADE--------- 
SELECT DISTINCT codigo_orgao, dsc_orgao
FROM public.execucao_financeira_despesa
ORDER BY dsc_orgao;

SELECT DISTINCT codigo_orgao, dsc_orgao
FROM public.execucao_financeira_despesa
ORDER BY codigo_orgao;

select dsc_orgao, count (distinct codigo_orgao) as qtd 
from public.execucao_financeira_despesa
group by dsc_orgao
having count(distinct codigo_orgao)>1
order by dsc_orgao;

select codigo_orgao, count (distinct dsc_orgao) as qtd 
from public.execucao_financeira_despesa
group by codigo_orgao
having count(distinct dsc_orgao)>1
order by codigo_orgao;

-----VERIFICAÇÃO DE QUANTIDADES DE CADA ORGÃO--------
select codigo_orgao, dsc_orgao, count(codigo_orgao) as qtd
from public.execucao_financeira_despesa
group by codigo_orgao, dsc_orgao
order by dsc_orgao, codigo_orgao;

-----VERIFICAÇÃO DE QUANTIDADES DE CADA ORGÃO POR ANO------
SELECT num_ano, codigo_orgao, dsc_orgao, count(*)
FROM public.execucao_financeira_despesa
GROUP BY num_ano, codigo_orgao, dsc_orgao
ORDER BY dsc_orgao;

----------ANALISE EXPLORATÓRIA DIMENSÃO ITEM CATEGORIA------------------------------

---TOTAIS DE CÓDIGO E DESCRIÇÃO-----
SELECT count(*) as total, count(cod_item_categoria) as total_codigo, count(dsc_item_categoria) as total_descricao
FROM public.execucao_financeira_despesa;

---VERIFICAÇÃO DE CAMPOS NULOS-------
SELECT cod_item_categoria, dsc_item_categoria
FROM public.execucao_financeira_despesa
WHERE dsc_item_categoria is null;

SELECT DISTINCT cod_item_categoria, dsc_item_categoria
FROM public.execucao_financeira_despesa
WHERE dsc_item_categoria is null;

SELECT cod_item_categoria, dsc_item_categoria
FROM public.execucao_financeira_despesa
WHERE cod_item_categoria is null;

-----VERIFICAÇÃO DE DESCRIÇÃO E DUPLICIDADE-------------
SELECT DISTINCT cod_item_categoria, dsc_item_categoria
FROM public.execucao_financeira_despesa
ORDER BY dsc_item_categoria;

-----VERIFICAÇÃO DE QUANTIDADES DE CADA CATEGORIA POR ANO------
SELECT num_ano, cod_item_categoria, dsc_item_categoria, count(*)
FROM public.execucao_financeira_despesa
GROUP BY num_ano, cod_item_categoria, dsc_item_categoria;

----------ANALISE EXPLORATÓRIA DIMENSÃO ITEM ELEMENTO---------------------------------------------------

---TOTAIS DE CÓDIGO E DESCRIÇÃO-----
SELECT count(*) as total, count(cod_item_elemento) as total_codigo, count(dsc_item_elemento) as total_descricao
FROM public.execucao_financeira_despesa;

---VERIFICAÇÃO DE CAMPOS NULOS-------
SELECT cod_item_elemento, dsc_item_elemento
FROM public.execucao_financeira_despesa
WHERE dsc_item_elemento is null;

SELECT DISTINCT cod_item_elemento, dsc_item_elemento
FROM public.execucao_financeira_despesa
WHERE dsc_item_elemento is null;

SELECT num_ano, cod_item_elemento, dsc_item_elemento
FROM public.execucao_financeira_despesa
WHERE cod_item_elemento is null;

-----VERIFICAÇÃO DE DESCRIÇÃO E DUPLICIDADE-------------
SELECT DISTINCT cod_item_elemento, dsc_item_elemento
FROM public.execucao_financeira_despesa
ORDER BY dsc_item_elemento;

-----VERIFICAÇÃO DE QUANTIDADES DE CADA ELEMENTO POR ANO------
SELECT num_ano, cod_item_elemento, dsc_item_elemento, count(*)
FROM public.execucao_financeira_despesa
GROUP BY num_ano, cod_item_elemento, dsc_item_elemento
ORDER BY dsc_item_elemento;


----------------ANALISE EXPLORATÓRIA DE CODIGOS E VALORES DE EMPENHO E PAGAMENTO----------------------

-----VERIFICAÇÃO DOS VALORES DE EMPENHO E PAGAMENTO-----------
SELECT cod_ne, vlr_empenho, vlr_liquidado, cod_np, valor_pago
from public.execucao_financeira_despesa;

-----VERIFICAÇÃO DE CAMPOS NULOS------------------------
SELECT cod_ne, vlr_empenho, vlr_liquidado, cod_np, valor_pago
from public.execucao_financeira_despesa
where vlr_liquidado is null;

SELECT cod_ne, vlr_empenho, vlr_liquidado, cod_np, valor_pago
from public.execucao_financeira_despesa
where cod_np is null;

SELECT cod_ne, vlr_empenho, vlr_liquidado, cod_np, valor_pago
from public.execucao_financeira_despesa
where valor_pago is null;

SELECT cod_ne, vlr_empenho, vlr_liquidado, cod_np, valor_pago
from public.execucao_financeira_despesa
where cod_ne is null;

SELECT cod_ne, vlr_empenho, vlr_liquidado, cod_np, valor_pago, vlr_resto_pagar
from public.execucao_financeira_despesa
where vlr_resto_pagar is null;

-------VERIFICAÇÃO DE DUPLICIDADE---------------
select cod_ne, count (distinct cod_ne) as qtd 
from public.execucao_financeira_despesa
group by cod_ne
having count(distinct cod_ne)>1
order by cod_ne;

select cod_np, count (distinct cod_np) as qtd 
from public.execucao_financeira_despesa
group by cod_np
having count(distinct cod_np)>1
order by cod_np;

-------CONSULTAS AUXILIARES-------------------------------------------------
SELECT num_ano, dsc_orgao, cod_item_elemento, dsc_item_elemento, sum (vlr_empenho) as total_empenho
FROM public.execucao_financeira_despesa
GROUP BY num_ano, dsc_orgao, cod_item_elemento, dsc_item_elemento
having cod_item_elemento='12'
ORDER BY dsc_orgao;

-------ANALISE EXPLORATORIA DATAS---------------------------------------------

------VERIFICAÇÃO DE VALORES NULOS-------------------
SELECT dth_empenho
from public.execucao_financeira_despesa
where dth_empenho is null;

SELECT dth_pagamento
from public.execucao_financeira_despesa
where dth_pagamento is null;

SELECT dth_pagamento
from public.execucao_financeira_despesa;

SELECT dth_empenho
from public.execucao_financeira_despesa;

select num_ano_np, dth_pagamento
from public.execucao_financeira_despesa;

---------CONSULTA VALOR CORRETO DE EMPENHO----------------------------
SELECT ano, SUM(valor_empenho)::money as total_empenho, SUM(valor_pagamento)::money as valor_pagamento
FROM (
SELECT id_orgao, cod_ne, dt.ano, valor_empenho, SUM(valor_pago) as valor_pagamento
FROM data_warehouse.fato_execucao_financeira fef
INNER JOIN data_warehouse.dim_tempo dt on dt.id = fef.id_data_empenho
LEFT JOIN data_warehouse.dim_tempo dtp on dtp.id = fef.id_data_pagamento
GROUP BY id_orgao, cod_ne, dt.ano, valor_empenho
) tb
GROUP BY ano;