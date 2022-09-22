
 
 -- -----------------------------------------------------------

  SELECT servidores.matricula, 
        servidores.email, 
		servidores.nome,
		cargos.nome_cargo,
		disciplinas_ingresso.nome_disciplina_ingresso,
		campus.nome_campus
   FROM servidores
   LEFT JOIN cargos
  	ON servidores.matricula = cargos.nome_cargo
   LEFT JOIN disciplinas_ingresso
    ON servidores.matricula = disciplinas_ingresso.nome_disciplina_ingresso
   LEFT JOIN campus
    ON servidores.matricula = campus.nome_campus

  -- ----------------------------------------------------------- 