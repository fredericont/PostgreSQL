SELECT DISTINCT nome_disciplina_ingresso AS "Disciplina",
 COUNT (servidores.id_cargo) AS "Quantidade"
  FROM disciplinas_ingresso
 INNER JOIN servidores
    ON servidores.id_disciplina_ingresso = disciplinas_ingresso.id_disciplina_ingresso
 INNER JOIN cargos
    ON servidores.id_cargo = cargos.id_cargo
WHERE cargos.nome_cargo LIKE 'PROF%' AND servidores.excluido = false AND cargos.nome_cargo IS NOT NULL 
GROUP BY nome_disciplina_ingresso