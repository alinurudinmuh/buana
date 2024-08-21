*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${Browser}      Chrome
${URL}          https://the-internet.herokuapp.com/
${login}        https://the-internet.herokuapp.com/login

# this step is to write Test case in BDD 
*** Test Cases ***
Scenario 2- Login with invalid credentials
    Given user on login page
    When user input invalid username
    And user input invalid password
    And click login button
    Then The system display the error message 


#  step is to implement the keywords following by  BDD statements
*** Keywords ***
user on login page
    Open Browser    ${login}    ${Browser}
user input invalid username
    Input Text    //input[@id='username']    tomsmithson
user input invalid password
    Input Password    //input[@id='password']   thisSuperSecretPassword!
click login button
    Wait Until Element Is Enabled   xpath=//i[@class='fa fa-2x fa-sign-in']
    Click Element    xpath=//i[@class='fa fa-2x fa-sign-in']
The system display the error message 
    Wait Until Element Contains    //div[@id='flash']    Your username is invalid!
    Sleep    2
    Close Browser