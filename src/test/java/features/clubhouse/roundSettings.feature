Feature: API - Round settings

	Background:
		* def key = apiKey
  	* def sub = subscriptionKey
  	* configure headers = {x-api-version : '2.0', api-key : #(key), Ocp-Apim-Subscription-Key : #(sub)}
  	* def facilityId = facilityId

  Scenario: Get the default round settings for a given facility
  	
    Given url baseUrl
    And path '/api/facility/'+facilityId+'/default-round-settings'
    When method GET
    Then status 200
    * print response
    
  Scenario: Get the saved round settings for a given facility
  	
    Given url baseUrl
    And path '/api/facility/'+facilityId+'/saved-round-settings'
    When method GET
    Then status 200
    * print response