@javascript
Feature: Rounds

  Scenario: Showing the rounds
    Given I am a user
    And I am logged in
    And there is a course
    And I've played the course
    And I scored 12 points in that round
    When I navigate to rounds
    Then I should see the round

