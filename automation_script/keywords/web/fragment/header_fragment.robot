*** Settings ***
Resource    ${CURDIR}/../locator/fragment/header_fragment.robot

*** Keywords ***
Input text on search box
    [Documentation]    Input search keyword in search box
    [Arguments]    ${keyword}
    common_keywords.Input Text    ${headerFragmentLocator}[input_search_box]    ${keyword}