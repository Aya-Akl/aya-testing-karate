Feature: sample karate test script    
    If you are using Eclipse, install the free Cucumber-Eclipse plugin from
    https://cucumber.io/cucumber-eclipse/
    Then you will see syntax-coloring for this file. But best of all,
    you will be able to right-click within this file and [Run As -> Cucumber Feature].
    If you see warnings like "does not have a matching glue code",
    go to the Eclipse preferences, find the 'Cucumber User Settings'
    and enter the following Root Package Name: com.intuit.karate    
    Refer to the Cucumber-Eclipse wiki for more: http://bit.ly/2mDaXeV

Background:
* url 'https://jsonplaceholder.typicode.com'

Scenario: get all users and then get the first user by id

Given path 'users'
When method get
Then status 200

* def first = response[0]

Given path 'users', first.id
When method get
Then status 200

Scenario: create a user and then get it by id

* def user =
"""
{
  "name": "Test User",
  "username": "testuser",
  "email": "test@user.com",
  "address": {
    "street": "Has No Name",
    "suite": "Apt. 123",
    "city": "Electri",
    "zipcode": "54321-6789"
  }
}
"""

Given url 'https://jsonplaceholder.typicode.com/users'
And request user
When method post
Then status 201

* def id = response.id
* print 'created id is: ' + id

Given path id
# When method get
# Then status 200
# And match response contains user


#    Given path 'login'
#    And form field username = 'john'
#    And form field password = 'secret'
#    When method post
#    Then status 200
#    And def authToken = response.token

#    * def greeter = function(name){ return 'hello ' + name }
#    * assert greeter('Bob') == 'hello Bob'

#    # pretty print the response payload
#    * configure logPrettyResponse = true
#
## enable ssl (and no certificate is required)
#    * configure ssl = true
#
## enable ssl and force the algorithm to TLSv1.2
#    * configure ssl = 'TLSv1.2'
#
## time-out if the response is not received within 10 seconds (after the connection is established)
#    * configure readTimeout = 10000
#
## set the uri of the http proxy server to use
#    * configure proxy = 'http://my.proxy.host:8080'
#
## proxy which needs authentication
#    * configure proxy = { uri: 'http://my.proxy.host:8080', username: 'john', password: 'secret' }