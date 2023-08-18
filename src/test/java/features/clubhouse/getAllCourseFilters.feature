Feature: API - Get all course filters

	Background:
		* def key = apiKey
  	* def sub = subscriptionKey
  	* configure headers = {x-api-version : '2.0', api-key : #(key), Ocp-Apim-Subscription-Key : #(sub)}

  Scenario: Get all simulators for a given facility
  	
    Given url baseUrl
    And path 'api/course/filters'
    When method GET
    Then status 200
    * print response
    * def filterId = response.filters[0].id

		# ----------  Search for a given filter id  --------
    * def query = {filterIds: #(filterId)}
    Then path 'api/course/search'
    And params query
    When method GET
    Then status 200
    * print response
    
    # ----------  Invalid filter id  --------
    * def query = {filterIds: '12345'}
    Then path 'api/course/search'
    And params query
    When method GET
    Then status 404
    * print response
    
    #----------  Validation error  ----------
    * def query = {lastModified: '0001-01-01T00:00:00'}
    Then path 'api/course/search'
    And params query
    When method GET
    Then status 400
    
    