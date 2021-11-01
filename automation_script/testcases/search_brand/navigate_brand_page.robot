*** Setting ***
Resource    ${CURDIR}/../../resources/imports/web_import.robot

Test Setup    common_keywords.Open chrome browser and redirect to brand page    ${brand.clinique.url_key}
Test Teardown    common_keywords.Tear Down Test

Force Tags    search_function    search_brand    navigate_brand_page

*** Keywords ***
Get brand detail and input keyword into search box
    [Arguments]    ${brand_id}    ${brand_name}
    brand_api.Get brand detail with brand id    ${brand_id}
    header_fragment.Input text on search box    ${brand_name}

Search any product of brand and verify product list page is displayed
    [Arguments]    ${keyword}
    header_fragment.Input text on search box    ${keyword}
    common_keywords.Press Enter key
    product_list_page_feature.Verify product list page is navigated correctly    ${keyword}

*** Test Cases ***
Verify user is navigated to brand page after search by brand by keyword
    [Tags]    Search_025
    Get brand detail and input keyword into search box    ${brand.clinique.id}    ${brand.clinique.name}
    common_keywords.Press Enter key
    brand_page_feature.Verify brand page is navigated correctly

Verify user is navigated to brand page after search by brand and click brand name is suggestion
    [Tags]    Search_026
    Get brand detail and input keyword into search box    ${brand.clinique.id}    ${brand.clinique.name}
    suggestion_fragment.Click brand name in suggestion list    ${brand.clinique.name}
    brand_page_feature.Verify brand page is navigated correctly