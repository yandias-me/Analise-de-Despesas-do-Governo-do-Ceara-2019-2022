----------CRIANDO NOVO SCHEMA DATAWAREHOUSE PARA DA_18_TRABALHO_MODULOSQL---------------------

create schema data_warehouse;

------------CRIAÇÃO DE TABELAS FATO E DIMENSAO----------------------
create table data_warehouse.dim_item_elemento(
id serial primary key,
cod_item_elemento character varying,
dsc_item_elemento character varying
);

create table data_warehouse.dim_orgao(
id serial primary key,
codigo_orgao character varying,
dsc_orgao character varying
);

create table data_warehouse.dim_item_categoria(
id serial primary key,
cod_item_categoria character varying,
dsc_item_categoria character varying
);


create table data_warehouse.dim_tempo(
id serial primary key,
data_inteira date,
ano text,
mes text,
dia text
);

create table data_warehouse.fato_execucao_financeira(
id serial primary key,
id_orgao integer references data_warehouse.dim_orgao(id),
id_data_empenho integer references data_warehouse.dim_tempo(id),
id_data_pagamento integer references data_warehouse.dim_tempo(id),
id_item_elemento integer references data_warehouse.dim_item_elemento(id),
id_item_categoria integer references data_warehouse.dim_item_categoria(id),
cod_ne text,
cod_np text,
valor_empenho numeric(18,2),
valor_liquidado numeric(18,2),
valor_pago numeric(18,2),
valor_resto_pagar numeric(18,2)
);

