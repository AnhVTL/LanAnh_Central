*** Keywords ***
Verify suggestion list data is displayed correctly with verify with API
    ${api_suggestion_term_list}    Get Variable Value    ${api_suggestion_term_list}
    ${is_display_suggestion_term}    Get Variable Value    ${is_display_suggestion_term}
    ${api_category_name_list}    Get Variable Value    ${api_category_name_list}
    ${api_product_sku_arr}    Get Variable Value    ${api_product_sku_arr}
    ${api_product_detail_dict}    Get Variable Value    ${api_product_detail_dict}
    Run Keyword If    ${is_display_suggestion_term}    Verify Search Keywords data is displayed correctly with verify with API    ${api_suggestion_term_list}
    Verify Categories data is displayed correctly with verify with API    ${api_category_name_list}
    Verify Products data is displayed correctly with verify with API    ${api_product_sku_arr}    ${api_product_detail_dict}

Verify Search Keywords data is displayed correctly with verify with API
    [Arguments]    ${api_suggestion_term_list}
    suggestion_fragment.Verify Search Keywords part is displayed
    ${suggestion_keywords_UI}    suggestion_fragment.Get search keywords data in suggestion list
    Lists Should Be Equal    ${api_suggestion_term_list}    ${suggestion_keywords_UI}    ignore_order=True

Verify Categories data is displayed correctly with verify with API
    [Arguments]    ${api_categories_list}
    suggestion_fragment.Verify Categories part is displayed
    ${categories_UI}    suggestion_fragment.Get categories data in suggestion list
    Lists Should Be Equal    ${api_categories_list}    ${categories_UI}    ignore_order=True

Verify Products data is displayed correctly with verify with API
    [Arguments]    ${api_product_sku_arr}    ${product_data_dict}
    suggestion_fragment.Verify Products part is displayed
    FOR    ${idx}    IN RANGE    len(${api_product_sku_arr})
        ${product_sku}    Set Variable    ${api_product_sku_arr}[${idx}]
        ${is_product_discount}    Get From Dictionary    ${product_data_dict}    ${product_sku}_is_discount
        Verify product name is displayed correctly with verify with API    ${product_sku}    ${product_data_dict}
        Verify product original price is displayed correctly with verify with API    ${product_sku}    ${product_data_dict}    ${is_product_discount}
        Run Keyword If    ${is_product_discount}    Verify product special price is displayed correctly with verify with API    ${product_sku}    ${product_data_dict}
    END
    
Verify product name is displayed correctly with verify with API
    [Arguments]    ${product_sku}    ${product_data_dict}
    ${product_name_UI}    suggestion_fragment.Get product name in suggestion list    ${product_sku}
    ${product_name_api}    Get From Dictionary    ${product_data_dict}    ${product_sku}_name
    Should Be Equal As Strings    ${product_name_UI}    ${product_name_api}    msg=Product name with sku ${product_sku} display incorrectly

Verify product original price is displayed correctly with verify with API
    [Arguments]    ${product_sku}    ${product_data_dict}    ${is_product_discount}
    ${product_original_price_UI}    Run Keyword If    ${is_product_discount}    suggestion_fragment.Get product original price in suggestion list    ${product_sku}
    ...    ELSE    suggestion_fragment.Get product original price in suggestion list in case no discount    ${product_sku}
    ${product_orginal_price_api}    Get From Dictionary    ${product_data_dict}    ${product_sku}_orignal_price
    Should Be Equal    ${product_original_price_UI}    ${product_orginal_price_api}    msg=Product orignal price with sku ${product_sku} display incorrectly

Verify product special price is displayed correctly with verify with API
    [Arguments]    ${product_sku}    ${product_data_dict}
    ${product_special_price_UI}    suggestion_fragment.Get product special price in suggestion list    ${product_sku}
    ${product_special_price_api}    Get From Dictionary    ${product_data_dict}    ${product_sku}_special_price
    Should Be Equal    ${product_special_price_UI}    ${product_special_price_api}    msg=Product special price with sku ${product_sku} display incorrectly