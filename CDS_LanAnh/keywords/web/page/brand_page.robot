*** Settings ***
Resource    ${CURDIR}/../locator/page/brand_page.robot

*** Keywords ***
Verify brand logo is displayed correctly
    [Arguments]    ${brand_logo_src}
    ${locator}    String.Format String    ${brandPageLocator}[img_brand_logo]    brand_logo_src=${brand_logo_src}
    common_keywords.Wait Element Is Visible    ${locator}

Verify brand link is correct
    [Arguments]    ${brand_url_key}
    ${current_path}    common_keywords.Get path of current url
    Should Be Equal As Strings    ${current_path}    ${brand_url_key}