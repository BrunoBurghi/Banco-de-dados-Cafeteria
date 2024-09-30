DROP PROCEDURE IF EXISTS sp_Upd_Produto
GO
CREATE PROCEDURE sp_Upd_Produto
    @ID_Produto INT,
    @Nm_Produto NVARCHAR(100),
    @Ds_Produto NVARCHAR(255),
    @Vl_Preco DECIMAL(10, 2),
    @Ds_Categoria NVARCHAR(50),
    @Qt_Quantidade INT
AS
BEGIN
    UPDATE TB_Produtos
    SET 
        Nm_Produto = @Nm_Produto,
        Ds_Produto = @Ds_Produto,
        Vl_Preco = @Vl_Preco,
        Ds_Categoria = @Ds_Categoria,
        Qt_Quantidade = @Qt_Quantidade
    WHERE 
        ID_Produto = @ID_Produto
        AND St_Ativo = 'A';
END;
GO
