DROP PROCEDURE IF EXISTS sp_Del_Produto
GO
CREATE PROCEDURE sp_Del_Produto
    @ID_Produto INT
AS
BEGIN
    UPDATE TB_Produtos
    SET 
        St_Ativo = 'I'
    WHERE 
        ID_Produto = @ID_Produto;
END;
GO
