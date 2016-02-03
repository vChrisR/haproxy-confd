haproxy-confd
=============

Dockerfile for haproxy and confd. Currently using this in additon to gliderlabs/registrator for service discovery.

You must pass the etcd peer address with the `-e` flag in `docker run` so that it can connect to your etcd cluster.

ex: `docker run -e "ETCD_ADDR=127.0.0.1:4001" vchrisr/haproxy-confd`

Pass an override directory with the `-v` flag in the `docker run` command.

### Usage

    docker run -d -e "ETCD_ADDR=127.0.0.1:4001" -p 80:80 vchrisr/haproxy-confd
