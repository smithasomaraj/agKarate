Feature: API - Create League

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
	  
  Scenario: Create a League
    * def requestPayload =
    
      """
      {
			"FacilityId": "85d94d7e-d3d3-4fc8-87f6-2c44ee6649ad",
		  "Name": "Champions League",
		  "Description": "A league for elite players to showcase their skills.",
		  "LeagueType": "Team",
		  "ParticipantCap": 20,
		  "LeagueScoringType": "Points",
		  "LeagueTeamSize": 3,
		  "LeagueStartDate": "2023-08-30T14:00:00.000Z",
		  "LeagueStartDateTimezone": "Eastern Standard Time",
		  "LeagueEndDate": "2023-12-01T14:00:00.000Z",
		  "LeagueEndDateTimezone": "Eastern Standard Time",
		  "HandicapMethod": "Net"
			}
      """
    And request requestPayload
    Given path '/api/facility/'+facilityId+'/league'
    And header Authorization = 'Bearer ' +fixedToken
    * requestPayload.FacilityId = facilityId
    * def randomNo = call read('classpath:javaScript/randomIntGenerator.js')(5)
    * requestPayload.Name = 'QA League '+ randomNo
    * def date = call read('classpath:javaScript/currentDate.js')
  	* requestPayload.LeagueStartDate = date
    And request requestPayload
    When method POST
    Then status 201
    * print response
    
    #---------------   Duplicate League   409 -----------------
    
     And request requestPayload
    Given path '/api/facility/'+facilityId+'/league'
    And header Authorization = 'Bearer ' +fixedToken
    * requestPayload.FacilityId = facilityId
    * requestPayload.Name = 'QA League '+ randomNo
    * requestPayload.LeagueStartDate = date
    And request requestPayload
    When method POST
    Then status 409
    * print response
    
    #---------------   Invalid facilityId   403 -----------------
    
     And request requestPayload
    Given path '/api/facility/85d94d7e-1111-4fc8-87f6-2c44ee6649ad/league'
    And header Authorization = 'Bearer ' +fixedToken
    * requestPayload.FacilityId = '85d94d7e-1111-4fc8-87f6-2c44ee6649ad'
    * requestPayload.Name = 'QA League '+ randomNo
    * requestPayload.LeagueStartDate = date
    And request requestPayload
    When method POST
    Then status 403
    * print response
    
    
    #---------------   Invalid facilityId   400 -----------------
    And request requestPayload
    Given path '/api/facility/'+facilityId+'/league'
    And header Authorization = 'Bearer ' +fixedToken
    * requestPayload.FacilityId = facilityId
    * requestPayload.Name = 'QA League '+ randomNo
    * def date = call read('classpath:javaScript/currentDate.js')
  	* requestPayload.LeagueStartDate = date
  	* requestPayload.LeagueEndDate = date
    And request requestPayload
    When method POST
    Then status 400
    * print response
    
 