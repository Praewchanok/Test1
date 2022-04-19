*** Settings ***
Library    Browser

*** Variable ***
${URL}    https://www.google.co.th/
${txt_search}    //*[@class="gLFyf gsfi"]
${lbl_1stlink}    //*[@id="rso"]/div[1]//h3
${lbl_title_browserlibrary}    //*[@id="scroller"]/div//h1
${lbl_title_introduction}    //*[@id="introduction"]

*** Keywords ***
Open Webpage
    New Browser    browser=chromium    headless=False
    New Page    ${URL}

Input Text Box
    [Arguments]    ${Text}
    Type Text    ${txt_search}    ${Text}

Enter Search
    Press Keys    ${txt_search}    Enter

Verify Text 1st Link
    [Arguments]    ${Text} 
    ${name_1stlink}    Get Text    ${lbl_1stlink}
    Should Be Equal    ${name_1stlink}    ${Text}

Click 1st Link
    Wait For Elements State    ${lbl_1stlink}
    Click    ${lbl_1stlink}    delay=0.5s

Verify page Library Browser
    ${Text2}    Get Text    ${lbl_title_browserlibrary}
    Should Be Equal    ${Text2}    BROWSER LIBRARY

Verify page Robot Framework
    ${Text4}    Get Text    ${lbl_title_introduction}
    Should Be Equal    ${Text4}    INTRODUCTION     

*** Test Case ***
TC_001 Search Library Browser and open 1st link and verify page
    Open Webpage
    Input Text Box    Library Browser
    Enter Search
    Verify Text 1st Link   Browser Library    
    Click 1st Link
    Verify page Library Browser
TC_002 Search Robot Framework and open 1st link and verify page 
    Open Webpage
    Input Text Box    Robot Framework
    Enter Search
    Verify Text 1st Link    Robot Framework
    Click 1st Link
    Verify page Robot Framework