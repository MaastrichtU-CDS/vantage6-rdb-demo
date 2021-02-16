touch containerFiles/default.sqlite

docker run -d \
    --name vantage6_server \
    --restart unless-stopped \
    -p 5000:5000 \
    -e "VANTAGE6_DB_URI=sqlite:////default.sqlite" \
    -e "PROXY_SERVER_PORT=80" \
    -v "$(pwd)/containerFiles/config.yaml:/config.yaml" \
    -v "$(pwd)/containerFiles/default.sqlite:/default.sqlite" \
    -v "/var/run/docker.sock:/var/run/docker.sock" \
    harbor.vantage6.ai/infrastructure/server:1.0.0 vserver-local start -c /config.yaml
