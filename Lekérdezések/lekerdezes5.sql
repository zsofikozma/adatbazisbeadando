--Böde Dániel melyik csapatok ellen szerzett gólt? :)
SELECT DISTINCT 
            CASE WHEN cs2.csapat_nev = (SELECT cs1.csapat_nev
									FROM jatekos j1 
										JOIN csapat cs1 ON j1.csapatid = cs1.csapatid
									WHERE j1.jatekos_nev = 'Böde Dániel') THEN cs3.csapat_nev
            WHEN cs3.csapat_nev = (	SELECT cs1.csapat_nev
									FROM jatekos j1 
										JOIN csapat cs1 ON j1.csapatid = cs1.csapatid
									WHERE j1.jatekos_nev = 'Böde Dániel') THEN cs2.csapat_nev
            END
FROM jatekos j2 
	JOIN gol g ON j2.jatekosid = g.jatekosid
    JOIN merkozes m ON g.merkozesid = m.merkozesid
    JOIN csapat cs2  ON m.hazai_csapatid = cs2.csapatid
    JOIN csapat cs3 ON m.vendeg_csapatid = cs3.csapatid
WHERE j2.jatekos_nev = 'Böde Dániel'