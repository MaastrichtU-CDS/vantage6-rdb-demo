# Stop all services and remove them
docker-compose -f docker-compose.yml down -v

# Remove the networks created by the nodes
networks=("vantage6-mumc-user-net" "vantage6-maastro-user-net")
for network in "${networks[@]}"; do
    docker network rm ${network}
done
