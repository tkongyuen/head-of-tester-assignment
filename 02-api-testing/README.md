
# Part 2 — API Testing (JSONPlaceholder)

## 1. Objective

ทดสอบ API ของ JSONPlaceholder โดยออกแบบ Test Case ให้ครอบคลุมการสร้าง แก้ไข ลบ และแสดงผล Posts รวมถึงการแสดง Comments ที่เกี่ยวข้องกับ Post

**Base URL:** https://jsonplaceholder.typicode.com

การทดสอบจะครอบคลุม HTTP Methods ได้แก่ GET, POST, PUT, PATCH และ DELETE โดยตรวจสอบ HTTP Status Code, Response Body และความถูกต้องของข้อมูลที่ได้รับกลับมา

---

## 2. API Test Scenarios

รายการ API ที่ใช้ในการทดสอบมีทั้งหมด 8 Endpoints

| TC ID | Method | Endpoint | Test Scenario |
|---|---|---|---|
| TC01 | GET | /posts | แสดง Posts ทั้งหมด |
| TC02 | GET | /posts/1 | แสดง Post ตาม ID |
| TC03 | GET | /posts/1/comments | แสดง Comments ของ Post |
| TC04 | GET | /comments?postId=1 | แสดง Comments โดยใช้ postId |
| TC05 | POST | /posts | สร้าง Post ใหม่ |
| TC06 | PUT | /posts/1 | แก้ไข Post ทั้งรายการ |
| TC07 | PATCH | /posts/1 | แก้ไข Post บางส่วน |
| TC08 | DELETE | /posts/1 | ลบ Post |

**คำอธิบาย:** การออกแบบ Test Scenario ครอบคลุมทั้งการจัดการ Posts และการเรียกดู Comments ที่เชื่อมโยงกับ Post ตาม Endpoint ที่โจทย์กำหนด

---

## 3. API Test Cases

### TC01 — Get All Posts

**Objective:** ตรวจสอบว่า API สามารถแสดง Posts ทั้งหมดได้

**Request**
- Method: GET
- Endpoint: `/posts`

**Expected Result**
- Status Code = 200
- Response เป็น Array
- แต่ละรายการมี id, userId, title และ body
- โครงสร้างข้อมูลถูกต้อง

**คำอธิบาย:** ตรวจสอบว่าระบบสามารถดึงรายการ Posts กลับมาได้ และข้อมูลแต่ละรายการมี Field ที่จำเป็นครบถ้วน

### TC02 — Get Post by ID

**Objective:** ตรวจสอบว่า API สามารถแสดง Post ตาม ID ที่กำหนดได้

**Request**
- Method: GET
- Endpoint: `/posts/1`

**Expected Result**
- Status Code = 200
- Response แสดงข้อมูล Post ที่มี id = 1
- มี userId, title และ body
- Data Type ถูกต้อง

**คำอธิบาย:** ตรวจสอบว่าระบบสามารถค้นหา Post ตาม ID ได้ถูกต้อง และไม่แสดงข้อมูลของรายการอื่นแทน

### TC03 — Get Comments by Post ID

**Objective:** ตรวจสอบว่า API สามารถแสดง Comments ที่เกี่ยวข้องกับ Post ที่กำหนดได้

**Request**
- Method: GET
- Endpoint: `/posts/1/comments`

**Expected Result**
- Status Code = 200
- Response เป็น Array
- Comments ทุก Record มี postId = 1
- แต่ละรายการมี id, name, email และ body

**คำอธิบาย:** ตรวจสอบว่าระบบสามารถดึง Comments ที่เชื่อมโยงกับ Post ID ที่ระบุได้ถูกต้อง โดยไม่แสดง Comments ของ Post อื่น

### TC04 — Get Comments by Query Parameter

**Objective:** ตรวจสอบว่า API สามารถค้นหา Comments โดยใช้ postId ผ่าน Query Parameter ได้

