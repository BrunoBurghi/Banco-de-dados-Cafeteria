DROP PROCEDURE IF EXISTS sp_LatCafes_CargaInicial
GO
CREATE PROCEDURE sp_LatCafes_CargaInicial
AS
BEGIN
    -- Inserção de dados iniciais na tabela Clientes
    INSERT INTO TB_Clientes (Nm_Cliente, CPF_CNPJ, Ds_Email)
    VALUES
    ('João Silva', '12345678901', 'joao@gmail.com'),
    ('Maria Oliveira', '23456789012', 'maria@outlook.com');

    -- Inserção de dados iniciais na tabela Enderecos
    INSERT INTO TB_Enderecos (ID_Cliente, Ds_Rua, Ds_Bairro, Ds_Cidade, Ds_Complemento, Nr_CEP, Ds_UF)
    VALUES
    (1, 'Rua A', 'Bairro A', 'Cidade A', 'Complemento A', '11111-111', 'SP'),
    (2, 'Rua B', 'Bairro B', 'Cidade B', 'Complemento B', '22222-222', 'RJ');

    -- Inserção de dados iniciais na tabela Telefones
    INSERT INTO TB_Telefones (ID_Cliente, Nr_Telefone)
    VALUES
    (1, '11980440617'),
    (2, '11980441234');

    -- Inserção de dados iniciais na tabela Produtos
    INSERT INTO TB_Produtos (Nm_Produto, Ds_Produto, Vl_Preco, Ds_Categoria, Qt_Quantidade)
    VALUES
    ('Café Expresso', 'Café expresso tradicional', 5.00, 'Bebidas', 100),
    ('Cappuccino', 'Cappuccino cremoso', 7.00, 'Bebidas', 50);
END;
GO
