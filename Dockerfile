FROM quay.io/keycloak/keycloak:22.0.5

COPY ./yivi-realm.json /opt/keycloak/data/import/yivi-realm.json
COPY ./entrypoint.sh ./entrypoint.sh
COPY ./gids-yivi-theme /opt/keycloak/themes/gids-yivi-theme

# Keycloak variables
ENV KEYCLOAK_ADMIN=keycloak
ENV KEYCLOAK_ADMIN_PASSWORD=keycloak

# Identity Provider Federation Values
ENV CLIENT_ID=your-client-id
ENV CLIENT_SECRET=your-client-secret

# Define how to start up keycloak. This is postfixed to the `kc.sh` script in the `entrypoint.sh`
ENV KEYCLOAK_STARTUP_ARGUMENTS="start --import-realm"

ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://postgresql:5432/keycloak
ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=<CONFIGURE_IN_GITLAB>
ENV KC_HOSTNAME=yivi-idp.sns.gidsopenstandaarden.org
ENV KC_PROXY=edge

USER root
RUN chmod +x ./entrypoint.sh
RUN chown keycloak:keycloak /opt/keycloak/data/import
USER keycloak

ENTRYPOINT ["./entrypoint.sh"]
