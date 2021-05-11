# Vantage6 RDB Demo

Demo to explore the Vantage6 framework using a relational database to store the node's data.

## :exclamation: Issues

Currently there are two problems when setting up the server infrastructure from a config file (`/server/config/init.yaml`):
1. Not possible to set up an unencrypted collaboration
2. Not possible to give user the needed permissions

Problem 1 is currently fixed by copying the fixed vantage6 server fixture file (`/utils/fixture.py`) directly to the container and replacing the original. However, solving problem 2 requires some manual steps:
- Open the db manager at `localhost:8080` and log in into the database
- Go to "Permission" table in the "ServerDB"
- Insert a new row for `user_id` 2 with `role_id` 3

This should give the require permissions for the researcher to send tasks.

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
2. Execute `sh run.sh` or `python3 run.py` if you have the dependencies already installed in your local python version.

The run.py file contains the actual code as a researcher to execute a train on the infrastructure.

### Example in R (Not tested yet)
1. Go to the folder [/researcher/R](/researcher/R)
2. Execute `sh run.sh`

The test.r file contains the actual code as a researcher to execute a train on the infrastructure.

## How to configure additional stations/users in the central station?

You can login to the shell by using the [server/shell.sh](server/shell.sh) script (executing `cd server && sh shell.sh`). This will open an IPython shell in the server, were users/nodes/collaborations can be added/modified/added. An example is available in [server/setup_fixtures.py](server/setup_fixtures.py).
