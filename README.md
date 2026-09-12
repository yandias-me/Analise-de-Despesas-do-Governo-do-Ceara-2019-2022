# Analise-de-Despesas-do-Governo-do-Ceara-2019-2022

Para este projeto foram escolhidas 3 unidades de negócio (dimensões) para realizar a análise das despesas que foram: Item Elemento, Item Categoria e Unidade Gestora (Orgão), para cada unidade de negocio foi análisado os valores de despesas empenhados e valores de despesas pagos.

# Análise Exploratória
O primeiro passo a ser realizado foi fazer a análise exploratória os dados de origem inicialmente apresentados atraves de consultas SQL descritas no arquivo análise_exploratoria.sql, esse passo teve como finalidade:
- Verificar o total de campos preenchidos no banco de dados tanto para as datas, descrições, códigos de cada unidade de negócio (dimensão), valores de empenho e pagamento e seus códigos e quantos desses campos estavam nulos ("null").
- Verificar se havia algum erro nas datas, descrições, valores e códigos como por exemplo descrições incompletas, erradas, com espaços, descrições desatualizadas, datas erradas, casos de duplicidade tanto para descrições como para códigos.
- Verificação de quantidades de cada unidade de negócio e sua descrição em cada ano , essa consulta foi feita com o intuito de verificar qual a descrição mais atual da unidade de negócio e que tem maior quantidade de registros.
- Verificação dos valores de empenho e pagamento

# Tratamento dos Dados
O segundo passo é a realização do tratamento dos dados através de comandos SQL descritos no arquivo tratamento_dados.sql, esse passo teve como principal finalidade corrigir as inconsistências encontradas durante o etapa de análise exploratória dos dados, todas as inconsistencias encontradas e como foi feito o tratamento delas está descrito no arquivo Tratamento_dos_Dados.docx

# Criação de Tabelas Fato e Dimensão
O terceiro passo foi a criação das tabelas fato e dimensão utilizando o schema estrela
 

