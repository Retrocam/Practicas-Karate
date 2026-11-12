Feature: Delete a pet
  Background:
    * url 'https://petstore.swagger.io'
    * path 'v2/pet/'

  Scenario: delete a dog
    Given request { "name": "Lupita", "category": {"name":"Perro"}, "age":1}
    And method post
    And status 200
    * def petId = response.id
    Given path '/v2/pet/', petId
    And method delete
    Then status 200
    And match response.message == "#(petId.toString())"
