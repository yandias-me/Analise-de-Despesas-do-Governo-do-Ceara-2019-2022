# Analise-de-Despesas-do-Governo-do-Ceara-2019-2022

Para este projeto foram escolhidas 3 unidades de negócio (dimensões) para realizar a análise das despesas que foram: Item Elemento, Item Categoria e Unidade Gestora (Orgão), para cada unidade de negocio foi análisado os valores de despesas empenhados e valores de despesas pagos.

# Análise Exploratória
O primeiro passo a ser realizado foi fazer a análise exploratória dos dados de origem inicialmente apresentados atraves de consultas SQL no PgAdmin(PostgreSQL) descritas no arquivo análise_exploratoria.sql, esse passo teve como finalidade:
- Verificar o total de campos preenchidos no banco de dados tanto para as datas, descrições, códigos de cada unidade de negócio (dimensão), valores de empenho e pagamento e seus códigos e quantos desses campos estavam nulos ("null").
- Verificar se havia algum erro nas datas, descrições, valores e códigos como por exemplo descrições incompletas, erradas, com espaços, descrições desatualizadas, datas erradas, casos de duplicidade tanto para descrições como para códigos.
- Verificação de quantidades de cada unidade de negócio e sua descrição em cada ano , essa consulta foi feita com o intuito de verificar qual a descrição mais atual da unidade de negócio e que tem maior quantidade de registros.
- Verificação dos valores de empenho e pagamento

# Tratamento dos Dados
O segundo passo é a realização do tratamento dos dados através de comandos SQL no PgAdmin(PostgreSQL) descritos no arquivo tratamento_dados.sql, esse passo teve como principal finalidade corrigir as inconsistências encontradas durante o etapa de análise exploratória dos dados, todas as inconsistencias encontradas e como foi feito o tratamento delas está descrito no arquivo Tratamento_dos_Dados.docx

# Criação de Tabelas Fato e Dimensão (Data Warehouse)
O terceiro passo foi a criação das tabelas fato e dimensão via comandos SQL no PgAdmin(PostgreSQL) descritos no arquivo efd_trb_tabelas_fato_dimensao.sql para o Data Warehouse, fazendo a modelagem dos dados utilizando o esquema estrela que organiza informações em uma tabela central de fatos cercada por tabelas de dimensões, o esquema estrela foi escolhido por conta que ele permite um desempenho melhor na hora de realizar consultas SQL e também pela simplicidade do modelo ficando mais facil a visualização das relações entre as tabelas do banco de dados.

# Inserção dos dados tratados no Data Warehouse
O quarto passo foi a inserção dos dados tratados via comandos SQL no PgAdmin(PostgreSQL) descritos no arquivo insercao_dados.sql dentro das tabelas criadas no Data Warehouse.

# Criação dos Dashboards no Power BI
O quinto e ultimo passo foi a criação dos Dashboards no Power BI confrome apresentado no arquivo Análise de Despesas do Governo do Ceará.pbix, foi feita a conexão do Power BI com o PostgreSQL e assim montado o relatório final em quatro abas:
- Empenho Mês e Ano: mostra uma análise geral dos valores de despesas empenhados e pagos ao longo a partir do ano de 2019 até o ano de 2022
- Empenho Categoria: mostra a análise dos valores de despesas empenhados e pagos por categorias de despesa a partir do ano de 2019 até o ano de 2022
- Empenho Orgão: mostra a análise dos valores de despesas empenhados e pagos por orgão a partir do ano de 2019 até o ano de 2022
- Empenho Elemento: mostra a análise dos valores de despesas empenhados e pagos por elemento de despesa a partir do ano de 2019 até o ano de 2022

# Extra: Views
Como passo extra, foram feitas tabelas virtuais conforme apresentado no arquivo views.sql de cada unidade de negócio com seus valores de despesa empenhados e pagos por mês e ano assim como os valores gerais de despesa empenhados e pagos por mês e ano
 

