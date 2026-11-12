Feature: Update a pet
  Background:
    * url 'https://petstore.swagger.io'
    * path 'v2/pet/'
  Scenario: update a dog
    Given request { "name": "Lupita", "category": {"name":"Perro"}, "age":1}
    And method post
    Then status 200

    * def petId = response.id

    Given path '/v2/pet/'
    And request {"id": "#(petId)","name": "Bombon", "category": {"name":"Gato"}, "age": 10}
    When method put
    Then status 200
    And match response.name == "Bombon"
    And match response.category.name == "Gato"