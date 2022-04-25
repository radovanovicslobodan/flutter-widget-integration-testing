@test
Feature: User registration flow
    Scenario: User can registered with valid email and proper length password
        When I fill the "emailInput" field with "test@test.me"
        And I tap the "nextButton" button
        And I fill the "passwordInput" field with "12345"
        And I tap the "submitButton" button
        Then I expect the text "You succesfully saved your form." to be present