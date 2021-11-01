*** Setting ***
Resource    ${CURDIR}/../../resources/imports/web_import.robot

Test Setup    common_keywords.Open chrome browser and redirect to brand page    ${brand.clinique.url_key}
Test Teardown    common_keywords.Tear Down Test

Test Template    Template - Search any product of brand and verify product list page is displayed
Library    DataDriver    file=../../resources/data_driven_data/DataDriven.xlsx    sheet_name=product_list    encoding=UTF-8

Force Tags    search_function    search_brand    navigate_product_list    ddt

*** Keywords ***
Template - Search any product of brand and verify product list page is displayed
    [Arguments]    ${keyword}
    header_fragment.Input text on search box    ${keyword}
    common_keywords.Press Enter key
    product_list_page_feature.Verify product list page is navigated correctly    ${keyword}

*** Test Cases ***
Verify user is navigated to product list page after search any product of brand
    [Tags]    Search_027    Search_028
    User search with '${keyword}'    ${keyword}