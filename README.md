# GIDS Yivi Identity Provider
This project provides a `Dockerfile` that automatically adds a realm configured to add an external identity provider (IDP).
This IDP uses https://irma-auth.sns.gidsopenstandaarden.org, which provides an OIDC wrapper around the Yivi 
(previously IRMA) logic. This allows for an eased integration that support identity provider federation.   

## Getting started
1. Build a docker image named `gids-idp-yivi`:
   ```shell
    docker build -t gids-idp-yivi . --rm
   ```
2. Run the image. In the command below, replace the `<CLIENT_ID>` and `<CLIENT_SECRET>`
   with values from https://irma-auth.sns.gidsopenstandaarden.org/oauth2/token:
   ```shell
   docker run -p 8080:8080 gids-idp-yivi -e CLIENT_ID=<CLIENT_ID> -e CLIENT_SECRET=<CLIENT_SECRET>
   ```
   Keep in mind that you can also change the way Keycloak is started, for example:
   ```shell
   docker run -p 8080:8080 gids-idp-yivi -e CLIENT_ID=<CLIENT_ID> -e CLIENT_SECRET=<CLIENT_SECRET> -e KEYCLOAK_STARTUP_ARGUMENTS="start-dev --debug"
   ```
## After startup
When the container is running, the following is prepared:
1. The username/password `keycloak/keycloak` can be used to login to [the admin console](http://localhost:8080/admin)
2. A realm named `yivi` is being imported. This realm has a [federated identity provider](http://localhost:8080/admin/master/console/#/yivi/identity-providers/keycloak-oidc/yivi-keycloak-oidc/settings) configured.
3. Users can login via yivi or create a new account in the idp