**Request**
- Method: GET
- Endpoint: `/comments?postId=1`

**Expected Result**
- Status Code = 200
- Response เป็น Array
- Comments ทุก Record มี postId = 1
- โครงสร้างข้อมูลถูกต้อง

**คำอธิบาย:** ตรวจสอบว่าระบบสามารถกรอง Comments ตาม postId ได้ถูกต้อง และได้ผลลัพธ์สอดคล้องกับการเรียกผ่าน `/posts/1/comments`

### TC05 — Create Post

**Objective:** ตรวจสอบว่า API สามารถสร้าง Post ใหม่ได้

**Request**
- Method: POST
- Endpoint: `/posts`

**Request Body**

```json
{
  "title": "QA Testing",
  "body": "API Testing Assignment",
  "userId": 1
}
```

**Expected Result**
- Status Code = 201
- Response มี id ของ Post ที่สร้าง
- title, body และ userId ตรงกับ Request

**คำอธิบาย:** ตรวจสอบว่าระบบสามารถรับข้อมูลและสร้าง Post ได้ถูกต้อง โดยข้อมูลที่ได้รับกลับมาต้องตรงกับข้อมูลที่ส่งไป

### TC06 — Update Post (PUT)

**Objective:** ตรวจสอบว่า API สามารถแก้ไขข้อมูล Post ได้

**Request**
- Method: PUT
- Endpoint: `/posts/1`

**Request Body**

```json
{
  "id": 1,
  "title": "Updated QA Testing",
  "body": "Updated API Testing Assignment",
  "userId": 1
}
```

**Expected Result**
- Status Code = 200
- Response มีข้อมูลตามที่ส่งไป
- id, title, body และ userId ถูกต้อง

**คำอธิบาย:** ตรวจสอบว่าระบบสามารถรับข้อมูลเพื่อแก้ไข Post ได้ครบตาม Request โดยไม่เกิดความผิดพลาดกับข้อมูลที่ส่งกลับมา

### TC07 — Partial Update Post (PATCH)

**Objective:** ตรวจสอบว่า API สามารถแก้ไขเฉพาะ Field ที่ต้องการได้

**Request**
- Method: PATCH
- Endpoint: `/posts/1`

**Request Body**

```json
{
  "title": "Partial Update QA"
}
```

**Expected Result**
- Status Code = 200
- title เปลี่ยนเป็นค่าที่ส่งไป
- Response มีข้อมูลตาม API ที่ตอบกลับ

**คำอธิบาย:** ตรวจสอบว่าระบบสามารถแก้ไขเฉพาะ Field ที่กำหนดได้ โดยไม่ส่งข้อมูล Field อื่นที่ไม่ต้องการแก้ไขไปใน Request

### TC08 — Delete Post

**Objective:** ตรวจสอบว่า API สามารถรับคำสั่งลบ Post ได้

**Request**
- Method: DELETE
- Endpoint: `/posts/1`

**Expected Result**
- Status Code = 200
- API ตอบกลับตามรูปแบบที่กำหนด
- ไม่มี Error ระหว่างประมวลผล

**คำอธิบาย:** ตรวจสอบว่าระบบสามารถประมวลผลคำสั่งลบ Post ได้สำเร็จ โดยพิจารณาผลตอบกลับตาม API ที่กำหนด

---

## 4. Negative Test Cases

นอกจากการทดสอบกรณีปกติแล้ว ยังออกแบบการทดสอบกรณีข้อมูลไม่ถูกต้องหรือไม่พบข้อมูล เพื่อดูว่าระบบจัดการข้อผิดพลาดได้อย่างไร

