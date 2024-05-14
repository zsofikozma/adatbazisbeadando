--Milyen magasak átlagosan, azok a gólszerzők, akik a hajrában szereztek gólt csapatonként? 
--Csak azokat a csapatokat mutassa, ahol az átlag több, mint 180cm!
SELECT cs.csapat_nev AS 'Csapat név',
       CONVERT(VARCHAR(5),AVG(j.magassag)) + ' cm' AS 'Magasság'
FROM gol g
	JOIN jatekos j ON g.jatekosid = j.jatekosid
    JOIN csapat cs ON j.csapatid = cs.csapatid
WHERE g.golperc >= 80
GROUP BY cs.csapat_nev
HAVING AVG(j.magassag) >= 180
ORDER BY 2