Feature: API - User Search(can search by firstName, lastName, userName, phone & email)

	Background:

	* def authFeature = call read('authenticate.feature')
	* def authToken = authFeature.accessToken
 
  Scenario: get status of all simulators in a given facility
  	
  	* def query = {name: 'smitha'}
    Given url baseUrl
    And path '/api/user-search/Search'
    And params query
    And header Autherization = 'Bearer ' +authToken
    When method GET
    Then status 200
    * print response
    
    * def query = {name: 'somaraj'}
    Given url baseUrl
    And path '/api/user-search/Search'
    And params query
    When method GET
    Then status 200
    * print response
 
     * def query = {name: 'smitha.somaraj@aboutgolf.com'}
    Given url baseUrl
    And path '/api/user-search/Search'
    And params query
    When method GET
    Then status 200
    * print response
    
     * def query = {name: '4085949551'}
    Given url baseUrl
    And path '/api/user-search/Search'
    And params query
    When method GET
    Then status 200
    * print response