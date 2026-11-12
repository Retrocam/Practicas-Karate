Feature: Users

  Background:
    * url 'https://reqres.in'
    * header x-api-key = "pub_4fd28b551e7ab493bd012e03da54655c28283aa4d9f10017843c12b8d5706b74"

  Scenario: validacion codigo 404
    Given path 'users/666'
    When method get
    Then status 404

  Scenario: validacion mensaje personalizado
    Given path 'users/666'
    When method get
    Then if (responseStatus != 200) karate.fail('Esperaba un 200, recibí: ' + responseStatus)

  Scenario: get all users
    Given path '/api/users?page=2'
    When method get
    Then status 200

    * def first = response.data

    Given path 'api/users', first[0].id
    When method get
    Then status 200

  Scenario: create a user and then get it by id
    * def user =
      """
      {
        "name": "Camilo",
        "job": "leader",
        }
      }
      """

    Given path '/api/users'
    And request user
    When method post
    Then status 201

    * def expectedName = user.name
    * def expectedJob = user.job

    And match response.name == expectedName
    And match response.job == expectedJob

    * def id = response.id
    * print 'created id is: ', id

    #Given path id
    # When method get
    # Then status 200
    # And match response contains user
  