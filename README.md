# robotsamplebdd-alps
A robot framework sample implementation 

✅ Project Requirements
You want a test for a registration form with:

Fields: email, name, password, confirm password

Button: register

✅ Tools Used
Robot Framework

robotframework-seleniumlibrary

robotframework-browser (optional)

robotframework-pythonlibcore

GherkinLibrary – for BDD-style Gherkin syntax support

✅ Step 1: Install Requirements
```
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-gherkin
pip install selenium

```
✅ Step 2: Folder Structure
```
robot-bdd-registration/
│
├── features/
│   └── registration.feature
│
├── steps/
│   └── registration_steps.robot
│
├── resources/
│   └── registration_keywords.robot
│
├── tests/
│   └── registration_test.robot
│
└── robotfile.py  # Optional if you want Python-level custom logic

```

✅ Step 3: registration.feature
```
Feature: Registration Form

  Scenario: Successful registration with valid details
    Given I open the registration page
    When I enter "test@example.com" into the email field
    And I enter "John Doe" into the name field
    And I enter "Password123" into the password field
    And I enter "Password123" into the confirm password field
    And I click the register button
    Then I should see a successful registration message

```

✅ Step 4: registration_steps.robot
```
*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/registration_keywords.robot
Library           GherkinLibrary

*** Test Cases ***
BDD Scenario: Successful registration with valid details
    [Tags]    registration
    Given I open the registration page
    When I enter "test@example.com" into the email field
    And I enter "John Doe" into the name field
    And I enter "Password123" into the password field
    And I enter "Password123" into the confirm password field
    And I click the register button
    Then I should see a successful registration message

```

✅ Step 5: registration_keywords.robot

```
*** Variables ***
${URL}           http://localhost:8000/registration

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

```
📝 Adjust the id=... selectors to match your actual HTML.

✅ Step 6: Run the Test
```
robot -d results tests/registration_test.robot
```
✅ Optional: HTML Form Example (for Testing)
```
<!-- Save as registration.html -->
<html>
  <body>
    <h2>Registration</h2>
    <form>
      <input id="email" type="email" placeholder="Email"><br>
      <input id="name" type="text" placeholder="Name"><br>
      <input id="password" type="password" placeholder="Password"><br>
      <input id="confirm_password" type="password" placeholder="Confirm Password"><br>
      <button id="register" type="button" onclick="document.body.innerHTML += '<p>Registration Successful</p>'">Register</button>
    </form>
  </body>
</html>

```
Start a simple web server in the same folder:
```
python3 -m http.server

```
Navigate to http://localhost:8000/registration.html

✅ Optional: Custom Python Logic
If you want to add some custom logic in Python (e.g., to validate input), you can create a robotfile.py:
```
from robot.api.deco import keyword

class CustomLibrary:
    @keyword
    def validate_email_format(self, email):
        import re
        return bool(re.match(r"[^@]+@[^@]+\.[^@]+", email))

```
Then in your .robot file:
```
Library    robotfile.py

```
✅ Example: robotfile.py
Place this in the project root:
```
# robotfile.py

from robot.api.deco import keyword

class RegistrationLibrary:

    @keyword
    def validate_email_format(self, email):
        """Validate email format using regex."""
        import re
        pattern = r"[^@]+@[^@]+\.[^@]+"
        return bool(re.match(pattern, email))

```
✅ To Use It in .robot Files
Sample usage example of the python file in resources/registration_keywords.robot file
Add to registration_keywords.robot:
```
Library    ../robotfile.py

${is_valid}=    Validate Email Format    test@example.com
Should Be True  ${is_valid}

```
