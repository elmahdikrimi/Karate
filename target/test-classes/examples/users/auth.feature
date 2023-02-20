Feature: API Authentication

Background:
    * url baseUrl
    * def generator = Java.type('examples.helpers.generator')
    * def name = generator.getName()
    * def email = generator.getEmail()

    Scenario: Signing in
       
        Given path 'api-clients'
        And request {"clientName": "#(name)","clientEmail": "#(email)"}
        When method POST
        Then status 201
        
        And match response[*] !contains "API client already registered. Try a different email."
        And match response.accessToken == '#present'
        * def token = response.accessToken
        * print "Token was created: ", token