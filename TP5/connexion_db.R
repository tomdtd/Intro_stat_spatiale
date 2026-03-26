# Informations requises pour la connexion à votre bdd personnelle
# Les valeurs ici sont mentionnées à titre indicatif:

# name_database <- "defaultdb"
# user_name <- "user-XXXXXX" # à modifier
# password <- "XXXXXXXXXXXXX" # à modifier
# port <- "5432" # partie de l'url après les :

name_database <- "gisdb"
user_name <- "jj" # à modifier
password <- "jojolapin" # à modifier
url <- "postgis-service" # à modifier
port <- "5432"


# RQ: pour l'exercice, les informations sont écrites en clair sur le pgm. Il faudra, 
# en situation réelle de travail, veiller à ne pas diffuser ces informations,
# par exemple en stockant ces informations dans un autre fichier protégé.

# Fonction pour se connecter à la base de données ####
connecter <- function(){
  conn <- DBI::dbConnect(
    RPostgres::Postgres(),
    dbname=name_database,
    host=url, 
    user=user_name, 
    password=password, 
    port=port
  )
  return(conn)
}