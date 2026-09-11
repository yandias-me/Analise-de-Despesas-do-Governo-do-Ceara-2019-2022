----------TRATAMENTO DE DADOS DIM_ITEM_CATEGORIA------------------------------
UPDATE public.execucao_financeira_despesa
SET dsc_item_categoria = 'DESPESAS DE CAPITAL'
WHERE dsc_item_categoria ='DESPESA DE CAPITAL';

UPDATE public.execucao_financeira_despesa
SET dsc_item_categoria = 'DESPESAS CORRENTES'
WHERE dsc_item_categoria ='DESPESA CORRENTE';

----------TRATAMENTO DE DADOS DIM_ORGAO------------------------------
UPDATE public.execucao_financeira_despesa
SET dsc_orgao = 'NAO INFORMADO'
WHERE dsc_orgao is null;

UPDATE public.execucao_financeira_despesa
SET dsc_orgao = 'FUNDO DE PREVIDENCIA PARLAMENTAR DA ASSEMB LEGISL DO CE'
WHERE codigo_orgao='010101';

UPDATE public.execucao_financeira_despesa
SET dsc_orgao = 'FUNDO DE INVESTIMENTOS DE MICROCREDITO PRODUTIVO DO CEARA'
WHERE codigo_orgao='561001';

UPDATE public.execucao_financeira_despesa
SET dsc_orgao = 'FUNDO DE DEFESA AGROPECUARIO DO ESTADO DO CEARA'
WHERE codigo_orgao='561101';

UPDATE public.execucao_financeira_despesa
SET dsc_orgao = 'FUNDO DE DEFESA AGROPECUARIO DO ESTADO DO CEARA'
WHERE codigo_orgao='561101';

UPDATE public.execucao_financeira_despesa
SET dsc_orgao = 'SECRETARIA DO DESENVOLVIMENTO ECONÔMICO E TRABALHO'
WHERE codigo_orgao='560001';

UPDATE public.execucao_financeira_despesa
SET dsc_orgao = 'FUNDACAO NUCLEO DE TECNOLOGIA INDUSTRIAL DO CEARA'
WHERE codigo_orgao='310601';

UPDATE public.execucao_financeira_despesa
SET codigo_orgao = '228602'
WHERE codigo_orgao='228502';

UPDATE public.execucao_financeira_despesa
SET codigo_orgao = '228399'
WHERE codigo_orgao='228412';

UPDATE public.execucao_financeira_despesa
SET codigo_orgao = '228544'
WHERE codigo_orgao='228566';

UPDATE public.execucao_financeira_despesa
SET codigo_orgao = '228342'
WHERE codigo_orgao='228108';

UPDATE public.execucao_financeira_despesa
SET codigo_orgao = '228342'
WHERE codigo_orgao='228545';

UPDATE public.execucao_financeira_despesa
SET codigo_orgao = '228342'
WHERE codigo_orgao='228613';

UPDATE public.execucao_financeira_despesa
SET codigo_orgao= '228348'
WHERE codigo_orgao= '228606';

----------TRATAMENTO DE DADOS DIM_ITEM_ELEMENTO------------------------------
UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento = UPPER (dsc_item_elemento);

UPDATE public.execucao_financeira_despesa
SET cod_item_elemento = UPPER (cod_item_elemento);

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento = TRIM (dsc_item_elemento);

UPDATE public.execucao_financeira_despesa
SET cod_item_elemento = 'NÃO INFORMADO para 2022', dsc_item_elemento = 'NÃO INFORMADO para 2022'
WHERE cod_item_elemento is null AND dsc_item_elemento is null;

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'PENSÕES ESPECIAIS'
WHERE cod_item_elemento= '59';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'CONSTITUIÇÃO OU AUMENTO DE CAPITAL DE EMPRESAS'
WHERE cod_item_elemento= '65';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'CONTRIBUIÇÃO A ENTIDADES FECHADAS DE PREVIDENCIA'
WHERE cod_item_elemento= '07';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'DESPESAS DECORRENTES DE CONTRATO DE PARCERIA PÚBLICO-PRIVADA - PPP EXCETO SUBVENÇÕES ECONÔMICAS APORTE E FUNDO GARANTIDOR'
WHERE cod_item_elemento= '83';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'OUTRAS DESPESAS DE PESSOAL DECORRENTES DE CONTRATOS DE TERCEIRIZAÇÃO'
WHERE cod_item_elemento= '34';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'OUTRAS DESPESAS VARIÁVEIS - PESSOAL CIVIL'
WHERE cod_item_elemento= '16';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'OUTROS AUXÍLIOS FINANCEIROS A PESSOAS FÍSICAS'
WHERE cod_item_elemento= '48';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'OUTROS BENEFÍCIOS ASSISTENCIAIS DO SERVIDOR OU DO MILITAR'
WHERE cod_item_elemento= '08';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'OUTROS BENEFÍCIOS PREVIDENCIÁRIOS DO SERVIDOR OU DO MILITAR'
WHERE cod_item_elemento= '05';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'OUTROS ENCARGOS SOBRE A DÍVIDA POR CONTRATO'
WHERE cod_item_elemento= '22';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'OUTROS SERVIÇOS DE TERCEIROS - PESSOA FÍSICA'
WHERE cod_item_elemento= '36';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'OUTROS SERVIÇOS DE TERCEIROS - PESSOA JURÍDICA'
WHERE cod_item_elemento= '39';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'PREMIAÇÕES CULTURAIS, ARTÍSTICAS, CIENTÍFICAS, DESPORTIVAS E OUTRAS'
WHERE cod_item_elemento= '31';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'RATEIO PELA PARTICIPAÇÃO EM CONSÓRCIO PÚBLICO'
WHERE cod_item_elemento= '70';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'RESSARCIMENTO DE DESPESAS DE PESSOAL REQUISITADO'
WHERE cod_item_elemento= '96';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'VENCIMENTOS E VANTAGENS FIXAS - PESSOAL MILITAR'
WHERE cod_item_elemento= '12';

UPDATE public.execucao_financeira_despesa
SET dsc_item_elemento= 'VENCIMENTOS E VANTAGENS FIXAS - PESSOAL CIVIL'
WHERE cod_item_elemento= '11';

----------TRATAMENTO DE DADOS EMPENHO E PAGAMENTO------------------------------
UPDATE public.execucao_financeira_despesa
SET cod_np= 'SEM REGISTRO'
WHERE cod_np is null;

UPDATE public.execucao_financeira_despesa
SET vlr_liquidado= 0
WHERE vlr_liquidado is null;

UPDATE public.execucao_financeira_despesa
SET valor_pago= 0
WHERE valor_pago is null;