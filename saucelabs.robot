*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}          https://www.saucedemo.com/
${WEB_BROWSER}       Chrome
${LOGIN_USER}        ajayofficial1810@gmail.com
${LOGIN_PASSWORD}    Ajaymurugan@123#

*** Test Cases ***
TC_Login_And_Logout_Verification
    Open Login Page
    Enter User Credentials
    Validate Home Page
    Logout From System
    Terminate Browser Session

*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}    ${WEB_BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id=user-name

Enter User Credentials
    Input Text        id=user-name    ${LOGIN_USER}
    Input Password    id=password     ${LOGIN_PASSWORD}
    Click Element     id=login-button

Validate Home Page
    Wait Until Page Contains    Products
    Element Should Be Visible    xpath=//span[@class='title']

Logout From System
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Link    id=logout_sidebar_link
    Wait Until Element Is Visible    id=user-name

Terminate Browser Session
    Close Browser
