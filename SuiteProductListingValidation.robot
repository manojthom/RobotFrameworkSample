*** Settings ***
Suite Setup       openBrowserAndNavigateToHome
Suite Teardown    closeBrowser
Library           ../AppData/Roaming/Python/Python38/site-packages/SeleniumLibrary/
Library           String

*** Variables ***
${url}            https://academybugs.com/find-bugs/
${browser}        chrome
${firstProductLink}    xpath=//div[3]/h3/a
${firstProductHomePagePrice}    xpath=//div[3]/div[1]/span
${firstElementProductPagePrice}    xpath=//div/section/div[1]/div[3]/form/div[2]/span
${valuePriceOnHomePage}    None
${valuePriceOnProductlListingPage}    None
${dropDownPriceSort}    xpath=//*[@id="sortfield"]
${valueLowestPrice}    None

*** Test Cases ***
TestCase1
    ${valuePriceOnHomePage}    Get Text    ${firstProductHomePagePrice}
    Click Element    ${firstProductLink}
    Wait Until Page Contains Element    ${firstElementProductPagePrice}
    ${valuePriceOnProductlListingPage}    Get Text    ${firstElementProductPagePrice}
    Go Back
    Wait Until Page Contains    Find Bugs
    ${valuePriceOnHomePage}=    Remove String    ${valuePriceOnHomePage}    $
    ${valuePriceOnProductlListingPage}=    Remove String    ${valuePriceOnProductlListingPage}    $
    Pass Execution If    '${valuePriceOnProductlListingPage}'=='${valuePriceOnHomePage}'    TestCase Passed
    Run Keyword If    '${valuePriceOnProductlListingPage}'!='${valuePriceOnHomePage}'    Fail

TC2_SelectingLowerstPrice
    Sleep    10s    Syncing
    Click Element    ${dropDownPriceSort}
    Select From List By Index    ${dropDownPriceSort}    1
    Sleep    5s    sync
    ${valuePriceOnHomePage}    Get Text    ${firstProductHomePagePrice}
    ${valueLowestPrice}    Remove String    ${valuePriceOnHomePage}    $

*** Keywords ***
openBrowserAndNavigateToHome
    Open Browser    ${url}    ${browser}
    Wait Until Page Contains    Find Bugs

closeBrowser
    Close All Browsers
