*** Settings ***
Library    Browser
Resource    ../Resource/Keywords/Keywords_test1.robot
Resource    ../Resource/Repository/Repository_test1.robot  
Resource    ../Resource/Variable/Variable_test1.robot
Resource    ../Resource/Localize/${LANG}/test1.robot     

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

TC_003 Search Kasetsart and open 3rd link and verify page
    Open Webpage
    Input Text Box     Kasetsart University
    Enter Search
    Verify Text 3rd Link    Kasetsart University
    Click 3rd Link
    Verify page Kasetsart University

TC_004 Search Kasetsart and open 3rd, 4th and 5th link
    [Tags]    Test
    Open Webpage
    Input Text Box     Kasetsart University
    Enter Search
    # Click link 3rd 4th 5th and verify link 3rd 4th 5th
    In range

TC_005 Search Kasetsart University and มหาวิทยาลัยเกษตรศาสตร์ correct and verify result webpage
    [Tags]    Test
    Open Webpage
    Input Text Box    ${txt_ku}
    Enter Search
    Verify Text Search Result Webpage

TC_006 Search Kasetsart University and มหาวิทยาลัยเกษตรศาสตร์ wrong and verify result webpage
    [Ta/gs]    Test
    Open Webpage
    Input Text Box    ${txt_ku_fail}
    Enter Search
    Verify Text Search Result Webpage

TC_007 Search Kasetsart University in TH keyboard and มหาวิทยาลัยเกษตรศาสตร์ in ENG keyboard and verify result webpage
    [Tags]    Test
    Open Webpage
    Input Text Box    ${txt_ku_s}
    Enter Search
    Verify Text Search Result Webpage