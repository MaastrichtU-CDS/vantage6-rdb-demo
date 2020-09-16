cd ../maastro/
sh stop.sh

cd ../mumc/
sh stop.sh

cd ./server/
sh teardown.sh

docker network prune -f
docker volume prune -f