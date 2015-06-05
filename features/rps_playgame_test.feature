Feature: Playing vs the computer

  Scenario: the game continues until one player scores 3 wins
    Given I have submitted "Rocco" as my name
    When I click "Play Game"
    When I select "rock"
    And I hit "Submit"
    Then I should see "Keep playing to win!"

  Scenario: I play a game vs computer and it is a draw
    Given I choose "rock"
    And I hit "Submit"
    Then I Should see "DRAW!" and "Next Move"

  Scenario: I play a game vs computer and I lose
    Given I have submited my "move" "3" times
    Then I should see "Computer wins!"


  Scenario: I play a game vs computer and I win
    Given I have submited my "move" "3" times
    Then I should see "Rocco wins!"


