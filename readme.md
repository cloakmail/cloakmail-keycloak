# Cloakmail Keycloak 

Customized Keycloak image for Cloakmail 

### Development

#### Start container
```
cd local_setup && docker-compose up 
```

#### Set up realm
1. Go to http://localhost:8081/auth/admin/master/console/#/create/realm
2. Upload realm-export.json

#### Edit theme
The themes located in the **theme** directory are mounted into the container and are hot reloaded.


### Links
- [Login](http://localhost:8081/auth/realms/cloakmail/protocol/openid-connect/auth?response_type=code&client_id=web&scope=openid&redirect_uri=http://localhost:8080)
- [Account](http://localhost:8081/auth/realms/cloakmail/account/)
