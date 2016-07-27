Feature: Reading deployment files

  Scenario: Execute code before downloading artifact
    Given a deployment has been triggered
     When bitenvoy pulls down the deployment config file
     Then it should execute code associated with the before download step

# Feature: Agent establishes a ws/s connection
#   Scenario: ws
#   Scenario: wss
#   Scenario: http
#   Scenario: https



# 1. They need to establish a ws/s connection
# 1. Standardize config
# 1. Need to be able read a yml file
#  - Read JSON config

#  1. Interpreting yml config and performing deployment

#  2. wss

#  2. reading deployment JSON thing



#  Application Name
