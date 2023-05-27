# Get Started
> How to deploy to a private server.
```shell
git clone [github repository url]
```
## Docker(Recommended)
Docker environment is required. Execute the following command in the root directory:
```shell
docker-compose -f docker-compose-shesg.yaml up -d
```

## deploy using src
Maven and MySQL is required, and you should modify the datasource url in `bootstrap.yml`.
```shell
mvn clean install;
java -jar app.jar
```
