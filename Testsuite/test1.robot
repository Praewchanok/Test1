*** Settings ***
Library    Browser
Resource    ../Resources/Keywords/Keywords_test1.robot
Resource    ../Resources/Repositories/Repository_test1.robot  
Resource    ../Resources/Variables/Variable_test1.robot
Resource    ../Resources/Localizes/${LANG}/test1.robot     


*** Test Case ***
TC_1_1_001 Search Library Browser And Open 1st Link And Verify Page
    [Tags]    Testreturn
    Open Webpage
    Input Text Box    Browser Library
    Enter Search
    Verify Text 1st Link    ${NEW} 
    Click 1st Link
    Verify Page Library Browser

# TC_001 Search Library Browser and open 1st link and verify page
#     Open Webpage
#     ${return_text}    Input Text Box    Browser Library
#     Enter Search
#     Verify Text 1st Link    ${return_text} 
#     Click 1st Link
#     Verify page Library Browser

TC_1_1_002 Search Robot Framework And Open 1st Link And Verify Page
    # [Tags]    Testreturn
    Open Webpage
    Input Text Box    Robot Framework
    Enter Search
    Verify Text 1st Link    ${NEW}
    Click 1st Link
    Verify Page Robot Framework

TC_1_1_003 Search Kasetsart And Open 3rd Link And Verify Page
    Open Webpage
    Input Text Box     Kasetsart University
    Enter Search
    Verify Text 3rd Link    ${NEW}
    Click 3rd Link
    Verify Page Kasetsart University

TC_1_1_004 Search Kasetsart And Open 3rd 4th And 5th Link
    Open Webpage
    Input Text Box     Kasetsart University
    Enter Search
    # Click link 3rd 4th 5th and verify link 3rd 4th 5th
    In Range

TC_1_1_005 Search Kasetsart University Correct And Verify Result Webpage
    # [Tags]    Test
    Open Webpage
    Input Text Box    ${txt_ku}
    Enter Search
    Verify Text Search Result Webpage

# TC_006 Search Kasetsart University and มหาวิทยาลัยเกษตรศาสตร์ wrong and verify result webpage
#     [Ta/gs]    Test
#     Open Webpage
#     Input Text Box    ${txt_ku_fail}
#     Enter Search
#     Verify Text Search Result Webpage

# TC_007 Search Kasetsart University in TH keyboard and มหาวิทยาลัยเกษตรศาสตร์ in ENG keyboard and verify result webpage
#     [Tags]    Test
#     Open Webpage
#     Input Text Box    ${txt_ku_s}
#     Enter Search
#     Verify Text Search Result Webpage
