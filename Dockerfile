# 1. 베이스 이미지 선택 (Java 21 런타임 환경)
# GitHub Actions에서 temurin 21 버전을 사용했으므로 동일하게 맞춥니다.
# JRE(Java Runtime Environment)만 사용해 이미지 크기를 최적화합니다.
FROM eclipse-temurin:21-jre-jammy

# 2. 작성자 라벨 (제공해주신 내용)
LABEL authors="hhl"

# 3. 컨테이너 내부 작업 디렉터리 설정
WORKDIR /app

# 4. 빌드된 .jar 파일 복사
# GitHub Actions가 'build/libs/'에 생성한 .jar 파일을 컨테이너 내부의 /app/app.jar로 복사합니다.
COPY build/libs/*.jar app.jar

# 5. 포트 설정
# GitHub Actions의 'docker run' 명령어에서 '-p 3000:3000'을 사용했습니다.
# 이는 컨테이너 내부의 3000번 포트를 사용한다는 의미입니다.
EXPOSE 3000

# 6. 애플리케이션 실행
# 컨테이너가 시작될 때, Spring Boot 앱을 3000번 포트로 실행합니다.
ENTRYPOINT ["java", "-jar", "app.jar", "--server.port=3000"]