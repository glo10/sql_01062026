-- 1. Affichez les villes où il y au moins 3 clients.
SELECT COUNT(*) AS totalClientsParVilles, ville
FROM clients
GROUP BY ville
HAVING COUNT(*) >= 3;
-- 2. Affichez tous les clients dont le total des commandes dépasse 500 000 € d'achat.
-- Attention dans vos calculs prenez en compte la remise stockée en pourcentage.
SELECT 
    c.code_client, 
    c.societe,
    ROUND(SUM(dc.prix_unitaire * dc.quantite * (1 - dc.remise)), 2) AS TotalAchats
FROM clients c
JOIN commandes o ON c.code_client = o.code_client
JOIN details_commandes dc ON o.no_commande = dc.no_commande
GROUP BY c.code_client, c.societe
HAVING SUM(dc.prix_unitaire * dc.quantite * (1 - dc.remise)) > 500000
ORDER BY TotalAchats DESC;
-- Avec frais de port
SELECT 
    c.code_client, 
    c.societe,
    ROUND(SUM((dc.prix_unitaire * dc.quantite * (1 - dc.remise)) + PORT) , 2) AS TotalAchats
FROM clients c
JOIN commandes o ON c.code_client = o.code_client
JOIN details_commandes dc ON o.no_commande = dc.no_commande
GROUP BY c.code_client, c.societe
HAVING SUM((dc.prix_unitaire * dc.quantite * (1 - dc.remise)) + PORT) > 500000
ORDER BY TotalAchats DESC;
-- Avec une sous-requête
SELECT 
    c.code_client, 
    c.societe,
    ROUND(SUM((dc.prix_unitaire * dc.quantite * (1 - dc.remise)) + PORT) , 2) AS TotalAchats
FROM clients c
JOIN commandes o ON c.code_client = o.code_client
JOIN details_commandes dc ON o.no_commande = dc.no_commande
GROUP BY c.code_client, c.societe
HAVING SUM((dc.prix_unitaire * dc.quantite * (1 - dc.remise)) + PORT) > 500000
ORDER BY TotalAchats DESC;
