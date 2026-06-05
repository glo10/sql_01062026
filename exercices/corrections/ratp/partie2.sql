-- 1. La station qui comptabilise le moins de trafic ?
SELECT station, MIN(trafic)
FROM `2021`
GROUP BY station;

-- 2. La station qui comptabilise le plus de trafic en `2021`
SELECT station, MAX(trafic)
FROM `2021`
GROUP BY station;
-- 3. La moyenne fréquentation des stations dans Paris 13
SELECT AVG(trafic) AS moyenne_trafic_paris_13
FROM `2021`
WHERE LOWER(city) LIKE '%paris%'
AND CAST(paris_district AS SIGNED) = 13;

-- 4. Les stations qui ont le mot *"mairie"* ou *"ville"* dans leur nom.
SELECT station
FROM `2021`
WHERE LOWER(station) LIKE '%marie%' 
OR LOWER(station) LIKE '%ville%';

-- 5. Toutes les stations qui sont dans un arrondissement paire.
-- On utilise le modulo avec l'opérateur %
-- modulo = reste d'une division entière
SELECT station, paris_district
FROM `2021`
WHERE UPPER(city)='PARIS'
AND (CAST(paris_district AS SIGNED) % 2) = 0;

-- 6. Les 5 stations de la ligne de la ligne 1 les plus frequentées
SELECT station, SUM(trafic) as total_trafic
FROM `2021`
WHERE connection_1='1'
OR connection_2='1'
OR connection_3='1'
OR connection_4='1'
OR connection_5='1'
ORDER total_trafic DESC
LIMIT 5;

-- 7. Toutes les stations de la ligne 14 affichées sur la même ligne (résultat attendu *"olympiades, saint-lazare, marie de saint-ouen, pont cardinet,..."*).
SELECT GROUP_CONCAT(station) AS 'Toutes les stations du M14 sur une ligne'
FROM `2021`
WHERE connection_1='14'
OR connection_2='14'
OR connection_3='14'
OR connection_4='14'
OR connection_5='14';

-- 8. L'arrondissement de Paris qui comptabilise le plus de station.
SELECT paris_district, count(station) as total_station
FROM `2021`
GROUP BY paris_district
ORDER BY total_station DESC
LIMIT 1;

--- 9. Toutes les villes qui n'ont qu'une seule station.
SELECT city,
    count(station) total_station
FROM `2021`
GROUP BY city
HAVING count(station) = 1;