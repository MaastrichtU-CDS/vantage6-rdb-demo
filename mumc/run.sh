datavolume_name="datavol-mumc"

docker volume create $datavolume_name

docker run -d \
    --name "vantage6-mumc-user" \
    --restart unless-stopped \
    -e DATA_VOLUME_NAME=$datavolume_name \
    -e DATABASE_URI=/database.csv \
    -v $(pwd)/log:/mnt/log \
    -v ${datavolume_name}:/mnt/data \
    -v $(pwd)/config:/mnt/config \
    -v $(pwd)/data/Clinical2.csv:/database.csv \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --link vantage6_server \
    harbor.distributedlearning.ai/infrastructure/node vnode-local start -c /mnt/config/mumc.yaml --dockerized
