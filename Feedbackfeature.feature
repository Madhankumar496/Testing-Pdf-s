#Author: aba@gmail.com
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

Feature 2:Feedback functionality
 As a user, i should be able to provide feedback inorder to have better user experience in future and 
  when I enter the no details in the necessary fields error should be thrown.


 Background: Open the browser, application and go to the LogIn page
    Given A "chrome" browser initialized
    And Open application "http://zero.webappsecurity.com/"
    

  @smoke
  Scenario:  As a user I should be able to submit feedback into the application
    Given I am on home page
    When I Click on Feedback tab
    Then I navigate to feedback page

 
 Scenario Outline: As a user when I kept one field Empty in feedback form 
                     then I should get an error message.
                     
    Given I am on feedback page
    When I enter Username as <name> and Mailid as<mail id>and Subject as<subject> and Textbox as <textbox>
    And Click on send message button
    Then I validate that I get an error message "please fill out this field"                
    

    Examples: 

      | name       |mail id                  |subject                         | textbox     |
      |“Madhan”   |  “abc@gmail.com”    | “This is Register page”        |    “Feedback”      |
      |“Madhan”   |  “abc@gmail.com”    | “This is Register page”           |          |
      |“Madhan”   |                        | “This is Register page”        |    “Feedback”     |
      |           |   “abc@gmail.com”       | “This is Register page”        |  “Feedback”    |
      |“Madhan”  |                        |                            |   “Feedback”    |
