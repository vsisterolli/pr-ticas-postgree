SELECT 
    * 
FROM 
    clientes 
WHERE 
    id 
NOT IN 
    (SELECT 
        id 
    FROM 
        compras);