*** Keywords ***
Verify product detail page is navigated correctly with API verify
    [Arguments]    ${product_sku}
    common_keywords.Wait until page is completely loaded
    ${api_product_detail_dict}    Get Variable Value    ${api_product_detail_dict}
    ${is_product_discount}    Get From Dictionary    ${api_product_detail_dict}    ${product_sku}_is_discount
    product_detail_page.Verify product name is displayed correctly    ${product_sku}
    Verify product original price is displayed correctly    ${product_sku}    ${api_product_detail_dict}    ${is_product_discount}
    Run Keyword If    ${is_product_discount}    Verify product discount price is displayed correctly    ${product_sku}    ${api_product_detail_dict}

Verify product original price is displayed correctly
    [Arguments]    ${product_sku}    ${api_product_detail_dict}    ${is_product_discount}
    ${product_original_price_UI}    Run Keyword If    ${is_product_discount}    product_detail_page.Get product original price    ${product_sku}
    ...    ELSE    product_detail_page.Get product original price in case product no discount    ${product_sku}
    ${product_original_price_api}    Get From Dictionary    ${api_product_detail_dict}    ${product_sku}_special_price
    Should Be Equal    ${product_original_price_UI}    ${product_original_price_api}    msg=Product original price with sku ${product_sku} display incorrectly

Verify product discount price is displayed correctly
    [Arguments]    ${product_sku}    ${api_product_detail_dict}
    ${product_price_discount_UI}    product_detail_page.Get product discount price    ${product_sku}
    ${product_price_discount_api}    Get From Dictionary    ${api_product_detail_dict}    ${product_sku}_special_price
    Should Be Equal    ${product_price_discount_UI}    ${product_price_discount_api}    msg=Product special price with sku ${product_sku} display incorrectly