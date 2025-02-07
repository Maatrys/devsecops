FROM adoptopenjdk/openjdk8:alpine-slim
EXPOSE 8080
ARG JAR_FILE=target/*.jar
RUN addgroup -S pipeline && adduser -S k8s-pipeline -G pipeline
ADD ${JAR_FILE} /home/k8s-pipeline/app.jar
USER k8s-pipeline
ENTRYPOINT ["java","-jar","/home/k8s-pipeline/app.jar"]


# + bash trivy-docker-image-scan.sh
# openjdk:8-jdk-alpine
# openjdk:8-jdk-alpine (alpine 3.9.4)
# Total: 32 (HIGH: 32)