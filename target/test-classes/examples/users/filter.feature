Feature: Verify filter

Background:
    * url baseUrl
    * def generator = Java.type('examples.helpers.generator')
    * def limit = generator.getNumber()

Scenario: type:Fiction
    Given path 'books'
    And params {type:'fiction', limit:'#(limit)'}
    When method GET
    Then status 200
    And match each response[*].type == "fiction"
    And print response


Scenario: type:Non-fiction
    Given path 'books'
    And params {type:'non-fiction', limit:'#(limit)'}
    When method GET
    Then status 200
    And match each response[*].type == "non-fiction"
    And print response