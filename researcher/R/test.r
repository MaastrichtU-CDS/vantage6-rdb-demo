# Function to create a client
setup.client <- function() {
  # Username/password should be provided by the administrator of
  # the server.
  username <- "researcher"
  password <- "password"
  
  host <- 'http://172.17.0.1:5000'
  api_path <- '/api'
  
  # Create the client & authenticate
  client <- vtg::Client$new(host, api_path=api_path)
  client$authenticate(username, password)

  return(client)
}

# Create a client
client <- setup.client()

# Get a list of available collaborations
print( client$getCollaborations() )

# Instruct the client to use collaboration "PIPELINE".
client$setCollaborationId(1)

# Get column names from all clients
vtg.basic::colnames(client)
