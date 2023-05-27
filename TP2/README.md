# 20210372
  <img src="https://d1.awsstatic.com/acs/characters/Logos/Docker-Logo_Horizontel_279x131.b8a5c41e56b77706656d61080f6a0217a3ba356d.png" alt="docker logo" />

                                                  
                                             TP 2 : Docker
    
                                             OBJECTIFS

- Configurer un workflow Github Action
- Transformer un wrapper en API
- Publier automatiquement à chaque push sur Docker Hub

                                            Développement  
                              
      1- Configuration du workflow Github Action
Pour configurer le workflow, on s'est basé sur le code de configuration présent dans le cours, puis à cela des lignes de code ont été ajoutées. 
Les lignes de code ajoutées sont basées sur une configuration particulière. Les lignes de code suivantes détaillent les pré-configurations:

 - Ouvrez les paramètres du référentiel et accédez à Secrets > Actions.

 - Créez un nouveau secret nommé DOCKERHUB_USERNAME et votre ID Docker comme valeur.

 - Créez un nouveau jeton d'accès personnel (PAT) pour Docker Hub. Vous pouvez nommer ce jeton clockboxci.

 - Ajoutez le PAT en tant que deuxième secret dans votre référentiel GitHub, avec le nom DOCKERHUB_TOKEN.  
  

       2- Transformer un wrapper en API

Le wrapper du TP1 a été transformé en API grâce à Flask, un framework python. Ainsi en configurant les routes, nous pouvons accéder à la météo après avoir fournis la latitude et la longitude.
  -   http://localhost:8081/?lat=5.902785&lon=102.754175 nous permet d'avoir accès à la météo avec pour latitude 5.902785 et longitude 102.754175 


    3- Publier automatiquement a chaque push sur Docker Hub
Le build et le push permettent de publier sur docker hub


    4- Test du fonctionnement de l'API
  - docker pull lynnxx/firstly:1.0.0 
  - docker run -p 8081:8081 --env API_KEY=**** ml
  - curl "http://localhost:8081/?lat=5.902785&lon=102.754175"

On remarque qu'en fonction des données entrées, nous obtenons effectivement la météo en fonction de la situation géographique


                                            Bonus

Add hadolint to Github workflow before build+push and failed on errors : cette tâche est prise en compte par les lignes de code suivantes.
- uses: hadolint/hadolint-action@v3.1.0
       with:
         dockerfile: TP2/Dockerfile

Aucune donnée sensible stockée dans l'image : Pour cela, l'API key est une variable d'environnement. Elle ne parait pas dans le wrapper.

