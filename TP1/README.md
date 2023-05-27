# 20210372
  <img src="https://d1.awsstatic.com/acs/characters/Logos/Docker-Logo_Horizontel_279x131.b8a5c41e56b77706656d61080f6a0217a3ba356d.png" alt="docker logo" />

                                                  
                                TP 1 : Docker
    
                                             OBJECTIFS

- Créer un wrapper qui retourne la météo d'un lieu donné avec sa latitude et sa longitude
(passées en variable d'environnement) en utilisant openweather API et python comme langage de programmation 
- Packager le code dans une image Docker
- Mettre à disposition l'image sur DockerHub

                                            Développement  
                              
                              
      1- Wrapper

Dans le fichier weather.py la fonction permet d'afficher la météo en fonction de la latitude et la longitude données.  Ces dernières ainsi que la clé API sont récupérées à partir des variables d'environnement à l'aide de la bibliothèque os. Il construit ensuite l'URL du point de terminaison de l'API avec la latitude, la longitude et la clé API données, et effectue une requête GET pour récupérer les données météorologiques. Enfin, il renvoie la réponse au format JSON.
  
 
    2- Packaging du code dans une image Docker
    -  docker build . -t first:1.0.0
    -  docker tag first:1.0.0 lynnxx/first:1.0.0
    -  docker push lynnxx/first:1.0.0
  
  

Le Dockerfile utilisé démarre avec une image de base qui inclut Python 3.9, copie le script weather.py dans l'image, définit le répertoire de travail sur   /app et exécute le script weather.py au démarrage du conteneur.


    3- Mise à disposition de l'image sur DockerHub
docker push lynnxx/firstly:1.0.0


    4- Test du fonctionnement de l'API
  -  docker pull lynnxx/first:1.0.0 
  -  docker run --env LAT="31.2504" --env LONG="-99.2506" --env API_KEY=**** lynnxx/first:1.0.0
  
On remarque qu'en fonction des données entrées, nous obtenons effectivement la météo en fonction de la situation géographique


                                            Bonus

    0 CVE (trivy) : trivy image lynnxx/first:1.0.0
    Il est à noter que cela dépend de l'image avec laquelle démarre le Dockerfile. Une image avec beaucoup moins de vulnérabilités donnera beaucoup moins de CVE
     
     0 lint errors on Dockerfile (hadolint) : docker run --rm -i hadolint/hadolint < Dockerfile
     
     Aucune donnée sensible stockée dans l'image : Pour cela, l'API key est une variable d'environnement. Elle ne parait pas dans le wrapper.


