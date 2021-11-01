*** Keywords ***
Get suggestion data with search by keyword
    [Arguments]    ${keyword}     
    ${request}    JSONLibrary.Load JSON From File    ${CURDIR}/payload/get_search_suggestion.json
    ${request}    JSONLibrary.Update Value To Json    ${request}    $..keyword    ${keyword}
    ${body}    Evaluate    json.dumps($request)    json
    ${headers}    Create Dictionary    store=en
    ${response}    REST.Post    endpoint=${api_end_point}    body=${body}    headers=${headers}
    REST.Integer    response status    200
    ${response}    REST.Output    response body
    ${category_name_list}    Get category name in suggestion data    ${response}
    ${suggestion_term_list}    ${is_display_suggestion_term}    Get suggestion term in suggestion data    ${response}
    ${product_sku_arr}    ${product_detail_dict}    Get product data in suggestion data    ${response}
    Set Test Variable    ${api_category_name_list}    ${category_name_list}
    Set Test Variable    ${api_suggestion_term_list}    ${suggestion_term_list}
    Set Test Variable    ${is_display_suggestion_term}    ${is_display_suggestion_term}
    Set Test Variable    ${api_product_sku_arr}    ${product_sku_arr}
    Set Test Variable    ${api_product_detail_dict}    ${product_detail_dict}
    [Return]    ${response}

Get category name in suggestion data
    [Arguments]    ${response}
    ${category_name_arr}    JSONLibrary.Get Value From Json    ${response}    $..categories[*].name
    ${category_name_list}    Convert To List    ${category_name_arr}
    [Return]    ${category_name_list}

Get suggestion term in suggestion data
    [Arguments]    ${response}
    ${suggestion_term_arr}    JSONLibrary.Get Value From Json    ${response}    $..suggestionTerms[*]
    ${suggestion_term_list}    Convert To List    ${suggestion_term_arr}
    ${is_display_suggestion_term}    Run Keyword And Return Status    Should Be True    len(${suggestion_term_list})>0
    [Return]    ${suggestion_term_list}    ${is_display_suggestion_term}

Get product data in suggestion data
    [Arguments]    ${response}
    ${product_sku_arr}    JSONLibrary.Get Value From Json    ${response}    $..products[*].sku
    ${product_name_arr}    JSONLibrary.Get Value From Json    ${response}    $..products[*].name
    ${orignal_price_arr}    JSONLibrary.Get Value From Json    ${response}    $..products[*].priceSummary.original
    ${special_price_arr}    JSONLibrary.Get Value From Json    ${response}    $..products[*].priceSummary.final
    ${product_detail_dict}    Create Dictionary
    FOR     ${idx}    IN RANGE    ${0}    len(${product_sku_arr})
        ${prefix}    Set Variable    ${product_sku_arr}[${idx}]
        ${orignal_price}    Convert To Number    ${orignal_price_arr}[${idx}]
        ${special_price}    Convert To Number    ${special_price_arr}[${idx}]
        ${is_product_discount}    Run Keyword And Return Status    Should Be True    ${special_price}<${orignal_price}
        Set To Dictionary    ${product_detail_dict}    ${prefix}_name=${product_name_arr}[${idx}]
        ...    ${prefix}_orignal_price=${orignal_price}    ${prefix}_special_price=${special_price}    ${prefix}_is_discount=${is_product_discount}
    END
    [Return]    ${product_sku_arr}    ${product_detail_dict}