| Test Case | Request | สิ่งที่ต้องตรวจสอบ |
|---|---|---|
| Get Non-existing Post | GET /posts/9999 | การตอบกลับเมื่อไม่พบ Post |
| Get Comments with Invalid ID | GET /posts/9999/comments | การตอบกลับเมื่อไม่พบ Comments |
| Create Post with Empty Body | POST /posts | การจัดการเมื่อไม่ส่งข้อมูล |
| Create Post with Invalid Data Type | POST /posts โดยส่ง userId เป็น String | การตรวจสอบประเภทข้อมูล |
| Update Non-existing Post | PUT /posts/9999 | การจัดการเมื่อไม่พบ Post |
| Delete Non-existing Post | DELETE /posts/9999 | การจัดการเมื่อไม่พบ Post |

**คำอธิบาย:** Negative Testing ช่วยตรวจสอบว่าระบบสามารถจัดการข้อมูลผิดพลาดและกรณีไม่พบข้อมูลได้เหมาะสมหรือไม่

หมายเหตุ: JSONPlaceholder เป็น Fake REST API บางกรณีอาจไม่ได้ตรวจสอบข้อมูลผิดพลาดเหมือนระบบจริง จึงต้องตรวจสอบ Response ที่ได้รับจริง และไม่กำหนด Expected Status Code โดยไม่มี API Contract รองรับ

---

## 5. Postman Test Script

เพื่อให้การตรวจสอบทำได้อย่างเป็นระบบ จะใช้ Postman Tests Script สำหรับตรวจสอบผลลัพธ์โดยอัตโนมัติ

### Example 1 — Validate Create Post

```javascript
pm.test("Status code is 201", function () {
    pm.response.to.have.status(201);
});

const response = pm.response.json();

pm.test("Response contains Post ID", function () {
    pm.expect(response.id).to.exist;
});

pm.test("Title matches request", function () {
    pm.expect(response.title).to.eql("QA Testing");
});

pm.test("Body matches request", function () {
    pm.expect(response.body).to.eql("API Testing Assignment");
});

pm.test("User ID matches request", function () {
    pm.expect(response.userId).to.eql(1);
});
```

**คำอธิบาย:** Script นี้ช่วยตรวจสอบว่า API สร้าง Post ได้สำเร็จ และข้อมูลที่ตอบกลับตรงกับข้อมูลที่ส่งไป ไม่ใช่ตรวจสอบเพียง Status Code เท่านั้น

### Example 2 — Validate Get All Posts

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

const response = pm.response.json();

pm.test("Response is an array", function () {
    pm.expect(response).to.be.an("array");
});

pm.test("Each Post contains required fields", function () {
    response.forEach(post => {
        pm.expect(post).to.have.property("id");
        pm.expect(post).to.have.property("userId");
        pm.expect(post).to.have.property("title");
        pm.expect(post).to.have.property("body");
    });
});
```

**คำอธิบาย:** Script นี้ช่วยตรวจสอบว่าระบบส่ง Posts กลับมาในรูปแบบ Array และแต่ละรายการมีข้อมูลสำคัญครบถ้วน

### Example 3 — Validate Comments by Post ID

```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

const response = pm.response.json();

pm.test("Response is an array", function () {
    pm.expect(response).to.be.an("array");
});

