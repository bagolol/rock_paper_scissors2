Feature: Selecting moves

  Scenario: player1 selects rock
    Given I have submitted "Rocco" as my name
    When I hit "rock"
    Then I should see the "rock" element

  Scenario: player1 selects paper
    Given I have submitted "Rocco" as my name
    When I hit "paper"
    Then I should see the "paper" element

  Scenario: player1 selects scissors
    Given I have submitted "Rocco" as my name
    When I hit "scissors"
    Then I should see the "scissors" element


