#Author: Madhankumar@gmail.com.
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions.
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
 
Feature 1: Login functionality
  As a user I should be able to log into the application with only valid credentials
  and should get error message when entered invalid credentials in order to validate login feature.
 
  Background: Open browser, application and go to the LogIn page
    Given A "chrome" browser initialized
    And Open application "http://zero.webappsecurity.com/"
    And I click on Signin button on home page
 

  @smoke
  Scenario: As a user with valid username and password I should be able to log into the application
    Given I am on login page
    When I enter user id as "username" and password as "password"
    And Click on Signin button
    Then I validate that I am able to log into the application and I land on Account summery page
 
 
  Scenario Outline: As a user when I enter invalid userid and password into application
    then I should get an error message.
 
    Given I am on login page
    When I enter user id as <username> and password as <password>
    And Click on Signin button
    Then I validate that I get an error message "Login and/or password are wrong."
 
    Examples: 
      | username        | password     |
      | "username1"    | "password1"    |
      |  ""        |    ""      |
      |    ""      | "pass1"    |
      | "name234"    |  ""        |
      | "12443"         | "@@%$%"    |

