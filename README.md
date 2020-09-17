# Vantage6 Docker Demo

**This repository is still work-in-progress, please note that the documentation may be incomplete**

## How to run this infrastructure?

### The quick method
Run the file [start_all.sh](start_all.sh) by executing `sh start_all.sh`

### the elaborate method
1. Clone this repository on your local machine (using `git clone https://gitlab.com/UM-CDS/pht/vantage6-docker-demo.git`)
2. Go to the [/server](/server) folder, and execute `sh run.sh`
3. Go to the [/maastro](/server) folder, and execute `sh run.sh`
4. Go to the [/mumc](/server) folder, and execute `sh run.sh`

## How to run this as a researcher?

### In Python
1. Go to the folder [/researcher/python](/researcher/python)
2. Execute `sh run.sh`

The run.py file contains the actual code as a researcher to execute a train on the infrastructure.

### In R
1. Go to the folder [/researcher/R](/researcher/R)
2. Execute `sh run.sh`

The test.r file contains the actual code as a researcher to execute a train on the infrastructure.

## How to configure additional stations/users in the central station?

You can login to the shell by using the [server/shell.sh](server/shell.sh) script (executing `cd server && sh shell.sh`). This will open an IPython shell in the server, were users/nodes/collaborations can be added/modified/added. An example is available in [server/setup_fixtures.py](server/setup_fixtures.py).