[Bài tập] Tạo bảng có DEFAULT và CHECK

 

1. Mục tiêu
Kết hợp nhiều ràng buộc trong cùng một bảng
Hiểu vai trò của ràng buộc trong thiết kế CSDL
 

2. Mô tả
Một hệ thống quản lý tài khoản người dùng cần lưu thông tin đăng ký

Thông tin gồm:

Mã người dùng
Tên đăng nhập
Mật khẩu
Trạng thái tài khoản
 

Yêu cầu:

Tạo bảng users
Áp dụng các ràng buộc:
PRIMARY KEY cho mã người dùng
UNIQUE cho tên đăng nhập
NOT NULL cho mật khẩu
DEFAULT cho trạng thái là 'ACTIVE'
CHECK để trạng thái chỉ nhận 'ACTIVE' hoặc 'INACTIVE'
Không viết câu lệnh thêm dữ liệu
 

3. Đánh giá
Để hoàn thành bài thực hành, học viên cần:

Đưa mã nguồn lên GitHub.
Dán link của repository lên phần nộp bài trên hệ thống.