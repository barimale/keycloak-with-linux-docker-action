# Container image that runs your code
#FROM winamd64/openjdk
FROM mcr.microsoft.com/windows/nanoserver:1903-amd64
#VOLUME web001:c:\\data

ENV KEYCLOAK_VERSION 7.0.1

ARG KEYCLOAK_DIST=https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz

USER 1000

EXPOSE 8080
EXPOSE 8443

CMD /k bitsadmin /transfer downloadKeycloak /download /priority high KEYCLOAK_DIST c:\keycloak-$KEYCLOAK_VERSION.tar.gz && cmd

CMD /k tar xzvf c:\keycloak-$KEYCLOAK_VERSION.tar.gz -C c:\ && cmd

CMD /k c:\\keycloak-$KEYCLOAK_VERSION\\bin\\add-user-keycloak.bat -u admin -p admin && cmd

#CMD /k c:\\keycloak-$KEYCLOAK_VERSION\\bin\\kcadm.bat create realms -s realm=DEV -s enabled=true && cmd

#CMD /k c:\\keycloak-$KEYCLOAK_VERSION\\bin\\kcadm.bat config credentials --server http://localhost:8080/auth --realm Master --user admin --password admin

CMD /k c:\\keycloak-$KEYCLOAK_VERSION\\bin\\standalone.bat -Dkeycloak.import=realm-export.json && cmd