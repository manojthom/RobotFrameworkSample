*** Settings ***
Library           ../AppData/Roaming/Python/Python38/site-packages/SeleniumLibrary/
Library           String

*** Variables ***
${url1}           https://academybugs.com/find-bugs/
${browser1}       chrome
${firstProductLink1}    xpath=//div[3]/h3/a
${firstProductHomePagePrice1}    xpath=//*[@id="ec_product_image_dnk-yellow-shoes"]/div[3]/div[1]/span
${firstElementProductPagePrice1}    xpath=//div/section/div[1]/div[3]/form/div[2]/span
