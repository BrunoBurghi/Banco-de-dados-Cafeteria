DROP PROCEDURE IF EXISTS sp_Sel_Mapa
GO
CREATE PROCEDURE sp_Sel_Mapa
AS
BEGIN
    SELECT 
        ID_Produto,
        Nm_Produto AS Produto,
        Ds_Produto,
        Vl_Preco,
        Ds_Categoria,
        Qt_Quantidade AS Estoque
    FROM 
        TB_Produtos
    WHERE 
        St_Ativo = 'A';
END;
GO
