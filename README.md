# Sharedcloud-tunnel-client

This repository represents the client side of the tunnel in charge of creating the connections with the instances

### Use

The following ENV vars need to be passed when creating the Docker container:

* `SERVER_ADDR`: Describes the ip address of the tunnel server
* `SERVER_PORT`: Describes the tcp port where the tunnel server expects the connection

* `LOCAL_IP`: Describes the ip address where the local service is running
* `LOCAL_PORT`: Describes the port where the local service is running
* `HTTP_USER`: Describes the username required to connect to the tunnel
* `HTTP_PWD`: Describes the password required to connect to the tunnel
* `CUSTOM_DOMAINS`: Describes the ip address of the tunnel server

For example:
```
docker run --rm --name sharedcloud-tunnel-client -e SERVER_ADDR=77.34.22.187 \
                                                 -e SERVER_PORT=7000 \
                                                 -e LOCAL_IP=0.0.0.0 \
                                                 -e LOCAL_PORT=8001 \
                                                 -e HTTP_USER=admin \
                                                 -e HTTP_PWD=password \
                                                 -e CUSTOM_DOMAINS=77.34.22.187 \
                                                 sharedcloud-tunnel-client
```