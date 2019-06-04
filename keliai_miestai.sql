SELECT 
	`miestai`.`pavadinimas`,
   	`gyventoju_skaicius`,
	`plotas`,
	`num_pavadinimas`,
	`ilgumas`
    
FROM
	`miestai`
	
LEFT JOIN `keliai_miestai` ON
(
    `keliai_miestai`.`id_miesto` = `miestai`.`id` 
)
LEFT JOIN `keliai` ON
(
    `keliai`.`id` = `keliai_miestai`.`id_kelio`
)
WHERE 1