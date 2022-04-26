*** Keywords ***
Open Webpage
    New Browser    browser=chromium    headless=False
    New Page    ${URL}

Input Text Box
    [Arguments]    ${Text}
    Type Text    ${txt_search}    ${Text}
        
Enter Search
    Press Keys    ${txt_search}    Enter
    Sleep    5s

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

Click link 3rd 4th 5th and verify link 3rd 4th 5th
    @{list_alllink}    Create List    ${lbl_2ndlink}    ${lbl_3rdlink}    ${lbl_4thlink}
    @{list_allurl}    Create List    ${url_2ndlink}    ${url_3rdlink}    ${url_4thlink}
    ${index}    Set Variable    0   
    FOR     ${link}    IN    @{list_alllink}
        IF    '${link}' != '${lbl_4thlinkpa}'
            Click    ${link}    delay=0.5s
            Log    ${link}
            Sleep    5s
            ${url}    Get Url    ==    ${list_allurl}[${index}]     
            Go Back
            Wait For Elements State    ${txt_topsearch}
        END
        ${index}    Evaluate    ${index}+1      
    END

In range
    @{list_alllink}    Create List    ${lbl_2ndlink}    ${lbl_3rdlink}    ${lbl_4thlink}
    @{list_allurl}    Create List    ${url_2ndlink}    ${url_3rdlink}    ${url_4thlink}
    ${len}    Get Length    ${list_alllink}
    ${index}    Set Variable    0   
    FOR     ${link}    IN RANGE    ${len}
        IF    ${link} != 1  
            Click    ${list_alllink}[${link}]    delay=0.5s
            Log    ${list_alllink}[${link}]
            Sleep    5s
            ${url}    Get Url    ==    ${list_allurl}[${index}]     
            Go Back
            Wait For Elements State    ${txt_topsearch}
        END
        ${index}    Evaluate    ${index}+1      
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
    
Verify Text Search Result Webpage
    ${text_ku}    Get Text    ${lbl_1stlink}
    Should Be Equal    ${text_ku}    มหาวิทยาลัยเกษตรศาสตร์