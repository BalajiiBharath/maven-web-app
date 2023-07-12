FROM maven as build
WORKDIR /app
COPY ..
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from-build /app/target/01-maven-web-app.jar /app/ 
EXPOSE 8080
CMD ["java",".jar","01-maven-web-app.jar"]
