*** Settings ***
Suite Setup       kwOpenbrowserAndNavaigatetoProductPage
Suite Teardown    closeBrowser
Library           ../AppData/Roaming/Python/Python38/site-packages/SeleniumLibrary/
Library           re
Library           Collections
Library           String

*** Variables ***
${urlproductHome}    https://academybugs.com/store/professional-suit/    # For TC 3 and 4
${eleModelNum}    //div/section/div[1]/div[3]/form/div[3]
${varModelNum}    None
${varModelNum2}    None
${eleSearchBox}    //*[@id="ec_searchwidget-3"]/div/form/input
${eleSearchButton}    //*[@id="ec_searchwidget-3"]/div/form/input[2]
${eleProductPageHeading}    //*[@id="post-6190"]/div/section/div[1]/div[3]/form/h1
${eleHeadingAfterSearch}    //*[@id="ec_product_image_3981370"]/div[3]/h3/a
${varMatchFoundFlag}    False
${browser}        chrome
${valHeadingBeforeSearch}    None
${valHeadingAfterSearch}    None

*** Test Cases ***
TC03_GetModelNumber
    ${varModelNum}=    Get Text    ${eleModelNum}
    Log To Console    ${varModelNum}
    ${varModelNum2}=    Remove String Using Regexp    ${varModelNum}    \\D+
    Log To Console    ${varModelNum2}
    ${valHeadingBeforeSearch}=    Get Text    ${eleProductPageHeading}
    Set Global Variable    ${varModelNum2}
    ${valHeadingBeforeSearch}    Convert To Lower Case    ${valHeadingBeforeSearch}
    Set Global Variable    ${valHeadingBeforeSearch}

TC04_Search_Using_Model_Num
    Sleep    4s    sycning
    Click Element    ${eleSearchBox}
    Input Text    ${eleSearchBox}    ${varModelNum2}
    Click Button    ${eleSearchButton}
    Sleep    2s    syncing
    ${valHeadingAfterSearch}=    Get Text    ${eleHeadingAfterSearch}
    ${valHeadingAfterSearch}=    Convert To Lower Case    ${valHeadingAfterSearch}
    Log To Console    ${valHeadingAfterSearch}
    Log To Console    ${valHeadingBeforeSearch}
    Pass Execution If    '${valHeadingAfterSearch}'=='${valHeadingBeforeSearch}'    Pass
    Run Keyword If    '${valHeadingAfterSearch}'!='${valHeadingBeforeSearch}'    Fail

*** Keywords ***
kwOpenbrowserAndNavaigatetoProductPage
    Open Browser    ${urlproductHome}    ${browser}
    Sleep    3s
    Wait Until Page Contains    AcademyBugs.com

closeBrowser
    Close All Browsers
