-- -----------------------------------------------------------
    
SELECT DISTINCT cargos.nome_cargo,
       COUNT(servidores.id_cargo) AS "Quantidade"
  FROM cargos
  INNER JOIN servidores 
    ON cargos.id_cargo = servidores.id_cargo
 WHERE cargos.nome_cargo LIKE 'PROF%' AND servidores.excluido = false 
GROUP BY cargos.nome_cargo

-- -----------------------------------------------------------



