*** Setting ***
Resource    ${CURDIR}/../../resources/imports/web_import.robot

Test Setup    common_keywords.Open chrome browser and redirect to brand page    ${brand.clinique.url_key}
Test Teardown    common_keywords.Tear Down Test

Test Template    Template - Search brand by keyword and verify suggestion list
Library    DataDriver    file=../../resources/data_driven_data/DataDriven.xlsx    sheet_name=suggestion_list    encoding=UTF-8

Force Tags    search_function    search_brand    suggestion_list    ddt

*** Keywords ***
Template - Search brand by keyword and verify suggestion list
    [Arguments]    ${keyword}
    search_api.Get suggestion data with search by keyword    ${keyword}
    header_fragment.Input text on search box    ${keyword}
    suggestion_fragment_feature.Verify suggestion list data is displayed correctly with verify with API

*** Test Cases ***
Verify suggestion list show correctly on UI
    [Tags]    Search_012    Search_013    Search_014    Search_015
    User search with '${keyword}'    ${keyword}