FROM quay.io/keycloak/keycloak:22.0.1

COPY ./yivi-realm.json /opt/keycloak/data/import/yivi-realm.json
COPY ./entrypoint.sh ./entrypoint.sh

# Keycloak variables
ENV KEYCLOAK_ADMIN=keycloak
ENV KEYCLOAK_ADMIN_PASSWORD=keycloak

# Identity Provider Federation Values
ENV CLIENT_ID=your-client-id
ENV CLIENT_SECRET=your-client-secret

# Define how to start up keycloak. This is postfixed to the `kc.sh` script in the `entrypoint.sh`
ENV KEYCLOAK_STARTUP_ARGUMENTS="start-dev --import-realm"

USER root
RUN chmod +x ./entrypoint.sh
RUN chown keycloak:keycloak /opt/keycloak/data/import
USER keycloak

ENTRYPOINT ["./entrypoint.sh"]
