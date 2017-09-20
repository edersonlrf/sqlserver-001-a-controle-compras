USE controle_compras;

/* Alterando o valor padrao de uma coluna. */
ALTER TABLE COMPRAS ADD DEFAULT '0' FOR recebida;

SP_HELP COMPRAS;

/* Alterando a coluna para n�o receber NULL. */
ALTER TABLE COMPRAS ALTER COLUMN observacoes nvarchar(200) NOT NULL;

SP_HELP COMPRAS;
