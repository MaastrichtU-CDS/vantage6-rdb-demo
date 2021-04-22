# Vantage6 RDB Demo

Demo to explore the Vantage6 framework using a relational database to store the node's data.

## Usage

### Spin up the infrastructure

Run the following command `sh start_all.sh` to:
- create the necessary docker volumes
- run the docker-compose file
- set-up the server database

The docker-compose file will create:
- a container running a postgres database
- a container running a database manager accessible on `localhost:8080`
- the server and two nodes

The docker-compose can be modified to any specific need e.g. having additional nodes.

### Client

After successfully starting the services, the vantage6 client can be used to interact with the server.

### Example in Python
1. Go to the folder [/researcher/python](/researcher/python)
2. Execute `sh run.sh`

The run.py file contains the actual code as a researcher to execute a train on the infrastructure.

### Example in R
1. Go to the folder [/researcher/R](/researcher/R)
2. Execute `sh run.sh`

The test.r file contains the actual code as a researcher to execute a train on the infrastructure.

## How to configure additional stations/users in the central station?

You can login to the shell by using the [server/shell.sh](server/shell.sh) script (executing `cd server && sh shell.sh`). This will open an IPython shell in the server, were users/nodes/collaborations can be added/modified/added. An example is available in [server/setup_fixtures.py](server/setup_fixtures.py).
