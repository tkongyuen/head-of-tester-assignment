*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# Placeholder selectors: replace with selectors from the actual application.
${PAYMENT_AMOUNT}      css:.payment-total


*** Keywords ***
Select Payment Method
    [Arguments]    ${payment_method}
    ${locator}=    Set Variable    css:input[name="paymentMethod"][value="${payment_method}"]
    Wait Until Element Is Visible    ${locator}    10s
    Click Element    ${locator}

Verify Package Amount
    [Arguments]    ${expected_amount}
    Wait Until Element Is Visible    ${PAYMENT_AMOUNT}    10s
    ${actual_amount}=    Get Text    ${PAYMENT_AMOUNT}
    Should Be Equal    ${actual_amount}    ${expected_amount}
