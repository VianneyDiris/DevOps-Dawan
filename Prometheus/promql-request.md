## requête PromQL

 * Lister la différence d'espace disque des filesystem ext4 entre maintenant et il y a 10h.
 ```
 node_filesystem_free_bytes{fstype="ext4"} offset 10h - node_filesystem_free_bytes{fstype="ext4"} 
 ```

 * Lister les cibles qui ont exposé plus de 100 séries.
 ```
 scrape_samples_scraped > 100
 ```

 * Combien y a-t'il de core sur chaque instance ?
 ```
 count (group by(instance,cpu) (node_cpu_seconds_total)) by(instance)
 ```

 * Indiquer pour quelles méthodes et status le nombre de requêtes d'API arrivées sur les deux dernières heures est supérieur à ce même nombre il y a 12h.
 ```
 increase (flask_http_request_total [2h]) > bool increase(flask_http_request_total [2h] offset 12h)
 ```

 * Afficher le nombre total de métriques par job.
 ```
 sum (scrape_samples_scraped) by(job)
 ```

 * Afficher le nombre de bytes transmis et reçus par interface réseau.
 ```
 {__name__=~"node_network_.*b.*total"}
 ```

 * Afficher dans l'ordre descendant les noms des 10 métriques ayant la plus grande cardinalité.
```
sort_desc(topk(10,count({__name__=~".+"}) by(__name__)))
```

 * Indiquer le nombre total de requêtes, pour les status qui ne sont pas de la famille 4xx, pour les méthodes qui commencent par un P et finissent par un T.
 ```
 sum(flask_http_request_total{status=~"^4..",method=~"P.*T$"})
 ```

 * Quel est le pourcentage de requêtes ayant un status 200 pour chaque méthode existante ?
 ```
 flask_http_request_duration_seconds_bucket{le="+Inf",status="200"} *100 / on(method) sum by(method) (flask_http_request_duration_seconds_bucket{le="+Inf"})
 ```

 * Afficher le pourcentage d'occupation d'espace disque le plus élevé pour les devices dont le nom contient "vda".
 ```
(node_filesystem_size_bytes{device=~".*vda.*"} - node_filesystem_avail_bytes) *100/node_filesystem_size_bytes
 ```