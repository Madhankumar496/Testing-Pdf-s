#Author: madhankumar@lntinfotech.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
 
Feature: Search box functionality
  As a user, I should be able to use search box effectively to search with different valid inputs and 
     when I enter the invalid inputs should be redireced to No result found page

  Background: Open browser, application and go to the LogIn page
    Given A "chrome" browser initialized
    And Open application "http://zero.webappsecurity.com/"
    When i enter username as "username" and password as "password"
    And i click on Signin button

#Positive 1
  @smoke
  Scenario: As a user when I enter the valid data I should be able to view correct result.
    Given I am on home page
    When I enter search input as "Online Banking"
    And Click on Enter button from keyboard
    Then I validate that I am able to view the searched link and on clicking on link I should navigate to Online Banking page.
    
#Positive 2
  @smoke
  Scenario: As a user when I enter the valid data I should be able to view correct result.
    Given I am on home page
    When I enter search input as "Pay Bills"
    And Click on Enter button from keyboard
    Then I validate that I am able to view the searched link and on clicking on link I should navigate to Pay bills page.

#Positive 3
  @smoke
  Scenario: As a user when I enter the valid data I should be able to view correct result.
    Given I am on home page
    When I enter search input as "My Money Map"
    And Click on Enter button from keyboard
    Then I validate that I am able to view the searched link and on clicking on link should land me on My Money Map page



#Positive 4
  @smoke
  Scenario: As a user when I enter the valid data I should be able to view correct result.
    Given I am on home page
    When I enter search input as "Online Statements"
    And Click on Enter button from keyboard
    Then I validate that I am able to view the searched link and on clicking on link should land me on Online Statements page.


#Positive 5
  @smoke
  Scenario: As a user when I enter the valid data I should be able to view correct result.
    Given I am on home page
    When I enter search input as "Transfer Funds"
    And Click on Enter button from keyboard
    Then I validate that I am able to view the searched link and on clicking on link should land me on Transfer funds page.