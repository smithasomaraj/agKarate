Feature: API - Get a specific league

	Background:
		* def key = apiKey
  	* def sub = subscriptionKey
  	* configure headers = {x-api-version : '2.0', api-key : #(key), Ocp-Apim-Subscription-Key : #(sub)}

		* def authFeature = call read('authenticate.feature')
	  * def authToken = authFeature.accessToken
	  * def end = authToken.lastIndexOf('"')
		* def fixedToken = authToken.substring(1, end)
	  * def facilityId = '85d94d7e-d3d3-4fc8-87f6-2c44ee6649ad'
	  * url baseUrl
	  
  Scenario: Get a specific Leagues for a given facility
  	
    And path 'api/facility/'+facilityId+'/leagues'
    And header Authorization = 'Bearer ' +fixedToken
    When method GET
    Then status 200
    * print response[0]
    * def leagueId =  response[0].id
    
    And path 'api/facility/'+facilityId+'/league/'+leagueId
    And header Authorization = 'Bearer ' +fixedToken
    When method GET
    Then status 200
    * match response.id == leagueId
    
    #---------------------League not found 404 ----------------------
    And path 'api/facility/'+facilityId+'/league/123456'
    And header Authorization = 'Bearer ' +fixedToken
    When method GET
    Then status 404
    * print response