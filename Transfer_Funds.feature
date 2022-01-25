#Author: Madhankumar@lntinfotech.com
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
 
Feature: Transfer Funds functionality
As a zero bank user, I should be able to use transfer funds option to transfer money
 to different accounts for business/personal purpose with valid data and get an error message with invalid data.
 
  Background: Open browser, application and go to the LogIn page
    Given A "chrome" browser initialized
    And Open application "http://zero.webappsecurity.com/"
 		And I click on Signin button on home page
 		And I enter user id as "username" and password as "password" on login page
 		And click on Signin button
 		And click on Transfer Funds Tab

#Positive 1
  @smoke
  Scenario: As a user when I enter the valid data I should be able to submit my transaction.
    Given I am on Transfer Money & Make Payments page tab.
	When I enter amount as “1000”
	And I select from Account as “Savings”
	And I select To Amount as “Savings”
	And I enter Description as “Savings”
	And click on continue button
	And I click on submit button
	Then I validate that I get an success message “You successfully submitted your transaction.” 

#Positive 2
  @Regression
  Scenario: As a user when I clicking on cancel button I should  move back to Transfer Money & Make Payments page.
  Given I am on Transfer Money & Make Payments page.
         When I enter amount as “5000”
	And I select from Account as “Current”
	And I select To Amount as “Savings”
	And I enter Description as “Savings”
	And click on continue button
	And I click on Cancel button
	Then I validate that I get back to Transfer Money & Make Payments page.


    
#Negative 1
  @Sanity
  Scenario: As a user when I enter the  invalid alphanumeric data in Amount field then I should not be able to move to the next page.
   Given I am on Transfer Money & Make Payments page tab.
	When I enter amount as “GH2ADC”
	And I select from Account as “Current”
	And I select To Amount as “Savings”
	And I enter Description as “My Savings”
	And click on submit button
	Then I validate that I should be on the same page.
    
#Negative 2
  @Sanity
  Scenario: As a user when I enter with invalid special characters data in Amount field then I should not be able to move to the next page.
   Given I am on Transfer Money & Make Payments page tab.
	When I enter amount as “&&@@@$”
	And I select from Account as “Current”
	And I select To Account as “Savings”
	And I enter Description as “My Savings”
	And click on submit button
	Then I validate that I should be on the same page.
	
  
#Negative 3
  @Sanity
  Scenario: As a user when I enter with no data in Amount field then I should not be able to able to move to next page.
   Given I am on Transfer Money & Make Payments page tab.
        When I enter amount as “ ”
	When I select from Account as “Current”
	And I select To Amount as “Savings”
	And I enter Description as “My Savings”
	And click on submit button
	Then I validate that I should be  on the same page.
    
  



