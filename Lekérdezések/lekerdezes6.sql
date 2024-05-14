--Melyik edző hány 11-est taktikázott ki? 
--Mi az edzők nemzetiségi kódja? 
SELECT DISTINCT e.edzo_nev AS 'Edző név',
       n.orszag_rovidites AS 'Ország kód',
       COUNT(g.golid) OVER(PARTITION BY e.edzoid) AS '11-esek száma'
FROM edzo e 
	JOIN csapat cs ON e.csapatid = cs.csapatid
    JOIN nemzetiseg n ON e.nemzetisegid = n.nemzetisegid
    JOIN jatekos j ON cs.csapatid = j.csapatid
    JOIN gol g ON j.jatekosid = g.jatekosid
WHERE g.tizenegyes_e = 1
ORDER BY 3 DESC