mkdir server
touch server/default.sqlite

docker run -d \
    --name vantage6_server \
    -p 5000:5000 \
    -e "VANTAGE6_DB_URI=sqlite:////default.sqlite" \
    -e "PROXY_SERVER_PORT=80" \
    -v "$(pwd)/server/config.yaml:/config.yaml" \
    -v "$(pwd)/server/default.sqlite:/default.sqlite" \
    -v "/var/run/docker.sock:/var/run/docker.sock" \
    harbor.vantage6.ai/infrastructure/server vserver-local start -c /config.yaml