DROP PROCEDURE IF EXISTS sp_Ins_Produto
GO
CREATE PROCEDURE sp_Ins_Produto
    @Nm_Produto NVARCHAR(100),
    @Ds_Produto NVARCHAR(255),
    @Vl_Preco DECIMAL(10, 2),
    @Ds_Categoria NVARCHAR(50),
    @Qt_Quantidade INT
AS
BEGIN
    INSERT INTO TB_Produtos (Nm_Produto, Ds_Produto, Vl_Preco, Ds_Categoria, Qt_Quantidade)
    VALUES (@Nm_Produto, @Ds_Produto, @Vl_Preco, @Ds_Categoria, @Qt_Quantidade);
END;
GO
