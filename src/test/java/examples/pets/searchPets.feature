Feature: Search a pet

  Scenario: search a dog
    * call read('createNewPets.feature@create_successful_pet')

    Given url "https://petstore.swagger.io/v2/pet/" + petId
    And method get
    Then status 200