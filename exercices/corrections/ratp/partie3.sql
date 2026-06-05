-- 1. Les 10 stations les plus fréquentées ces 3 dernières années (de 2019 à 2021)
SELECT station, SUM(trafic) AS trafic_total
FROM (
    SELECT station, trafic FROM `2019`
    UNION ALL
    SELECT station, trafic FROM `2020`
    UNION ALL
    SELECT station, trafic FROM `2021`
) AS t
GROUP BY station
ORDER BY trafic_total DESC
LIMIT 10;
-- 2. Les 5 stations les moins fréquentées dans Paris entre 2018 et 2021.
SELECT station, SUM(trafic) AS trafic_total
FROM (
    SELECT station, trafic, paris_district FROM `2018` UNION ALL
    SELECT station, trafic, paris_district FROM `2019` UNION ALL
    SELECT station, trafic, paris_district FROM `2020` UNION ALL
    SELECT station, trafic, paris_district FROM `2021`
) AS t
WHERE paris_district IS NOT NULL AND paris_district != ''
GROUP BY station
ORDER BY trafic_total ASC
LIMIT 5;
-- 3. Les 5 stations les plus fréquentées en dehors de Paris ces 2 dernières années.
SELECT station, SUM(trafic) AS trafic_total
FROM (
    SELECT station, trafic, paris_district FROM `2020`
    UNION ALL
    SELECT station, trafic, paris_district FROM `2021`
) AS t
WHERE paris_district IS NULL OR paris_district = ''
GROUP BY station
ORDER BY trafic_total DESC
LIMIT 5;
-- 4. Les 11ème, 12ème et 13ème stations les plus fréquentées du métro parisien entre 2018 et 2020.
SELECT station, SUM(trafic) AS trafic_total
FROM (
    SELECT station, trafic, network FROM `2018` UNION ALL
    SELECT station, trafic, network FROM `2019` UNION ALL
    SELECT station, trafic, network FROM `2020`
) AS t
WHERE network = 'M' -- Adaptez 'M' selon votre nomenclature (ex: 'Metro')
GROUP BY station
ORDER BY trafic_total DESC
LIMIT 3 OFFSET 10;
-- 5. L'année qui a le plus de trafic entre 2013, 2014 et 2020.
SELECT annee, SUM(trafic) AS trafic_annuel
FROM (
    SELECT '2013' AS annee, trafic FROM `2013` UNION ALL
    SELECT '2014' AS annee, trafic FROM `2014` UNION ALL
    SELECT '2020' AS annee, trafic FROM `2020`
) AS t
GROUP BY annee
ORDER BY trafic_annuel DESC
LIMIT 1;
-- 6. Le trafic moyen dans Paris sur les 3 dernières années.
SELECT AVG(trafic_annuel_station) AS trafic_moyen
FROM (
    SELECT station, SUM(trafic) AS trafic_annuel_station
    FROM (
        SELECT station, trafic, paris_district FROM `2019` UNION ALL
        SELECT station, trafic, paris_district FROM `2020` UNION ALL
        SELECT station, trafic, paris_district FROM `2021`
    ) AS t
    WHERE paris_district IS NOT NULL AND paris_district != ''
    GROUP BY station
) AS final_avg;
-- OU
SELECT AVG(trafic_annuel) AS trafic_moyen_annuel
FROM (
    SELECT SUM(trafic) AS trafic_annuel
    FROM `2019`
    WHERE paris_district IS NOT NULL

    UNION ALL

    SELECT SUM(trafic)
    FROM `2020`
    WHERE paris_district IS NOT NULL

    UNION ALL

    SELECT SUM(trafic)
    FROM `2021`
    WHERE paris_district IS NOT NULL
) t;
-- 7. Le trafic moyen à Saint-Lazare sur les 5 dernières années.
SELECT AVG(trafic_annuel) AS trafic_moyen_5_ans
FROM (
    SELECT SUM(trafic) AS trafic_annuel FROM `2017` WHERE station LIKE '%Saint-Lazare%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2018` WHERE station LIKE '%Saint-Lazare%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2019` WHERE station LIKE '%Saint-Lazare%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2020` WHERE station LIKE '%Saint-Lazare%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2021` WHERE station LIKE '%Saint-Lazare%'
) AS gares_trafic;
-- 8. Le trafic moyen à Gare du Nord sur les 5 dernières années.
SELECT AVG(trafic_annuel) AS trafic_moyen_5_ans
FROM (
    SELECT SUM(trafic) AS trafic_annuel FROM `2017` WHERE station LIKE '%Gare du Nord%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2018` WHERE station LIKE '%Gare du Nord%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2019` WHERE station LIKE '%Gare du Nord%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2020` WHERE station LIKE '%Gare du Nord%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2021` WHERE station LIKE '%Gare du Nord%'
) AS gares_trafic;
-- 9. Le trafic moyen à Gare de Lyon sur les 5 dernières années.
SELECT AVG(trafic_annuel) AS trafic_moyen_5_ans
FROM (
    SELECT SUM(trafic) AS trafic_annuel FROM `2017` WHERE station LIKE '%Gare de Lyon%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2018` WHERE station LIKE '%Gare de Lyon%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2019` WHERE station LIKE '%Gare de Lyon%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2020` WHERE station LIKE '%Gare de Lyon%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2021` WHERE station LIKE '%Gare de Lyon%'
) AS gares_trafic;
-- 10. Le trafic moyen à Gare de l'Est sur les 5 dernières années.
SELECT AVG(trafic_annuel) AS trafic_moyen_5_ans
FROM (
    SELECT SUM(trafic) AS trafic_annuel FROM `2017` WHERE station LIKE '%Gare de l%Est%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2018` WHERE station LIKE '%Gare de l%Est%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2019` WHERE station LIKE '%Gare de l%Est%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2020` WHERE station LIKE '%Gare de l%Est%' UNION ALL
    SELECT SUM(trafic) AS trafic_annuel FROM `2021` WHERE station LIKE '%Gare de l%Est%'
) AS gares_trafic;