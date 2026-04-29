FROM nicolaka/netshoot:v0.15

RUN apk update && apk add --no-cache ca-certificates

# Java 21
RUN mkdir -p /opt/java \
    && curl -L -o /tmp/jdk.tar.gz \
       https://cdn.azul.com/zulu/bin/zulu21.30.15-ca-jdk21.0.1-linux_musl_x64.tar.gz \
    && tar -xzf /tmp/jdk.tar.gz -C /opt/java --strip-components=1 \
    && rm /tmp/jdk.tar.gz

ENV JAVA_HOME=/opt/java
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Groovy 5
RUN mkdir -p /opt/groovy \
    && curl -L -o /tmp/groovy.zip \
       https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-5.0.5.zip\
    && unzip /tmp/groovy.zip -d /opt/groovy \
    && mv /opt/groovy/*/* /opt/groovy \
    && rm /tmp/groovy.zip

RUN apk add --no-cache ncurses

ENV GROOVY_HOME=/opt/groovy
ENV PATH="${GROOVY_HOME}/bin:${PATH}"

CMD ["sleep", "infinity"]
ENTRYPOINT []
