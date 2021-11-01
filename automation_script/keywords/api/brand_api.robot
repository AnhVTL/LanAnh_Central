*** Keywords ***
Get brand detail with brand id
    [Arguments]    ${brand_id}     
    ${request}    JSONLibrary.Load JSON From File    ${CURDIR}/payload/get_brand_detail.json
    ${brand_id}    Convert To Integer    ${brand_id}
    ${request}    JSONLibrary.Update Value To Json    ${request}    $..brandId    ${brand_id}
    ${body}    Evaluate    json.dumps($request)    json
    ${headers}    Create Dictionary    store=en
    ${response}    REST.Post    endpoint=${api_end_point}    body=${body}    headers=${headers}
    REST.Integer    response status    200
    ${response}    REST.Output    response body
    ${brand_logo_src}    Get logo source of brand    ${response}
    ${brand_url_key}    Get url key of brand    ${response}
    Set Test Variable    ${brand_logo_src}    ${brand_logo_src}
    Set Test Variable    ${brand_url_key}    ${brand_url_key}

Get logo source of brand
    [Arguments]    ${response}
    ${brand_logo_arr}    JSONLibrary.Get Value From Json    ${response}    $..logo
    [Return]    ${brand_logo_arr}[0]

Get url key of brand
    [Arguments]    ${response}
    ${brand_url_key_arr}    JSONLibrary.Get Value From Json    ${response}    $..url_key
    [Return]    ${brand_url_key_arr}[0]