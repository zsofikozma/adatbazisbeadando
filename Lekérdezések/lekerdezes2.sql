--Csapatonként hány 1999 utáni van?
SELECT cs.csapat_nev AS 'Csapat neve',
       COUNT(*) AS '1999 utáni játékosok száma'
FROM jatekos j 
	JOIN csapat cs ON j.csapatid = cs.csapatid
WHERE YEAR(j.szuletesi_datum) > 1999
GROUP BY cs.csapat_nev