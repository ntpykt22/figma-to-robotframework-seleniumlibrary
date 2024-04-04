*** Settings ***
Library    SeleniumLibrary
Resource    resource.robot

*** Test Cases ***
ลูกค้าสั่งซื้อสินค้า ด้วยการค้นหาชื่อสินค้า เลือกจํานวนสินค้าโดย น้อยกว่าสินค้าที่มี ใช้แต้มเป็นส่วนลด 100 บาท และลูกค้าได้รับแต้มสะสมสําเร็จ
    Open Browser    url=https://www.sckshoppingmall.com    browser=chrome
    Input Text    id:txtSearch    LEGO Star Wars Ahsoka Tano's T-6 Jedi Shuttle
    Click Element    id:btnSearch  
    
    Element Should Contain    id:products_01  LEGO Star Wars Ahsoka Tano's T-6 Jedi Shuttle

    Click Element    id:products_01

    Element Should Contain    id:discount_notif    26 point

    Click Element    id:_bg__primary_enabled_large_icon

    Element Should Contain    id:tma_2_comfort_wireless    
    Element Should Contain    id:usd_270    ฿2,690.00
    Element Should Contain    id:_bg__total_and_sum    ฿2,690.00
    Click Element    id:__link_4_shipping__button___right_icon
    
    Input Text    id:point_discount    100
    Element Should Contain    id:_bg__subtotal    ฿2,690.00
    Element Should Contain    id:_bg__discount    ฿100.00
    Element Should Contain    id:_bg__total    ฿2,590.00

    Input Text    id:fill_firstname    Nuttarponz
    Input Text    id:fill_lastname    Yakathurm
    Input Text    id:fill_email   bankrock62@gmail.com
    Input Text    id:_bg__fill_country_code    +66
    Input Text    id:_bg__fill_phone_number    062-4200118

    Input Text    id:fill_hosue_number    189/413
    Input Text    id:fill_province    สมุทรปราการ
    Input Text    id:fill_district    เมือง
    Input Text    id:fill_sub-district    แพรกษาใหม่
    Input Text    id:fill_road    บางพลี-ตําหรุ
    Input Text    id:fill_postal_code    10280
    Click Element    id:btn_cotinue_

    Click Element    id:select_kerry_
    Element Should Contain    id:select_kerry_    Kerry
    Click Element    id:btn_cotinue_

    Element Should Contain    id:bg__shipping_fee    ฿50.00

    Element Should Contain    id:select_credit_debit_    Credit/Debit Card 
    Click Element    id:select_credit_debit_

    Input Text    id:_bg__fill_card_number    4719700591590995
    Input Text    id:_bg__fill_cvv    752   
    Input Text    id:_bg__fill_mm_yy   02/26   

    Element Should Contain    id:_bg__subtotal    ฿2,690.00
    Element Should Contain    id:bg__shipping_fee    ฿50.00
    Element Should Contain    id:_bg__discount    ฿100.00
    Element Should Contain    id:_bg__total    ฿2,590.00
    
    Click Element    id:__link_7_payment_confirm__btn_pay

    Click Element    id:__link_8_transfer_loading___button_primary

    Element Should Contain    id:_bg__order_confirmation    SMAI000245934

    Click Element    id:__link_1_store___track_order 