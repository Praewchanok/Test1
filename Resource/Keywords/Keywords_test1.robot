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

Verify Text 3rd Link
    [Arguments]    ${Text}
    ${name_3rdlink}    Get Text    ${lbl_3rdlink}
    Should Be Equal    ${name_3rdlink}    ${Text}    

Click 1st Link
    Wait For Elements State    ${lbl_1stlink}
    Click    ${lbl_1stlink}    delay=0.5s

Click 3rd Link
    Wait For Elements State    ${lbl_3rdlink}
    Click    ${lbl_3rdlink}    delay=0.5s

Click 3rd 4th and 5th Link
    @{list_alllink}    Create List    ${lbl_3rdlink_link}    ${lbl_4thlink_link}     ${lbl_5thlink_link}
    @{list_allurl}    Create List    ${url_3rdlink}    ${url_4thlink}    ${url_5thlink}
    ${index}    Set Variable    0
    FOR     ${link}    IN    @{list_alllink}
        # Evaluate JavaScript    //*[@id="search"]    (elem) => elem.remove = "exp-outline"
        Click    ${link}    delay=0.5s
        Log    ${link}
        Sleep    5s
        ${url}    Get Url    ==    ${list_allurl}[${index}]
        ${index}    Evaluate    ${index}+1         
        Go Back
        Wait For Elements State    ${txt_topsearch}
    END

Verify page Library Browser
    ${text_lb}    Get Text    ${lbl_title_browserlibrary}
    Should Be Equal    ${text_lb}    BROWSER LIBRARY

Verify page Robot Framework
    ${text_rf}    Get Text    ${lbl_title_introduction}
    Should Be Equal    ${text_rf}    INTRODUCTION

Verify page Kasetsart University
    ${text_ku}    Get Text    ${lbl_title_nisit}
    Should Be Equal    ${text_ku}    เข้าใช้งานระบบลงทะเบียนนิสิต