## Bleu  - Green Docker Swarm nginx exemple

La solution démontre le fonctionnement du déployement de type Bleu-Green avec 
un service nginx et en front un load-balancer nginx utilisant un stack Swarm.

![Schema](schema.png)

Cette solution utilise des 'configs' docker swarm pour partager sur les nodes 
les configurations de chaque service nginx et des fichiers index.html spécifique 
pour afficher sur l'instance Bleu *Welcome Bleu* et pour l'instance Green *Welcome Green*.

Le load balancer est accessible sur le port http **8383**.

**Créer la stack 'blue-green'**

```bash
bash deploy.sh
```

**Switcher du bleu à green ou vise-versa**

```bash
bash switch.sh green

ou

bash switch.ch blue
```
---

Afin de permettre de passer du service *Bleu* à *Green* la config du load-balancer est
créer dans docker avec un nom (name) changant à chaque 'switch'. C'est un bon moyen pour forcer 
swarm à modifier le comportement du load-balancer, car une *config* ne peux être modifier (update).

```yaml
  loadbalancer_conf:
    name: default-${SETTINGS_TIMESTAMP}.conf
    file: ./nginx/loadbalancer/conf.d/default.conf
```

Il est donc nécéssaire de deployer la stack avec la ligne de commande suivante:

```bash
SETTINGS_TIMESTAMP=$(date +%s)  docker stack deploy -c docker-stack.yml blue-green
```

> A noter: Utiliser des 'config' pour les fichiers des 2 index.html personnalisés Bleu et Green n'est pas une bonne pratique, mais uniquement par simplicité! Dans un vrais contexte, il faudrait utiliser soit des volumes nommés, soit des répertoires partagés type NFS ou encore dans des images docker spécifiques. 