pm.test("All comments belong to Post ID 1", function () {
    response.forEach(comment => {
        pm.expect(comment.postId).to.eql(1);
    });
});
```

**คำอธิบาย:** Script นี้ช่วยตรวจสอบว่า Comments ที่ได้รับทั้งหมดเป็นของ Post ID 1 จริง ไม่ได้ดึงข้อมูลของ Post อื่นมาปะปน

หมายเหตุ: ตัวอย่าง Script ใช้ข้อมูลตาม Test Case ที่กำหนด สามารถนำไปปรับใช้กับ Request อื่นใน Postman Collection ได้

---

## 6. Test Execution & Validation

เมื่อ Execute Test แต่ละครั้ง จะตรวจสอบผลลัพธ์ในประเด็นต่อไปนี้

| Validation | สิ่งที่ต้องตรวจสอบ |
|---|---|
| HTTP Status Code | ได้รับ Status Code ตามที่คาดหวัง |
| Response Body | ข้อมูลตรงกับ Expected Result |
| JSON Structure | โครงสร้าง JSON ถูกต้อง |
| Required Fields | มี Field ที่จำเป็นครบ |
| Data Type | ประเภทข้อมูลถูกต้อง |
| Relationship Validation | Comments มี postId ตรงกับ Post ที่ระบุ |
| Response Time | API ใช้เวลาตอบกลับเท่าไร |
| Error Handling | ระบบจัดการกรณีผิดพลาดได้เหมาะสม |

**คำอธิบาย:** การตรวจสอบต้องครอบคลุมทั้งสถานะการตอบกลับและความถูกต้องของข้อมูล เพื่อให้มั่นใจว่า API ทำงานได้ตามที่คาดหวัง

### Test Result Recording

ผลการทดสอบจะบันทึกข้อมูลดังนี้

- Test Case ID
- Request Method และ Endpoint
- Expected Result
- Actual Result
- Pass / Fail
- Response Time
- Evidence เช่น Request, Response และ Error Message

**คำอธิบาย:** การเก็บหลักฐานช่วยให้ตรวจสอบย้อนหลังได้ และทำให้ Developer สามารถนำข้อมูลไปวิเคราะห์และแก้ไขปัญหาได้ง่ายขึ้น

---

## 7. Test Deliverables

ตามรูปแบบการส่งงานที่โจทย์กำหนด จะจัดเตรียมไฟล์สำหรับนำไป Import และทดลองรันใน Postman

| File | Description |
|---|---|
| Postman Collection | รวม API Requests และ Test Scripts ทั้ง 8 Endpoints |
| Postman Environment | กำหนด Base URL สำหรับใช้งานร่วมกับ Collection |
| README.md | อธิบาย Test Scenarios, Expected Results และวิธีใช้งาน |

### Environment Variable

กำหนดตัวแปรสำหรับใช้งานใน Postman ดังนี้

| Variable | Value |
|---|---|
| baseUrl | https://jsonplaceholder.typicode.com |

ตัวอย่างการเรียกใช้งาน Endpoint:

```text
{{baseUrl}}/posts
{{baseUrl}}/posts/1
{{baseUrl}}/posts/1/comments
{{baseUrl}}/comments?postId=1
```

### วิธีใช้งาน

1. Import Postman Collection
2. Import Postman Environment
3. เลือก Environment ที่เตรียมไว้
4. Execute Request ตามลำดับ
5. ตรวจสอบ Test Results และ Response
6. Export ผลลัพธ์หรือบันทึกหลักฐานการทดสอบ

**หมายเหตุ:** JSONPlaceholder เป็น Fake REST API การสร้าง แก้ไข และลบข้อมูลเป็นการจำลองผลลัพธ์ ไม่ได้เปลี่ยนแปลงข้อมูลในฐานข้อมูลจริงอย่างถาวร ดังนั้นการตรวจสอบ Persistence ต้องไม่สรุปจาก Response เพียงอย่างเดียว

---

## 8. Conclusion

การออกแบบการทดสอบครั้งนี้ครอบคลุม API ทั้ง 8 Endpoints ตามโจทย์ โดยแบ่งการทดสอบออกเป็นการแสดงผล Posts การแสดง Comments ที่เกี่ยวข้อง การสร้าง Post การแก้ไข และการลบ Post

นอกจากนี้ยังเพิ่ม Negative Test Cases และ Postman Tests Script เพื่อช่วยตรวจสอบความถูกต้องของ Response และข้อมูลที่ได้รับกลับมา

สำหรับแทน การทดสอบ API ไม่ใช่เพียงการตรวจสอบว่า Request สำเร็จหรือไม่ แต่ต้องตรวจสอบด้วยว่าข้อมูลที่ระบบตอบกลับถูกต้อง ตรงตาม Expected Result และทำงานตามที่ API กำหนดหรือไม่
