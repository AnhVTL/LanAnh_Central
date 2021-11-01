*** Keywords ***
Verify brand page is navigated correctly
    common_keywords.Wait until page is completely loaded
    ${brand_url_key}    Get Variable Value    ${brand_url_key}
    ${brand_logo_src}    Get Variable Value    ${brand_logo_src}
    brand_page.Verify brand link is correct    ${brand_url_key}
    brand_page.Verify brand logo is displayed correctly    ${brand_logo_src}