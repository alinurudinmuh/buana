*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${Browser}      Chrome
${URL}          https://the-internet.herokuapp.com/

# this step is to write Test case in BDD 
*** Test Cases ***
Scenario 1- Login with correct credentials 
    Given open the base url
    When click basic Form Authentication
    And redirected login page
    And user input username 
    And user input password
    And click login button
    Then verify the login successful page

#  step is to implement the keywords following by  BDD statements
*** Keywords ***

open the base url 
    Open Browser    ${url}    ${Browser}

click basic Form Authentication
    Wait Until Element Is Enabled    //a[normalize-space()='Form Authentication']
    Click Element    //a[normalize-space()='Form Authentication']
redirected login page
    Wait Until Element Contains    //h2[normalize-space()='Login Page']    Login Page
user input username 
    Input Text    //input[@id='username']    tomsmith
user input password
    Input Password   //input[@id='password']   SuperSecretPassword!
click login button
    Wait Until Element Is Enabled   xpath=//i[@class='fa fa-2x fa-sign-in']
    Click Element    xpath=//i[@class='fa fa-2x fa-sign-in']
verify the login successful page
    Wait Until Element Contains    //div[@id='flash']     You logged into a secure area!
    Wait Until Element Contains    //h2[normalize-space()='Secure Area']    Secure Area
    Sleep    3
    Close Browser