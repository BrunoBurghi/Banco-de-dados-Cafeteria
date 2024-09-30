DROP PROCEDURE IF EXISTS sp_LatCafes_Ambiente
GO
CREATE PROCEDURE sp_LatCafes_Ambiente
AS
BEGIN
    -- Verificação e exclusão das tabelas existentes
    DROP TABLE IF EXISTS TB_Telefones;
    DROP TABLE IF EXISTS TB_Enderecos;
    DROP TABLE IF EXISTS TB_Clientes;
    DROP TABLE IF EXISTS TB_Produtos;
    DROP TABLE IF EXISTS TB_Pedidos;
    DROP TABLE IF EXISTS TB_ItensPedido;

    -- Criação da tabela Clientes
    CREATE TABLE TB_Clientes (
        ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
        Nm_Cliente NVARCHAR(100) NOT NULL,
        CPF_CNPJ NVARCHAR(14) NOT NULL UNIQUE,
        Ds_Email NVARCHAR(100)
    );

    -- Criação da tabela Enderecos
    CREATE TABLE TB_Enderecos (
        ID_Endereco INT IDENTITY(1,1) PRIMARY KEY,
        ID_Cliente INT NOT NULL,
        Ds_Rua NVARCHAR(255),
        Ds_Bairro NVARCHAR(100),
        Ds_Cidade NVARCHAR(100),
        Ds_Complemento NVARCHAR(255),
        Nr_CEP NVARCHAR(10),
        Ds_UF NVARCHAR(2),
        CONSTRAINT FK_Enderecos_Clientes FOREIGN KEY (ID_Cliente) REFERENCES TB_Clientes(ID_Cliente)
    );

    -- Criação da tabela Telefones
    CREATE TABLE TB_Telefones (
        ID_Telefone INT IDENTITY(1,1) PRIMARY KEY,
        ID_Cliente INT NOT NULL,
        Nr_Telefone NVARCHAR(15),
        CONSTRAINT FK_Telefones_Clientes FOREIGN KEY (ID_Cliente) REFERENCES TB_Clientes(ID_Cliente)
    );

    -- Criação da tabela Produtos
    CREATE TABLE TB_Produtos (
        ID_Produto INT IDENTITY(1,1) PRIMARY KEY,
        Nm_Produto NVARCHAR(100) NOT NULL,
        Ds_Produto NVARCHAR(255),
        Vl_Preco DECIMAL(10, 2) NOT NULL,
        Ds_Categoria NVARCHAR(50),
        Qt_Quantidade INT NOT NULL,
        St_Ativo VARCHAR(1) DEFAULT 'A'
    );

    -- Criação da tabela Pedidos
    CREATE TABLE TB_Pedidos (
        ID_Pedido INT IDENTITY(1,1) PRIMARY KEY,
        ID_Cliente INT NOT NULL,
        Dt_Pedido DATETIME NOT NULL DEFAULT GETDATE(),
        Ds_Status NVARCHAR(50),
        CONSTRAINT FK_Pedidos_Clientes FOREIGN KEY (ID_Cliente) REFERENCES TB_Clientes(ID_Cliente)
    );

    -- Criação da tabela ItensPedido
    CREATE TABLE TB_ItensPedido (
        ID_ItemPedido INT IDENTITY(1,1) PRIMARY KEY,
        ID_Pedido INT NOT NULL,
        ID_Produto INT NOT NULL,
        Qt_Quantidade INT NOT NULL,
        Vl_PrecoUnitario DECIMAL(10, 2) NOT NULL,
        CONSTRAINT FK_ItensPedido_Pedidos FOREIGN KEY (ID_Pedido) REFERENCES TB_Pedidos(ID_Pedido),
        CONSTRAINT FK_ItensPedido_Produtos FOREIGN KEY (ID_Produto) REFERENCES TB_Produtos(ID_Produto)
    );
END;