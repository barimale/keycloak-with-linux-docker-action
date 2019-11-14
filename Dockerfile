FROM jboss/keycloak

ENV JDBC_POSTGRES_VERSION 42.2.5
ENV JDBC_MYSQL_VERSION 5.1.46
ENV JDBC_MARIADB_VERSION 2.2.3
ENV JDBC_MSSQL_VERSION 7.4.1.jre8

ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV PROXY_ADDRESS_FORWARDING false
ENV JBOSS_HOME /opt/jboss/keycloak

USER root
#ADD tools/docker-entrypoint.sh /opt/jboss/tools/
ADD realm-export.json /opt/jboss/tools/

USER root
#RUN chmod 777 /opt/jboss/tools/docker-entrypoint.sh
RUN chmod 777 /opt/jboss/tools/realm-export.json

USER 1000

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
