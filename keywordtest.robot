*** Settings ***
Library    keywords.py    WITH NAME    Calculator

*** Variables ***
${A}    10
${B}    5

*** Test Cases ***
Addition Test
    ${result}=    Calculator.Add    ${A}    ${B}
    Should Be Equal As Numbers    ${result}    15

Subtraction Test
    ${result}=    Calculator.Subtract    ${A}    ${B}
    Should Be Equal As Numbers    ${result}    5

Multiplication Test
    ${result}=    Calculator.Multiply    ${A}    ${B}
    Should Be Equal As Numbers    ${result}    50

Division Test
    ${result}=    Calculator.Divide    ${A}    ${B}
    Should Be Equal As Numbers    ${result}    2
