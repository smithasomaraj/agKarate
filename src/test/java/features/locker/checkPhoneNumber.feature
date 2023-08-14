Feature: API - Check a phone number has a locker account attached to it

	Background:
		* def key = apiKey
  	* def sub = subscriptionKey
  	* configure headers = {x-api-version : '2.0', api-key : #(key), Ocp-Apim-Subscription-Key : #(sub)}

  Scenario: Check valid phone number
  	
  	* def query = {phoneNumber : '4085949551', countryCode : '1'}
    Given url baseUrl
    And path '/api/partner/check-phone-number'
    And params query
    When method GET
    Then status 200
    And match response.userName == 'Smitha'
    * def jsonResponse = response
    * print jsonResponse.userId
    
    * print response
    
    
  Scenario: Invalid phone number
  	
  	* def query = {phoneNumber : '408594955', countryCode : '1'}
    Given url baseUrl
    And path '/api/partner/check-phone-number'
    And params query
    When method GET
    Then status 400
    * print response
    
  Scenario: Invalid Country Code
  	
  	* def query = {phoneNumber : '4085949551', countryCode : '11'}
    Given url baseUrl
    And path '/api/partner/check-phone-number'
    And params query
    When method GET
    Then status 400
    * print response