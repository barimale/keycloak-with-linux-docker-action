FROM jboss/keycloak

USER root

ADD tools/docker-entrypoint.sh /opt/jboss/tools
RUN chmod -R u+x /opt/jboss/tools

USER 1000

EXPOSE 8080
EXPOSE 8443

#ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]
