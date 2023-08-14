Feature: API - Send round or range to sim

  Background: 
    * def key = apiKey
    * def sub = subscriptionKey
    * configure headers = {x-api-version : '2.0', api-key : #(key), Ocp-Apim-Subscription-Key : #(sub)}
    * url baseUrl
    * def facilityId = '67a044eb-bb41-4d69-8913-4659e72bccaf'
  	* def simulatorId = '70737247-bfd9-4d40-9cdf-4baa3fa688f8'

  Scenario: Send round to sim

    * def requestPayload =
      """
      {
		    "browserId": "a234e678-12e4-52e4-87f6-12e456789abc",
		    "reservationId": 123456,
		    "numberInParty": 5,
		    "savedRound": "a234e678-12e4-52e4-87f6-12e456789abc",
		    "reservedDuration": 53,
		    "lockerAccounts": ["a9c243d2-093e-11ee-aac0-000d3a4ec90f"],
		    "browserPushTime": "2009-06-15T13:45:30Z"
			}
      """
    Given path '/api/facility/'+facilityId+'/simulators/'+simulatorId+'/send-to-sim'
    And request requestPayload
    When method POST
    Then status 202
    * print response
    
    
    
    * requestPayload.lockerAccounts = ["a9c243d2-093e-11ee-aac0-000d3a4ec9"]
    Given path '/api/facility/'+facilityId+'/simulators/'+simulatorId+'/send-to-sim'
    And request requestPayload
    When method POST
    Then status 400
	* print response
	
	
#	****************  Invalid FacilityId ****************
	* def facilityId = '67a044eb-bb41-4d69-8913-4659e72bcca'
	  Given path '/api/facility/'+facilityId+'/simulators/'+simulatorId+'/send-to-sim'
    And request requestPayload
    When method POST
    Then status 404
	* print response
	
	