@custom_conversions
Feature: User is able to create and manage custom conversions
    Background: 
        Given I land on Home screen
        And I press on Menu icon
        And I press on My conversions button 
        And I press on Create your first conversion button
    
    Scenario: User is able to create new conversion
        When I type "Power" as custom conversion name 
        And I press on New unit button
        And I type "Horse power" as unit name
        And I type "HP" as unit symbol
        And I type "1" as unit value
        And I press submit checkmark on Custom conversions screen
        And I press on OK button on Custom conversions screen
        Then I verify "Power" was added to Custom conversions list