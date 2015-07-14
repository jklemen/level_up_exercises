#encoding: utf-8

Feature: Sad Logging In
  In order to register
  As an online shopper
  I should log in
  And begin shopping

  Scenario: I enter invalid credentials
    Given I have an account on the shopping site
    When I incorrectly enter my username and password
    Then I will not be taken to the home page
    And an error message will appear

  Scenario: I enter nothing
    Given I have an account on the shopping site
    When I enter nothing into the username and password fields
    Then I will not be taken to the home page
    And an error message will appear

