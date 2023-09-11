#!/bin/bash
REALM_CONFIG_FILE="/opt/keycloak/data/import/yivi-realm.json"

echo "Updating the client_id for the realm import to $CLIENT_ID"
sed -i "s/\$CLIENT_ID/$CLIENT_ID/" "$REALM_CONFIG_FILE"
sed -i "s/\$CLIENT_SECRET/$CLIENT_SECRET/" "$REALM_CONFIG_FILE"

echo "Staring Keycloak with the following arguments: $KEYCLOAK_STARTUP_ARGUMENTS"
exec /opt/keycloak/bin/kc.sh $KEYCLOAK_STARTUP_ARGUMENTS
