*** Keywords ***
Open Webpage
    [Documentation]    Owner: Praew
    New Browser    browser=chromium    headless=False
    New Page    ${url_google}

Input Text Box
    [Documentation]    Owner: Praew
    ...                 ใส่คำที่จะค้นหาในกกล่องค้นหา และเก็บค่าไว้ในตัวแปลชื่อ NEW
    [Arguments]    ${text}
    Type Text    ${txt_search}    ${text}
    Set Test Variable    ${NEW}    ${text}  # ต้องตั้งเป็นตัวพิมพ์ใหญ่ (ใช้ได้หลายที่) ทั้งหมด ตัวแรก ชื่อใหม่ ตัวสอง ชื่อเก่า

# Input Text Box
#     [Arguments]    ${text}
#     Type Text    ${txt_search}    ${text}
#     [Return]    ${text}

Enter Search
    [Documentation]    Owner: Praew
    Press Keys    ${txt_search}    Enter
    Sleep    5s

Verify Text 1st Link
    [Documentation]    Owner: Praew
    [Arguments]    ${text} 
    ${name_1stlink}    Get Text    ${lbl_1stlink}
    Should Be Equal    ${name_1stlink}    ${text}

Verify Text 3rd Link
    [Documentation]    Owner: Praew
    [Arguments]    ${text}
    ${name_3rdlink}    Get Text    ${lbl_3rdlink}    
    Should Be Equal    ${name_3rdlink}    ${text}    

Click 1st Link
    [Documentation]    Owner: Praew
    Wait For Elements State    ${lbl_1stlink}
    Click    ${lbl_1stlink}    delay=0.5s

Click 3rd Link
    [Documentation]    Owner: Praew
    Wait For Elements State    ${lbl_3rdlink}
    Click    ${lbl_3rdlink}    delay=0.5s

Click Link 3rd 4th 5th And Verify Link 3rd 4th 5th
    [Documentation]    Owner: Praew
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

In Range
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

Verify Page Library Browser
    ${text_lb}    Get Text    ${lbl_title_browserlibrary}
    Should Be Equal    ${text_lb}    BROWSER LIBRARY

Verify Page Robot Framework
    ${text_rf}    Get Text    ${lbl_title_introduction}
    Should Be Equal    ${text_rf}    INTRODUCTION

Verify Page Kasetsart University
    ${text_ku}    Get Text    ${lbl_title_nisit}
    Should Be Equal    ${text_ku}    เข้าใช้งานระบบลงทะเบียนนิสิต
    
Verify Text Search Result Webpage
    ${text_ku}    Get Text    ${lbl_1stlink}
    Should Be Equal    ${text_ku}    มหาวิทยาลัยเกษตรศาสตร์
