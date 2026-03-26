Créer un service vscode sur Onyxia en activant l'option `Role` -> choisir `Admin`

Ouvrir le service vscode
Uploader dans le service vscode les deux fichiers : `postgis-pod.yaml` et `postgis-service.yaml`

Dans le fichier `postgis-pod.yaml`, modifier les lignes 15 et 17 avec un IDUSER à vous et PASSWORD à vous. La confidentialité de cette base est nulle, donc faites simple.

Dans le terminal du service vscode, lancer la commande:

`kubectl apply -f postgis-pod.yaml` puis

`kubectl wait --for=condition=Ready pod/postgis-pod`  puis

`kubectl apply -f postgis-service.yaml`.

Il va falloir activer postgis, pour cela, toujours dans le terminal: 

`kubectl exec -it postgis-pod -- psql -U postgres -d gisdb`, en remplaçant `postgres` par l'ID que vous avez choisi préalablement.

Cela ouvre un prompt postgresql. Lancer la commande sql:

`CREATE EXTENSION postgis;` puis, pour vérifier:

`SELECT PostGIS_Version();` vérifier qu'il y a bien une version mentionnée.

Si tout s'est bien passé: faites `\q` pour sortir de la console postgresql.

Créer un service RSTudio avec le code du tp. 

Puis dans connexion_db, remplacer les infos de connexion par :

```
name_database <- "gisdb"
user_name <- "jj" # à modifier avec votre IDUSER choisi plus haut
password <- "jojolapin" # à modifier avec votre PASSWORD choisi plus haut
url <- "postgis-service"
port <- "5432" 
```
