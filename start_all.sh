# Retrieving the arguments
omop_model=''
while getopts 'o' flag; do
    case "${flag}" in
        o) omop_model='true' ;;
    esac
done

# Setting up the environment variables
if [[ $omop_model ]]
then
    echo "Using the OMOP CDM as the database"
    export OMOP_CDM="True"
else
    echo "Using the default relational database model"
    export OMOP_CDM="False"
fi

# Generating a private key for each node
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
docker volume create datavol-um

docker-compose -f docker-compose.yml up -d

# Setting up the organizations, users, collaborations
sleep 5
docker exec -it vantage6_server vserver-local import -c /config.yaml /init.yaml

# Connecting the datatabase container to the algorithm container's network
# networks=("vantage6-mumc-user-net" "vantage6-maastro-user-net")
# for network in "${networks[@]}"; do
#     i="0"
#     echo "Connecting the database to network ${network}..."
#     while [ $i -eq 0 ]
#     do
#         sleep 2
#         if [[ ! -z `docker network ls -f name=${network} --format '{{.Name}}'` ]]
#         then
#             docker network connect $network vantage6-rdb
#             echo "Successfully connected"
#             i=$[$i+1]
#         else
#             echo "Network still not ready, trying again in 2 seconds..."
#         fi
#     done
# done

echo "Set-up finished"
