*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# Placeholder selectors: replace with selectors from the actual application.
${PACKAGE_OPTION}       css:[data-package-id="${package_id}"]
${SELECTED_PACKAGE}     css:.selected-package-name


*** Keywords ***
Navigate To Order Page
    Wait Until Page Contains Element    ${SELECTED_PACKAGE}    10s

Select Package By ID
    [Arguments]    ${package_id}
    ${locator}=    Set Variable    css:[data-package-id="${package_id}"]
    Wait Until Element Is Visible    ${locator}    10s
    Click Element    ${locator}

Verify Package Name
    [Arguments]    ${expected_name}
    Wait Until Element Is Visible    ${SELECTED_PACKAGE}    10s
    Element Text Should Be    ${SELECTED_PACKAGE}    ${expected_name}
