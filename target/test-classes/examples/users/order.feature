Feature: Order
Background: 
    * url baseUrl
    * def generator = Java.type('examples.helpers.generator')
    * def name = generator.getName()

    Scenario: Available book

        Given path 'orders'
        And request {"bookId":1, "customerName":"#(name)"}
        When method POST
        Then status 201
        And match response == {'created': true, 'orderId':'#string'}
        * print response

    Scenario: Unavailable book

        Given path 'orders'
        And request {"bookId":2, "customerName":"#(name)"}
        When method POST
        Then status 404
        And match response.error == "This book is not in stock. Try again later."