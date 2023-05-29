# Roadmap

- [x] Using ChatGPT to analyze users' social media posts and recommend relevant ESG products.
- [x] Summarize the main information of the commodity in order to improve efficiency for subsequent analysis.
- [x] Provide users with a way to quickly establish their own product pool through links.
- [x] A small tool: short link generation service.

# Get Started

> How to deploy to a private server.

```shell
git clone [github repository url]
```

## Preparation

### 1. Change openai api key
   Modify `applicaiton.yml`:

```yaml
openai:
  api-key: you_api_key
# change the value to the api-key that you obtained from openai.com.
```

### 2. Modify your docker registry url
Find the configuration node under the `docker-maven-plugin` in `pom.xml`
```xml
<configuration>
  <imageName>${project.artifactId}:${project.version}</imageName>
  <!-- dockerHost must be changed to your docker registry url -->
  <dockerHost>http://127.0.0.1:2375</dockerHost>
  <imageTags>
      <imageTag>latest</imageTag>
  </imageTags>
  <dockerDirectory>${basedir}</dockerDirectory>
  <resources>
      <resource>
          <targetPath>/</targetPath>
          <directory>${project.build.directory}</directory>
          <include>${project.build.finalName}.jar</include>
      </resource>
  </resources>
</configuration>
```
## Docker(Recommended)

Docker environment is required. Execute the following command in the root directory:

```shell
docker-compose -f docker-compose-shesg.yaml up -d
```

## deploy using src

Maven and MySQL is required, and you should modify the datasource url in `application.yml`.

```shell
mvn clean install;
java -jar app.jar
```
