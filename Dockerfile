FROM quay.io/keycloak/keycloak:17.0.1

RUN /opt/keycloak/bin/kc.sh build --db=postgres --http-relative-path=/auth

COPY theme/ /opt/keycloak/themes/cloakmail
