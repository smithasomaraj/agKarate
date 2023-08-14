Feature: API - Create User

  Background: 
    * def key = apiKey
    * def sub = subscriptionKey
    * configure headers = {x-api-version : '2.0', api-key : #(key), Ocp-Apim-Subscription-Key : #(sub)}
    * url baseUrl

  Scenario: Create a new user

  * def phone = call read('classpath:javaScript/randomIntGenerator.js')(10)
    * def requestPayload =
      """
      {
        "userName": "sjones",
        "firstName": "Steve",
        "lastName": "Jones",
        "dateOfBirth": "1990-04-23T00:00:00Z",
        "email": "newuser@newuser.com",
        "phoneNumber": "1234598844",
        "countryCode": "1"
      }
      """
    * requestPayload.phoneNumber = phone
    * requestPayload.email = phone+'@newuser.com'
    * requestPayload.userName = phone
    * print requestPayload.phoneNumber
    Given path '/api/partner/user'
    And request requestPayload
    When method POST
    Then status 201
    * print response
    
	  * requestPayload.phoneNumber = phone
    * requestPayload.email = phone+'@newuser.com'
    * requestPayload.userName = phone
    * print requestPayload.phoneNumber
    Given path '/api/partner/user'
    And request requestPayload
    When method POST
    Then status 409
    * print response
    Then match response.title == 'username already exists'
 
 		* def userName = call read('classpath:javaScript/randomIntGenerator.js')(10)
  	* requestPayload.phoneNumber = phone
    * requestPayload.email = phone+'@newuser.com'
    * requestPayload.userName = userName
    * print requestPayload.phoneNumber
    Given path '/api/partner/user'
    And request requestPayload
    When method POST
    Then status 409
    * print response
    Then match response.title == 'Phone number already exists.'
    
    * def email = call read('classpath:javaScript/randomIntGenerator.js')(10)
    * requestPayload.phoneNumber = email
    * requestPayload.email = phone+'@newuser.com'
    * requestPayload.userName = email
    * print requestPayload.phoneNumber
    Given path '/api/partner/user'
    And request requestPayload
    When method POST
    Then status 409
    * print response
    Then match response.title == 'The email address is not available.'
    
	* def invalidPhone = call read('classpath:javaScript/randomStringGenerator.js')(10)
  	* requestPayload.phoneNumber = invalidPhone
    * requestPayload.email = phone+'@newuser.com'
    * requestPayload.userName = userName
    * print requestPayload.phoneNumber
    Given path '/api/partner/user'
    And request requestPayload
    When method POST
    Then status 409
    * print response
    Then match response.title == 'Phone Number is invalid.'