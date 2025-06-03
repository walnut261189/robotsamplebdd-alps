*** Variables ***
${URL}           http://localhost:8000/registration.html

*** Keywords ***
I open the registration page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

I enter "${value}" into the email field
    Input Text    id=email    ${value}

I enter "${value}" into the name field
    Input Text    id=name     ${value}

I enter "${value}" into the password field
    Input Text    id=password    ${value}

I enter "${value}" into the confirm password field
    Input Text    id=confirm_password    ${value}

I click the register button
    Click Button    id=register

I should see a successful registration message
    Page Should Contain    Registration Successful

And the email "${email}" should be valid
    ${is_valid}=    Validate Email Format    ${email}
    Should Be True    ${is_valid}
