Feature: Example feature

  As a user of the worlds simplest application,
  I want to be able to instantly see what version I am running,
  so that I can be sure it's the latest version

  Scenario: View version number on Home screen
    Given I am on the Home screen
    Then I should see the version number "1.0.0"
