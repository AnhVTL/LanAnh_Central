*** Setting ***
Resource    ${CURDIR}/../../resources/imports/web_import.robot

Test Setup    common_keywords.Open chrome browser and redirect to brand page    ${brand.clinique.url_key}
Test Teardown    common_keywords.Tear Down Test

Force Tags    search_function    search_brand    navigate_product_detail_page

*** Test Cases ***
Verify user is navigated to brand page after search by brand by keyword
    [Tags]    Search_029
    search_api.Get suggestion data with search by keyword    ${brand.clinique.name}
    ${rand_product_sku}    common_keywords.Get random element from array    ${api_product_sku_arr}
    header_fragment.Input text on search box    ${brand.clinique.name}
    suggestion_fragment.Click product name in suggestion list    ${rand_product_sku}
    product_detail_page_feature.Verify product detail page is navigated correctly with API verify    ${rand_product_sku}