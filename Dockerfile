FROM quay.io/keycloak/keycloak:18.0.2

# copy realm config and users
COPY eyescream-realm-and-users.json /opt/keycloak-import/

# execute import command
RUN /opt/keycloak/bin/kc.sh import --file /opt/keycloak-import/eyescream-realm-and-users.json

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

EXPOSE 8080
EXPOSE 8443

CMD ["start-dev"]