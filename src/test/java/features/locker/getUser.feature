Feature: API -User Information

	Background:
		* def key = apiKey
  	* def sub = subscriptionKey
  	* configure headers = {x-api-version : '2.0', api-key : #(key), Ocp-Apim-Subscription-Key : #(sub)}

  Scenario: Allows a partner to query for a Locker User by User Id (GUID).
  	
    Given url baseUrl
    And path '/api/partner/user/a9c243d2-093e-11ee-aac0-000d3a4ec90f'
    When method GET
    Then status 200
    * print response