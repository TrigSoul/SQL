SELECT
	`id`,
	`num_pavadinimas`,
	`ilgumas`,
	`id_pradinis_miestas`,
	`id_galutinis_miestas`,
	`atstumas_keliai`,
    ABS(ilgumas - miestai_atstumai.atstumas_keliai) AS `skirt`
FROM
	`keliai`
	
LEFT JOIN `miestai_atstumai` ON
(
    keliai.id_pradinis_miestas = miestai_atstumai.id_miesto1
    AND
    keliai.id_galutinis_miestas = miestai_atstumai.id_miesto2
)
WHERE
	ABS(ilgumas - miestai_atstumai.atstumas_keliai) >= 2
	
/*UPDATE `miestai_atstumai` SET `id_miesto1`=2 WHERE 1*/ 