Feature: Get user info for Github and check when adding location, location is updated
  Background:
    * url githubBaseURL

  Scenario: Get user public profile should return 200

    Given path '/users/Aya-Akl'
    When method GET
    Then status 200

  Scenario: Get user location from public profile should return 200

    Given path '/users/Aya-Akl'
    When method GET
    Then status 200
    And def userLocation = response.location
    And print "user location is " + userLocation
    And match userLocation == "Cairo, Egypt"

  Scenario: Get user public repos of public user should return 200 status code

    Given path '/users/Aya-Akl/repos'
    When method GET
    Then status 200

  Scenario: GET /user/repo/id github should return 200 status code

    Given path '/repos/Aya-Akl/aya-testing-karate'
    When method GET
    Then status 200

  Scenario: GET /user/repo/id github should return 200 status code and check correct full_name

    Given path '/repos/Aya-Akl/aya-testing-karate'
    When method GET
    Then status 200
    And match response.full_name == "Aya-Akl/aya-testing-karate"

  Scenario: GET /user/repo/id github should return 200 status code and check correct repro clone link

    Given path '/repos/Aya-Akl/aya-testing-karate'
    When method GET
    Then status 200
    And match response.clone_url == "https://github.com/Aya-Akl/aya-testing-karate.git"
