@main_menu
Feature: As a user, I want to convert units
  Background: 
    Given I land on Home screen

  Scenario: When I tap on menu icon, I should see left side menu
    When I press on Menu icon
    Then I should see left side menu

  Scenario: I should be able to open My conversions screen
    When I press on Menu icon
    And I press on My conversions button
    Then I land on My conversions screen



