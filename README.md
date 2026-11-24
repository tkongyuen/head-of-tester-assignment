
# Head Tester Practical Assignment

**Candidate:** กานต์ธีรา คงยืน (Kanteera Kongyuen)  
**Position:** Head Tester  
**Company:** PerSec — BullVPN  
**Submission Date:** 24 November 2026

สวัสดีค่ะ แทนได้รวบรวมคำตอบแบบทดสอบไว้ใน Repository นี้ 
โดยอธิบายผ่านแนวคิดและวิธีการทำงานของแทนในบทบาท Head Tester 
สามารถเลือกอ่านคำตอบแต่ละข้อได้ตามหัวข้อด้านล่างเลยค่ะ

## Part 1 — Scenario-based Assessment

### [Scenario 1 — Release Management](01-scenario-based/scenario-01-release-management.md)

## **ส่วนที่ 1 เหตุการณ์จำลองต่าง ๆ**

### **เหตุการณ์จำลองที่ 1**

พรุ่งนี้เที่ยงตรง บริษัทมีกำหนดต้องปล่อยแอปพลิเคชัน BullVPN เวอร์ชันใหม่ ที่มีฟีเจอร์สำคัญมาก (Marketing ยิงแอดไปแล้ว เลื่อนไม่ได้) แต่สถานการณ์ปัจจุบันในเย็นวันนี้คือ:

1. ทีม Dev เพิ่งส่งมอบโค้ดก้อนสุดท้ายมาให้เมื่อ 1 ชั่วโมงที่แล้ว (ส่งงานเลท)
2. น้อง QA ในทีม 1 คน "ลาป่วยกะทันหัน" ทำให้คนเทสไม่พอ
3. น้อง QA อีกคนที่เหลืออยู่ เปิด Bug Report ไปหา Dev 5 รายการ แต่ Dev ปฏิเสธ (Reject) กลับมาทั้งหมด โดยให้เหตุผลว่า
   - "สเปกไม่ได้เขียนไว้"
   - "เครื่อง Dev รันได้ปกติ"

ทำให้น้อง QA เสียกำลังใจและเกิดการโต้เถียงกันในห้องแชท

### [Scenario 2 — Hands-on Investigation](01-scenario-based/scenario-02-investigation.md)

สัปดาห์ต่อมา มีลูกค้า VIP แจ้งเข้ามาว่า
“ซื้อแพ็กเกจ Premium ไปแล้ว แต่พอเชื่อมต่อ VPN ระบบฟ้องว่าเป็นบัญชีฟรี (Free User) และตัดการเชื่อมต่อทุก ๆ 30 นาที”

### [Scenario 3 — Team Management](01-scenario-based/scenario-03-team-management.md)

**เหตุการณ์จำลองที่ 3:**

ตามแผนงานในช่วงผ่านโปร (Probation) คุณได้รับอนุมัติให้รับพนักงาน QA เพิ่มได้ 1 คน ตอนนี้โครงสร้างทีมของคุณคือ

- คุณ (Head)
- น้อง QA Manual (ปัจจุบัน)
- QA คนใหม่ (เพิ่งรับเข้ามา)

**โจทย์ของบริษัทคือ:** ต้องการลดเวลาการทำ Regression Test จากเดิมที่ใช้เวลา 2 วัน ให้เหลือเพียง 4 ชั่วโมง

**คำสั่ง:** จงวาดภาพ (หรืออธิบาย) **โครงสร้างการแบ่งงาน (Delegation & Workflow)** ของทีม


## Part 2 — Practical Testing

### [Question 1 — API Testing](02-api-testing/README.md)

ทำการเขียน Test Script หรือวิธีการทดสอบ API ที่เกี่ยวกับ Post ตามด้านล่างนี้
โดยคาดหวังให้ออกแบบการทดสอบให้ครอบคลุมทั้งการสร้าง (Create), แก้ไข (Update), ลบ (Delete) และแสดงผล Posts (Read)

### [Question 2 — Automation Testing (Bonus)](03-automation-testing/README.md)

**โจทย์:** เลือกเครื่องมือที่ถนัด (เช่น Selenium, Playwright, Robot Framework หรือ Cypress) เพื่อเขียน Script สำหรับ Test Case ดังนี้:

**Flow:**

เข้าหน้า Order → เลือก Package → เลือกช่องทางชำระเงิน (เช่น QR Code หรือ Credit Card) → ตรวจสอบว่าระบบแสดงยอดเงินถูกต้องตรงตาม Package

**Constraint:**

Script ต้องรองรับการรันบน Browser ต่าง ๆ (Cross-browser) และมีการทำ Page Object Model (POM) เพื่อให้ Code อ่านง่ายและแก้ไขง่ายในอนาคต

---

ขอบคุณสำหรับโอกาสในการทำแบบทดสอบครั้งนี้ 
และขอบคุณที่สละเวลาอ่านคำตอบของแทนนะคะ

**กานต์ธีรา คงยืน (Tan)**  
[LinkedIn](https://www.linkedin.com/in/tkongyuen/)
