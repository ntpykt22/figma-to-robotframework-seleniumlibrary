*** Settings ***
Library    SeleniumLibrary
Resource    resource.robot

*** Test Cases ***
ลูกค้าสั่งซื้อสินค้า ด้วยการค้นหาชื่อสินค้า เลือกจํานวนสินค้าโดย น้อยกว่าสินค้าที่มี ใช้แต้มเป็นส่วนลด 100 บาท และลูกค้าได้รับแต้มสะสมสําเร็จ
    ค้นหาสินค้าด้วย คำค้นหา LEGO Star Wars Ahsoka Tano's T-6 Jedi Shuttle
    ตรวจสอบผลการค้นหา LEGO Star Wars Ahsoka Tano's T-6 Jedi Shuttle
    เลือกดูสินค้า LEGO Star Wars Ahsoka Tano's T-6 Jedi Shuttle
    ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ LEGO Star Wars Ahsoka Tano's T-6 Jedi Shuttle
    เพิ่ม LEGO Star Wars Ahsoka Tano's T-6 Jedi Shuttle ลงตะกร้า
    Checkout สินค้า
    กรอกข้อมูลผู้ติดต่อ
    กรอกที่อยู่จัดส่งสินค้า
    เลือกวิธีจัดส่งสินค้าเป็น Kerry
    ตรวจสอบค่าจัดส่งสินค้าของ Kerry เท่ากันกับ ฿50.00
    เลือกวิธีชำระเงิน
    ตรวจสอบราคารวมที่ต้องชำระเงิน ต้องเท่ากันกับ ฿2,590.00
    ชำระเงินสำเร็จ ตรวจสอบเลข Order SMAI000245934