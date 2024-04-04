*** Variables ***
${URL}    https://www.sckshoppingmall.com
${BROWSER}    chrome
${ProdcutName}    LEGO Star Wars Ahsoka Tano's T-6 Jedi Shuttle
${ProdcutPrice}    ฿2,690.00
${GettingPoints}    26 point
${DiscountPoints}    100
${DiscountCash}    ฿100.00
${FirstName}    Nuttarponz    
${LastName}    Yakathurm
${Email}    bankrock62@gmail.com
${PhoneNumber}    062-4200118
${HouseNumber}    189/413
${Province}    สมุทรปราการ
${District}    เมือง
${Sub-district}    แพรกษาใหม่
${Road}    บางพลี-ตําหรุ
${Postal-Code}    10280
${ShippingFee}    ฿50.00
${PaymentMethod}    Credit/Debit Card
${CardNumber}    4719700591590995
${CVV}    752
${MM/YY}    02/26
${Subtotal}    ฿2,690.00
${TotalPrice}    ฿2,590.00
${DeliveryNumber}    SMAI000245934

*** Keywords ***
ค้นหาสินค้าด้วย คำค้นหา ${ProdcutsName}
    Open Browser    url=${URL}    browser=${BROWSER}
    Input Text    id:txtSearch    ${ProdcutsName}
    Click Element    id:btnSearch    

ตรวจสอบผลการค้นหา ${ProdcutsName}
    Element Should Contain    id:products_01  ${ProdcutsName}

เลือกดูสินค้า ${ProdcutsName}
    Click Element    id:products_01

ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ ${ProdcutsName}
    Element Should Contain    id:discount_notif    ${GettingPoints}

เพิ่ม ${ProdcutsName} ลงตะกร้า
    Click Element    id:_bg__primary_enabled_large_icon

Checkout สินค้า
    Element Should Contain    id:tma_2_comfort_wireless    
    Element Should Contain    id:usd_270    ${ProdcutPrice}
    Element Should Contain    id:_bg__total_and_sum    ${ProdcutPrice}
    Click Element    id:__link_4_shipping__button___right_icon
    
ใช้แต้มสะสมเป็นส่วนลดราคาสินค้า 100 แต้ม
    Input Text    id:point_discount    ${DiscountPoints}
    Element Should Contain    id:_bg__subtotal    ฿2,690.00
    Element Should Contain    id:_bg__discount    ${DiscountCash}
    Element Should Contain    id:_bg__total    ฿2,590.00

กรอกข้อมูลผู้ติดต่อ
    Input Text    id:fill_firstname    ${FirstName}
    Input Text    id:fill_lastname    ${LastName}
    Input Text    id:fill_email   ${Email}
    Input Text    id:_bg__fill_country_code    +66
    Input Text    id:_bg__fill_phone_number    ${PhoneNumber}

กรอกที่อยู่จัดส่งสินค้า
    Input Text    id:fill_hosue_number    ${HouseNumber}
    Input Text    id:fill_province    ${Province}
    Input Text    id:fill_district    ${District}
    Input Text    id:fill_sub-district    ${Sub-district}
    Input Text    id:fill_road    ${Road}
    Input Text    id:fill_postal_code    ${Postal-Code}
    Click Element    id:btn_cotinue_

เลือกวิธีจัดส่งสินค้าเป็น Kerry
    Click Element    id:select_kerry_
    Element Should Contain    id:select_kerry_    Kerry
    Click Element    id:btn_cotinue_

ตรวจสอบค่าจัดส่งสินค้าของ Kerry เท่ากันกับ ${ShippingFee} 
    Element Should Contain    id:bg__shipping_fee    ${ShippingFee}

เลือกวิธีชำระเงิน
    Element Should Contain    id:select_credit_debit_    ${PaymentMethod}  
    Click Element    id:select_credit_debit_

ใส่ข้อมูลการชำระเงิน
    Input Text    id:_bg__fill_card_number    ${CardNumber}
    Input Text    id:_bg__fill_cvv    ${CVV}    
    Input Text    id:_bg__fill_mm_yy   ${MM/YY}    

ตรวจสอบราคารวมที่ต้องชำระเงิน ต้องเท่ากันกับ ${TotalPrice}
    Element Should Contain    id:_bg__subtotal    ${Subtotal}
    Element Should Contain    id:bg__shipping_fee    ${ShippingFee}
    Element Should Contain    id:_bg__discount    ${DiscountCash}
    Element Should Contain    id:_bg__total    ${TotalPrice}

ชำระเงินสำเร็จ ตรวจสอบเลข Order ${DeliveryNumber}
    
    #Click Pay
    Click Element    id:__link_7_payment_confirm__btn_pay

    #Confirm Payment
    Click Element    id:__link_8_transfer_loading___button_primary

    Element Should Contain    id:_bg__order_confirmation    ${DeliveryNumber}

    Click Element    id:__link_1_store___track_order