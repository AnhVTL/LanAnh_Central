*** Settings ***
Resource    ${CURDIR}/../locator/page/product_detail_page.robot

*** Keywords ***
Verify product name is displayed correctly
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${productDetailPageLocator}[txt_product_name]    product_sku=${product_sku}
    common_keywords.Wait Element Is Visible    ${locator}

Get product discount price
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${productDetailPageLocator}[txt_discount_price]    product_sku=${product_sku}
    ${product_discount_price_str}    common_keywords.Get Text    ${locator}
    ${product_discount_price}    common_keywords.Convert price string to number format    ${product_discount_price_str}
    [Return]    ${product_discount_price}

Get product original price
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${productDetailPageLocator}[txt_orignal_price]    product_sku=${product_sku}
    ${product_original_price_str}    common_keywords.Get Text    ${locator}
    ${product_original_price}    common_keywords.Convert price string to number format    ${product_original_price_str}
    [Return]    ${product_original_price}

Get product original price in case product no discount
    [Arguments]    ${product_sku}
    ${locator}    String.Format String    ${productDetailPageLocator}[txt_orignal_price_no_discount]    product_sku=${product_sku}
    ${product_original_price_str}    common_keywords.Get Text    ${locator}
    ${product_original_price}    common_keywords.Convert price string to number format    ${product_original_price_str}
    [Return]    ${product_original_price}