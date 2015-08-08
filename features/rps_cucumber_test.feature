Feature: Starting the game
  In order to play rps
  As a bored office worker
  I want to start a "New Game"

  Scenario: player1 plays against computer
    Given I am on the homepage "/"
    When I enter "Rocco"
    When I hit "Computer"
    Then I see "Make your choice Rocco !"

  Scenario: player1 plays against tactical player
    Given I am on the homepage "/"
    When I enter "Rocco"
    When I hit "TacticalPlayer"
    Then I see "Make your choice Rocco !"






