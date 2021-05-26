1. Créer un index nommé test01
```
PUT /test01
```

2. Vérifier que cet index est maintenant présent
```
GET /test01/_search
```

3. Créer ce document dans cet index
{
  "titre": "Premier document",
  "description": "C'est la première fois que je crée un document dans ES.",
  "quantité": 12,
  "date_creation": "18-10-2020"
}
```
PUT /test01/_doc/1
{
  "titre": "Premier document",
  "description": "C'est la première fois que je crée un document dans ES.",
  "quantité": 12,
  "date_creation": "18-10-2020"
}
```

4. Afficher ce document
```
GET /test01/_doc/1
```

5. Afficher quel mapping a été appliqué par défaut. Est-il optimal ?
```
GET /test01/_mapping
```

6. Essayer de modifier le mapping pour le champ date_creation, pour un plus adapté
```
Impossible car c'est déjà indexé.
```

7. Créer un nouvel index test02
```
PUT /test02
```

8. Appliquer un mapping plus adapté aux données du document ci-dessus
```
POST /test02/_mapping
{
  "properties" : {
      "date_creation" : {
        "type" : "date",
        "format": "dd-MM-yyyy"
      }
    }
}
```

9. Afficher la manière dont le texte de la description du document a été traité par l'analyzer
```
GET /test02/_analyze
{
  "text": "C'est la première fois que je crée un document dans ES."
}
```

10. Créer un index test03 qui :
    * intègre le mapping ci-dessus
    * indexera la description sans l'altérer
    * indexera la description en supprimant les mots sans valeur ajoutée
```
PUT /test03
{
  "settings":{
      "analysis":{
         "analyzer":{
            "std_fr":{ 
               "type":"standard",
               "stopwords": "_french_"
            }
         }
      }
  },
  "mappings" : {
      "properties" : {
        "date_creation" : {
          "type" : "date",
          "format" : "dd-MM-yyyy"
        },
        "description" : {
          "type" : "text",
          "fields" : {
            "fr" : {
              "type" : "text",
              "analyzer": "std_fr"
            }
          }
        },
        "quantité" : {
          "type" : "long"
        },
        "titre" : {
          "type" : "text",
          "fields" : {
            "keyword" : {
              "type" : "keyword",
              "ignore_above" : 256
            }
          }
        }
      }
    }
}
```

11. Faire un import multiple de 4 documents en une seule requête

**Attention cette solution ne fonctionne que si les documents sont sur une ligne**
```
POST /test03/_bulk
{"create":{"_id":1}}
{ "titre": "Premier document","description": "C'est la première fois que je crée un document dans ES.","quantité": 12,"date_creation": "18-10-2020"}
{"create":{"_id":2}}
{ "titre": "Second document","description": "C'est la première fois que je crée un document dans ES.","quantité": 12,"date_creation": "18-10-2020"}
{"create":{"_id":3}}
{ "titre": "Troisième document","description": "C'est la première fois que je crée un document dans ES.","quantité": 12,"date_creation": "18-10-2020"}```

---

* Lister les vols dont le prix moyen est entre 300€ et 450€
```
GET /kibana_sample_data_flights/_search
{
  "query": {
    "range": {
      "AvgTicketPrice": {
        "gte": 300,
        "lte": 450
      }
    }
  }
}
```

* Lister les vols annulés
```
GET /kibana_sample_data_flights/_search
{
  "query": {
    "term": {
      "Cancelled": true 
    }
  }
}
```

* Lister les vols ou il pleut à l'arrivée ou au départ. Les vols avec de la pluie à l'arrivée devront sortir avant les autres.
```
GET /kibana_sample_data_flights/_search
{
  "query": {
    "multi_match" : {
      "query":    "Rain", 
      "fields": [ "DestWeather^3", "OriginWeather" ] 
    }
  }
}
```

* Lister les vols partant d'Allemagne et à destination de France
```
GET /kibana_sample_data_flights/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "DestCountry": "FR"
          }
        },
        {
          "match": {
            "OriginCountry": "DE"
          }
        }
      ]
    }
  }
}
```

* Lister les vols ayant eu lieu entre le 1er avril 2021 et le 20avril 2021
```
GET /kibana_sample_data_flights/_search
{
  "query": {
    "range": {
      "timestamp": {
        "gte": "2021-04-01T00:00:00",
        "lte": "2021-04-20T00:00:00"
      }
    }
  }
}
```