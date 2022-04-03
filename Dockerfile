FROM quay.io/keycloak/keycloak:17.0.1 as builder
RUN /opt/keycloak/bin/kc.sh build --db=postgres --http-relative-path=/auth


FROM quay.io/keycloak/keycloak:17.0.1
WORKDIR /opt/keycloak
COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/
COPY theme/ /opt/keycloak/themes/cloakmail
