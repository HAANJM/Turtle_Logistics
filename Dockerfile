# Docker 이미지의 베이스 이미지를 지정합니다. 여기서는 OpenJDK 11을 사용합니다.
FROM adoptopenjdk:11-jre-hotspot

# 작업 디렉토리를 설정합니다. 애플리케이션 파일들은 이 디렉토리로 복사될 것입니다.
WORKDIR /app

# 애플리케이션 JAR 파일을 Docker 이미지로 복사합니다.
# 여기서는 현재 디렉토리의 build/libs 디렉토리에 위치한 JAR 파일을 복사합니다.
COPY ./backend/build/libs/*.jar /app/app.jar

# Docker 컨테이너 내부에서 애플리케이션이 사용할 포트를 지정합니다.
EXPOSE 8080

# 컨테이너가 시작되었을 때 실행할 명령을 지정합니다.
# 여기서는 Java로 Spring Boot 애플리케이션을 실행하는 명령을 사용합니다.
CMD ["java", "-jar", "app.jar"]