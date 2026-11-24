*** Settings ***
Library          SeleniumLibrary
Resource         ../pages/OrderPage.resource
Resource         ../pages/PaymentPage.resource
Suite Setup      Open Test Browser
Suite Teardown   Close All Browsers
Test Template    Verify Package Payment


*** Variables ***
${ORDER_URL}         https://replace-with-test-environment/order
${BROWSER}           Chrome
${PACKAGE_ID}        PKG001
${PACKAGE_NAME}      Basic Package
${PACKAGE_AMOUNT}    990


*** Test Cases ***
Verify QR Code Payment
    ${PACKAGE_ID}    ${PACKAGE_NAME}    ${PACKAGE_AMOUNT}    QR

Verify Credit Card Payment
    ${PACKAGE_ID}    ${PACKAGE_NAME}    ${PACKAGE_AMOUNT}    CreditCard


*** Keywords ***
Open Test Browser
    Open Browser    ${ORDER_URL}    ${BROWSER}
    Maximize Browser Window

Verify Package Payment
    [Arguments]    ${package_id}    ${package_name}    ${expected_amount}    ${payment_method}
    Navigate To Order Page
    Select Package By ID    ${package_id}
    Verify Package Name    ${package_name}
    Select Payment Method    ${payment_method}
    Verify Package Amount    ${expected_amount}
