*** Settings ***
Resource    ${CURDIR}/../locator/fragment/suggestion_fragment.robot

*** Keywords ***
Verify Search Keywords part is displayed
    common_keywords.Wait Element Is Visible    ${suggestionFragmentLocator}[txt_search_keywords]

Verify Categories part is displayed
    common_keywords.Wait Element Is Visible    ${suggestionFragmentLocator}[txt_categories]

Verify Products part is displayed
    common_keywords.Wait Element Is Visible    ${suggestionFragmentLocator}[txt_products]

Get search keywords data in suggestion list
    ${search_keyword_data_UI}    common_keywords.Get Elements Text    ${suggestionFragmentLocator}[txt_search_keywords_data]
    [Return]    ${search_keyword_data_UI}

Get categories data in suggestion list
    ${categories_data_UI}    common_keywords.Get Elements Text    ${suggestionFragmentLocator}[txt_categories_data]
    ${category_name_list}    Create List
    FOR    ${idx}    IN RANGE    len(${categories_data_UI})
        ${category_name}    Replace String    ${categories_data_UI}[${idx}]    search_for=in${SPACE}    replace_with=${EMPTY}
        Append To List    ${category_name_list}    ${category_name}
    END
    [Return]    ${category_name_list}

Get product name in suggestion list
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${suggestionFragmentLocator}[txt_product_name]    product_sku=${product_sku}
    ${product_name}    common_keywords.Get Text    ${locator}
    [Return]    ${product_name}

Get product original price in suggestion list
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${suggestionFragmentLocator}[txt_product_original_price]    product_sku=${product_sku}
    ${product_original_price_str}    common_keywords.Get Text    ${locator}
    ${product_original_price}    common_keywords.Convert price string to number format    ${product_original_price_str}
    [Return]    ${product_original_price}

Get product original price in suggestion list in case no discount
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${suggestionFragmentLocator}[txt_product_original_price_no_discount]    product_sku=${product_sku}
    ${product_original_price_str}    common_keywords.Get Text    ${locator}
    ${product_original_price}    common_keywords.Convert price string to number format    ${product_original_price_str}
    [Return]    ${product_original_price}

Get product special price in suggestion list
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${suggestionFragmentLocator}[txt_product_special_price]    product_sku=${product_sku}
    ${product_special_price_str}    common_keywords.Get Text    ${locator}
    ${product_special_price}    common_keywords.Convert price string to number format    ${product_special_price_str}
    [Return]    ${product_special_price}

Click brand name in suggestion list
    [Arguments]    ${brand_name}
    ${locator}    String.Format String    ${suggestionFragmentLocator}[txt_brand_name_suggestion_term]    brand_name=${brand_name}
    common_keywords.Click Element    ${locator}

Click product name in suggestion list
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${suggestionFragmentLocator}[txt_product_name]    product_sku=${product_sku}
    common_keywords.Click Element    ${locator}