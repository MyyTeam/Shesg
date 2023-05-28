# Roadmap

- [x] 基于ChatGPT对用户社媒的post进行分析,并推荐相关的ESG商品
- [x] Using ChatGPT to analyze users' social media posts and recommend relevant ESG products.
- [x] 对商品的主要信息进行摘要，以便于后续进行分析时提高效率
- [x] Summarize the main information of the commodity in order to improve efficiency for subsequent analysis.
- [x] 提供用户通过链接的方式快速建立自己的商品池
- [x] Provide users with a way to quickly establish their own product pool through links.
- [x] 一个小工具：短链接生成服务
- [x] A small tool: short link generation service.
- [ ] A哥补一些未来要实现的功能吧
- [ ] Feature A
- [ ] Feature B

# Get Started
> 如何部署到私人服务器
> 
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
