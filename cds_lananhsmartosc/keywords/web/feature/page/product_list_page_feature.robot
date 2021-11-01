*** Keywords ***
Verify product list page is navigated correctly
    [Arguments]    ${search_keyword}
    common_keywords.Wait until page is completely loaded
    product_list_page.Verify search title is displayed correctly    ${search_keyword}
    product_list_page.Verify button sort filter is displayed
    product_list_page.Verify tool bar part is displayed