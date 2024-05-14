--Góllövő lista:
SELECT j.jatekos_nev AS 'Játékos neve',
       COUNT(*) AS 'Gólok száma'
FROM gol g
	JOIN jatekos j ON g.jatekosid = j.jatekosid 
WHERE ongol_e = 0
GROUP BY j.jatekos_nev
ORDER BY 2 DESC