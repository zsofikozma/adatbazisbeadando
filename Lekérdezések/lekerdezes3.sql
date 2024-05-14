--Csinálj egy tabellát, ahol legyen ott minden csapatnak:
--a győzelmek száma, a döntetlenek száma és a vereségek száma,
--illetve az  összpontszáma a csapatnak.

SELECT CsapatNeve,
    SUM(CASE WHEN pontszam = 3 THEN 1 ELSE 0 END) AS GY,
    SUM(CASE WHEN pontszam = 1 THEN 1 ELSE 0 END) AS D,
    SUM(CASE WHEN pontszam = 0 THEN 1 ELSE 0 END) AS V,
	SUM(pontszam) AS P
FROM (SELECT cs1.csapat_nev AS 'CsapatNeve', 
CASE
    WHEN hazai_gol> vendeg_gol THEN 3
    WHEN hazai_gol = vendeg_gol THEN 1
    ELSE 0
END AS pontszam
FROM merkozes m 
JOIN csapat cs1 ON cs1.csapatid = m.hazai_csapatid

UNION aLL

SELECT cs2.csapat_nev AS 'CsapatNeve', 
CASE
    WHEN hazai_gol> vendeg_gol THEN 0
    WHEN hazai_gol = vendeg_gol THEN 1
    ELSE 3
END AS pontszam
FROM merkozes m 
JOIN csapat cs2 ON cs2.csapatid = m.vendeg_csapatid) AS adatok
group BY CsapatNeve
ORDER BY 5 DESC