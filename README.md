# AllInOneDemo

# shESG Project
Welcome to the shESG project. This project aims to promote and distribute Environmental, Social, and Governance (ESG) products via content creators among younger generations. The project consists of two parts: the client, and the server.

# Roadmap
Our product roadmap is as follows:

- [ ] Manual implementations, primarily ESG product insight and ESG product entry. We are currently limited by the project time and are unable to establish a comprehensive system from scratch within a week. This involves a product life cycle management system (PLM), a supplier relationship management system (SRM), and a commodity insight system.

- [x] Completed features
  - [x] For Creators:
    - Browsing ESG products
    - Entry of text-based social media posts for shESG analysis
    - Entry of custom products into the shESG platform
    - Editing of custom products
    - Automatic synchronization of products to the Bio page
    - Preview of Bio page
    - Retrieval of short link address corresponding to Bio page
    - Viewing of commission data
  - [x] For Customers:
    - Viewing of Bio page content
    - Clicking on links to redirect to product pages
  - [x] For AI algorithm:
    - Refining product features through ChatGPT
    - Refining creator post content features through ChatGPT
    - Completing product recommendation through ChatGPT

- [ ] Planned features
  - [ ] For Creators:
    - Analysis of creators' image and video type posts
    - Completion of the logic for commission settlement
  - [ ] For shESG Operators:
    - Providing product insight analysis tools
    - Providing product entry tools
    - Providing supplier management tools
  - [ ] For AI algorithm:
    - Completion of AI recognition for images and videos
    - Integration with Openai's Model Instance service and enhancement of shESG's small model
    - Creation of creators' text posts
    - Creation of creators' image posts
    - Creation of creators' video posts

# Quick Start
1. Clone this repository to your local machine, please run:
    ```shell
    git clone https://github.com/MyyTeam/Shesg.git
    ```
2.  Add support for Docker and Docker Compose:
- 2.1). Install Docker, link: [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/)
- 2.2). Install Docker Compose, link : [https://docs.docker.com/compose/](https://docs.docker.com/compose/)
3. Execute the following command in the root directory:
    ```shell
    docker-compose -f docker-compose.yml up -d
    ```
4. Open in any browser:

    After the service starts, the browser accesses of shesg, which is your Application HostIP.

## deploy using src
Maven and MySQL is required, and you should modify the datasource url in `bootstrap.yml`.
```shell
mvn clean install;
java -jar app.jar
```

# Prerequisites
Please ensure you have the following installed on your system:

Git, for version control
Node.js and NPM, for running the client
Java Development Kit (JDK), for running the server
Vue.js, for running and developing the client
Any IDE that supports Java and Vue.js development (like IntelliJ IDEA, Visual Studio Code, etc.)

# Installation
Server
To install dependencies and start the server, please run:
```bash
...
```

Client
To install dependencies and pack output dist, please run:
```bash
### To client
cd client 

### Project setup

npm install  

### Compile and pack update dist

npm run build:prod

```

# Contributing
We appreciate all contributions. If you're planning to submit a PR, please adhere to our coding standards and ensure all tests pass before submission. For more information, please see our CONTRIBUTING.md file.

# License
This project is licensed under the [insert license here] - see the LICENSE.md file for details.

Please replace [username] with your actual GitHub username and insert license here with the actual license you're using for the project.

