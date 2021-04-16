docker volume create datavol-mumc
docker volume create datavol-maastro

docker-compose -f docker-compose.yml up -d

sleep 5s
docker exec -it vantage6_server vserver-local import -c /config.yaml /init.yaml
