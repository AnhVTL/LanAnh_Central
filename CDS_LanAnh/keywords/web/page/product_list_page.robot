*** Settings ***
Resource    ${CURDIR}/../locator/page/product_list_page.robot

*** Keywords ***
Verify search title is displayed correctly
    [Arguments]    ${search_keyword}
    ${locator}    String.Format String    ${productListPageLocator}[txt_search_title]    search_keyword=${search_keyword}
    common_keywords.Wait Element Is Visible    ${locator}

Verify button sort filter is displayed
    common_keywords.Wait Element Is Visible    ${productListPageLocator}[button_sort_filter]

Verify tool bar part is displayed
    common_keywords.Wait Element Is Visible    ${productListPageLocator}[part_tool_bar]