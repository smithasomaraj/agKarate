Feature: API - Get all simulators

	Background:
		* def key = apiKey
  	* def sub = subscriptionKey
  	* configure headers = {x-api-version : '2.0', api-key : #(key), Ocp-Apim-Subscription-Key : #(sub)}
  	* def facilityId = '67a044eb-bb41-4d69-8913-4659e72bccaf'

  Scenario: Get all simulators for a given facility
  	
    Given url baseUrl
    And path '/api/facility/'+facilityId+'/simulators'
    When method GET
    Then status 200
    * print response
    
  Scenario: Invalid facility id
  	
    Given url baseUrl
    And path '/api/facility/67a044eb-bb41-4d69-8913-4659e72bcca/simulators'
    When method GET
    Then status 404
    * print response

  Scenario: get status of all simulators in a given facility
  	
    Given url baseUrl
    And path '/api/facility/'+facilityId+'/simulators/status'
    When method GET
    Then status 200
    * print response
 
   Scenario: get status of a single simulator in a given facility
  	
    Given url baseUrl
    And path '/api/facility/'+facilityId+'/simulators/70737247-bfd9-4d40-9cdf-4baa3fa688f8/status'
    When method GET
    Then status 200
    * print response
     
