## Bleu  - Green Docker Swarm nginx - Exercice

Mettez en place une architecture de deployement Bleu-Green permettant de faire fonctionner
un service nginx avec en front un load-balancer utilisant aussi nginx.

- Le service nginx Bleu affichera **Welcome Bleu**, alors que le service nginx Green affichera **Welcom Green**. 
- Le load-balancer lui sera accessible sur le port http **8383**.
- Le passage (switch) entre le service Bleu et Green sera effectué en modifiant la configuration du load-balancer.

[Schema](schema.png)