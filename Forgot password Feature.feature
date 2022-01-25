Feature 5: Forgotten Password functionality
            As a user of Zero bank,
           I should be able to enter valid email in order to generate new password and 
           when I enter invalid email into forgot password page then I should get an error message

    Background: Open browser, application and go to the LogIn page
    Given A "chrome" browser initialized
    And Open application "http://zero.webappsecurity.com/"
    And I click on Signin button on home page
    And I logged into zerobank account.


     Scenerio : As a user of Zero bank,
       I should be able to enter valid email in order to generate new password
	Given I navigates to the website zero.webappsecurity.com
	When I click on Sign-in button
	And I navigate to Login Page
	And I click on "Forgotten Password"
	And I navigate to Forgotten Password page
	And I enter "asdfu@gamil.com" in the "Email" field
	And I press the "Send Password" button
	Then I should get the "new password" to my Email.

	Scenario Outline: As a user when I enter invalid email into forgot password page then I should get an error message

	Given I am on Forgot Password Page
	When I enter invalid EmailID as <EmailID>
	And I click on submit
	Then I should get an Error message as “Invalid Email Address”



	Examples:
	|EmailID|

	|"1232@@gmail.com"|
	|""|
	|"123@gmail"|