# Automation Testing — Robot Framework

## Objective
ทดสอบ Order → เลือก Package → เลือกช่องทางชำระเงิน → ตรวจสอบยอดเงิน โดยใช้ Robot Framework และ SeleniumLibrary

## Project structure
```text
03-automation-testing-using-robot-framework/
├── README.md
├── requirements.txt
├── tests/
│   └── order_payment.robot
└── pages/
    ├── OrderPage.resource
    └── PaymentPage.resource
```

## Test coverage
- เลือก Package ด้วย Package ID
- ตรวจสอบ Package Name ที่แสดง
- เลือก QR หรือ Credit Card
- ตรวจสอบยอดเงินให้ตรงกับ Package ที่เลือก

## Prerequisites
- Python ติดตั้งแล้ว
- ติดตั้ง Browser ที่ต้องการทดสอบ เช่น Chrome, Firefox หรือ Edge
- มี URL ของหน้า Order และข้อมูล/Locator ของหน้าเว็บจริง
- เตรียม Test Environment และ Test Data ให้พร้อม

## Install
```bash
pip install -r requirements.txt
```

## Configure before execution
ตัวอย่างในไฟล์เป็นโครงสร้างเริ่มต้น ยังไม่สามารถรันกับระบบจริงได้จนกว่าจะกำหนดค่าให้ตรงกับเว็บไซต์:
1. แก้ `${ORDER_URL}` ใน `tests/order_payment.robot`
2. แก้ Package ID, Package Name และยอดเงินให้ตรงกับ Test Environment
3. ตรวจสอบและแก้ CSS Selector ใน `pages/OrderPage.resource` และ `pages/PaymentPage.resource` ให้ตรงกับ HTML ของระบบ
4. ตรวจสอบรูปแบบยอดเงินที่หน้าเว็บแสดง เช่น `990`, `990.00` หรือ `฿990.00` แล้วกำหนด Expected Amount ให้ตรงกัน

## Run tests
Chrome:
```bash
robot --variable BROWSER:Chrome tests/order_payment.robot
```

Firefox:
```bash
robot --variable BROWSER:Firefox tests/order_payment.robot
```

Edge:
```bash
robot --variable BROWSER:Edge tests/order_payment.robot
```

Robot Framework จะสร้าง `output.xml`, `log.html` และ `report.html` หลังรัน

## POM
แยก Locator และ Keyword ตามหน้าที่:
- `OrderPage.resource`: เปิดหน้า Order, เลือก Package และตรวจสอบ Package Name
- `PaymentPage.resource`: เลือกช่องทางชำระเงินและตรวจสอบยอดเงิน

การแยกส่วนช่วยให้แก้ไข Locator ที่เปลี่ยนตามหน้าเว็บได้โดยไม่ต้องแก้ Test Case ทุกจุด

## Cross-browser
ใช้ตัวแปร `${BROWSER}` เพื่อเลือก Browser ตอนสั่งรัน โดยต้องติดตั้ง Browser และ WebDriver ที่รองรับในเครื่องหรือ CI Agent

## CI/CD approach
ทำงานร่วมกับ Dev/DevOps เพื่อเตรียม Test Environment, URL, Test Data, Browser และ WebDriver จากนั้นตั้ง Pipeline ให้ทำงานเมื่อมี Code Commit:
1. Checkout source code
2. Build application
3. Deploy ไปยัง Test Environment
4. Run Robot Framework tests
5. Publish `log.html`, `report.html` และ `output.xml`
6. แจ้งผล Pass/Fail ให้ทีมที่เกี่ยวข้อง

ควรกำหนดเงื่อนไข Pipeline ให้เหมาะกับทีม เช่น ให้ Smoke/Regression Automation ทำงานหลัง Build และ Deploy สำเร็จ โดยไม่ต้องรอ QA สั่งรันด้วยตนเอง

## Notes / Limitations
- URL, Package ID, Package Name, Amount และ CSS Selector ในตัวอย่างเป็นค่าตัวอย่าง/Placeholder ต้องแทนด้วยข้อมูลจริงก่อนใช้งาน
- การรองรับ Cross-browser ต้องทดลองรันจริงบน Browser ที่องค์กรใช้ ไม่ใช่เพียงเปลี่ยนชื่อ Browser ในคำสั่ง
- Test นี้ตรวจสอบยอดเงินที่หน้า Order/Payment แสดง ไม่ได้ยืนยันการตัดเงินจริงจากผู้ให้บริการชำระเงิน
