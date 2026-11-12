Feature: prueba inicial

  @prueba1_covid
  Scenario: validacion de api con covid get
    Given url "https://api.covidtracking.com/v1/us/20200501.json?"
    When method get
    Then status 200
