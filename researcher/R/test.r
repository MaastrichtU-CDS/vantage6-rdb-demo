# This assumes the package 'devtools' is installed and will automatically
# install the package 'vtg'.
devtools::install_github('mellesies/vtg.basic', subdir='src')

# Function to create a client
setup.client <- function() {
  # Username/password should be provided by the administrator of
  # the server.
  username <- "johan"
  password <- "1234"
  
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

# Should output something like this:
#   id     name
# 1  1 ZEPPELIN
# 2  2 PIPELINE

# Instruct the client to use collaboration "PIPELINE".
client$setCollaborationId(1)


# Since vtg.basic exports function names that collide with built-in functions, 
# it's probably better to not attach the package, but call functions with a prefix instead. 
vtg.basic::colnames(client)

# Should output something like this:
# [[1]]
#  [1] "Age"      "Race2"    "Race3"    "Mar2"     "Mar3"     "Mar4"     "Mar5"    
#  [8] "Mar9"     "Hist8520" "hist8522" "hist8480" "hist8501" "hist8201" "hist8211"
# [15] "grade"    "ts"       "nne"      "npn"      "er2"      "er4"      "Time"    
# [22] "Censor"  
# 
# [[2]]
#  [1] "Age"      "Race2"    "Race3"    "Mar2"     "Mar3"     "Mar4"     "Mar5"    
#  [8] "Mar9"     "Hist8520" "hist8522" "hist8480" "hist8501" "hist8201" "hist8211"
# [15] "grade"    "ts"       "nne"      "npn"      "er2"      "er4"      "Time"    
# [22] "Censor"