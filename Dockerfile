FROM sharedcloud/frp
MAINTAINER Sharedcloud <admin@sharedcloud.io>

WORKDIR /root

COPY create_tunnel_client.sh .

ENTRYPOINT ["/root/create_tunnel_client.sh"]