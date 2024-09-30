DROP PROCEDURE IF EXISTS sp_Sel_Produtos
GO
CREATE PROCEDURE sp_Sel_Produtos
AS
BEGIN
    SELECT 
        ID_Produto,
        Nm_Produto,
        Ds_Produto,
        Vl_Preco,
        Ds_Categoria,
        Qt_Quantidade,
        St_Ativo
    FROM 
        TB_Produtos
    WHERE 
        St_Ativo = 'A';
END;
GO
