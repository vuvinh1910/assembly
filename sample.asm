.model small
.Stack 100h
.Data
     ;  Cú pháp trong .data:
     ; <tên biến> d<Kiểu DL> <giá trị khởi tạo>
     xuongdong DB 13,10,'$' ; trong ascii 13 la ki tu quay lai dau dong,10 la xuong dong,'$' danh dau ket thuc chuoi.
     ; DB la double word thuong de luu ky tu
     xinchao DB 'hello$'
     xinchao2 db 'con cac$'
.Code
Main proc ;vidu
  MOV AX,@Data ; chuyển dữ liệu data vào thanh ghi ax
  MOV DS,AX ; Di chuyển giá trị của AX vào DS
  ; quan trọng, học thuộc, tác dụng là trỏ đến .Data ở trên
  
  mov ah,9 ;gọi hàm in ra xâu kí tự trong hàm hệ thống 
  lea dx,xinchao ;khi sử dụng dịch vụ hệ thống để in chuỗi ra màn hình thông qua int 21h, chuỗi cần phải được trỏ bởi thanh ghi DX. Điều này là quy ước do cách DOS xử lý các hàm gọi hệ thống.
  int 21h ;Khi bạn sử dụng lệnh int 21h, CPU sẽ chuyển quyền kiểm soát tới hệ thống , 
     ;và nó sẽ thực hiện một hoạt động cụ thể dựa trên giá trị được đặt trong thanh ghi AH.
     ;Giá trị này xác định chức năng cụ thể mà bạn muốn thực hiện.

  lea dx,xuongdong ; xuong dong
  int 21h

  lea dx,xinchao2 ; in ra loi chao thu 2
  int 21h
  
  ; 2 dong sau tuong tu return trong c++;
  mov ah,0
  int 21h
Main Endp
END
