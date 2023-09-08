FROM quay.io/keycloak/keycloak:22.0.1

COPY ./yivi-realm.json /opt/keycloak/data/import/yivi-realm.json
COPY ./entrypoint.sh ./entrypoint.sh
COPY ./.env ./.env

USER root
RUN chmod +x ./entrypoint.sh
RUN chown keycloak:keycloak ./entrypoint.sh /opt/keycloak/data/import
USER keycloak

ENTRYPOINT ["./entrypoint.sh"]
