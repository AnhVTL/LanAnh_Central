*** Keywords ***
Open chrome browser and redirect to page
    [Documentation]    Open chrome browser and redirect to page
    ...                ${url}    - Target url
    ...                ${delay}  - Delay that is waited after each Selenium command
    ...                ${is_headless}  - Turn on headless browser with ${True}, default ${False}
    [Arguments]     ${url}=${base_url}
    ${options}=     Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()     sys
    Call Method     ${options}     add_argument     --disable-notifications
    Call Method     ${options}     add_argument     --disable-infobars
    Call Method     ${options}     add_argument    start-maximized
    SeleniumLibrary.Create WebDriver     Chrome      chrome_options=${options}
    SeleniumLibrary.Go To     ${url}
    Wait until page is completely loaded

Open chrome browser and redirect to brand page
    [Arguments]    ${brand_url_key}
    Open chrome browser and redirect to page
    ${target_url}    Catenate    SEPARATOR=/    ${base_url}    ${brand_url_key}
    SeleniumLibrary.Go To     ${target_url}
    Wait until page is completely loaded

Tear Down Test
    SeleniumLibrary.Close Browser 

Wait until page is completely loaded
    SeleniumLibrary.Instrument Browser
    SeleniumLibrary.Wait For Testability Ready

Get Elements
    [Documentation]    This keyword for getting elements after verify these elements is visible
    ...                ${elems}    - Varargs of locators or elements
    [Arguments]    @{elems}
    common_keywords.Verify Elements Are Visible    @{elems}
    @{elements}    SeleniumLibrary.Get WebElements    @{elems}
    [Return]    @{elements}
    
Get Text
    [Documentation]    Get text of target element
    ...                ${locator}    - Locator of target element
    [Arguments]    ${locator}
    common_keywords.Wait Element Is Visible    ${locator}
    ${text}    SeleniumLibrary.Get Text    ${locator}
    [Return]    ${text}

Input Text
    [Documentation]    Input text into target element
    ...                ${locator}    - Locator of target element
    [Arguments]    ${locator}    ${keyword}    ${timeout}=${GLOBALTIMEOUT}
    common_keywords.Wait Element Is Visible    ${locator}    ${timeout}
    SeleniumLibrary.Click Element    ${locator}
    SeleniumLibrary.Clear Element Text    ${locator}
    SeleniumLibrary.Input Text    ${locator}    ${keyword}

Click Element
    [Documentation]    Click to target element
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for target element visible
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    common_keywords.Wait Element Is Visible    ${locator}    timeout=${timeout}
    SeleniumLibrary.Click Element    ${locator}

Verify Elements Are Visible
    [Documentation]    This keyword verify that page contains elements specified in arguments and verify each element is visible
    ...    ${elems}    - Varargs of locators or elements
    [Arguments]    @{elems}
    FOR    ${elem}    IN    @{elems}
        SeleniumLibrary.Wait Until Element Is Visible    ${elem}    timeout=${GLOBALTIMEOUT}
    END    

Wait Element Is Visible
    [Documentation]    Wait element is visible
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for target element visible
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}

Wait Until Element Is Not Visible
    [Documentation]    Wait element is not visible
    ...                ${locator}    - Locator of target element
    ...                ${timeout}    - Waiting time for current page does not contain target element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${locator}    timeout=${timeout}

Get Elements Text
    [Arguments]    ${locator}   
    @{elems}    common_keywords.Get Elements    ${locator}
    ${elem_txt_list}    Create List
    FOR    ${elem}    IN    @{elems}
        ${elem_text}    Get Text    ${elem}    
        Append To List    ${elem_txt_list}    ${elem_text}
    END
    [Return]    ${elem_txt_list}

Press Enter key
    SeleniumLibrary.Press Keys    None    RETURN

Convert price string to number format
    [Arguments]    ${price}
    ${price}=    Remove String    ${price}    ฿
    ${price}=    Remove String    ${price}    ,
    ${price}=    Convert To Number    ${price}
    [Return]    ${price}

Get path of current url
    ${current_url}    SeleniumLibrary.Get Location
    ${path}    Replace String    ${current_url}    search_for=${base_url}/    replace_with=${EMPTY}
    [Return]    ${path}

Get random element from array
    [Arguments]    ${elems_arr}
    ${rand_idx}    Evaluate    random.randint(0, len(${elems_arr}))
    [Return]    ${elems_arr}[${rand_idx}]