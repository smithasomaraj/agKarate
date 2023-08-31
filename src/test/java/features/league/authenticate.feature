Feature: API - Returns auth token for clubhouse

  Background: 
    * def key = apiKey
    * def sub = subscriptionKey
    * configure headers = {api-key : #(key)}
    * url baseUrl

 Scenario: API to get access token
 
     * def requestPayload =
      """
      {
		    "userName": "smitha.somaraj@aboutgolf.com",
		    "password": "q8mnhbMA"
			}
      """
    
    Given path 'api/users/authenticate'
    And request requestPayload
    When method POST
    Then status 200
    * print response
    * def accessToken =  response