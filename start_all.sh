# nodes=("maastro" "mumc")
# for node in "${nodes[@]}"; do
#     KEY_PATH="./${node}/config"
#     if [[ ! -f "${KEY_PATH}/private_key.pem" ]]
#     then
#         echo "Creating a private key for ${node}"
#         python3 ./utils/generate_key.py $KEY_PATH
#     fi
# done

docker volume create datavol-mumc
docker volume create datavol-maastro

docker-compose -f docker-compose.yml up -d

# Setting up the organizations, users, collaborations
docker exec -it vantage6_server vserver-local import -c /config.yaml /init.yaml
