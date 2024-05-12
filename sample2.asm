.model small
.stack 100h
.data
  nhap db'nhap chu: $'
  xuongdong db 13,10,'$'
  xuat db 'ky tu vua nhap la: $'
  kytu db ? ; Khai báo biến có tên kytu và không có giá trị ban đầu
.code
  main proc ;vidu2
  mov ax,@data
  mov ds,ax

  ; in ra dong nhap chu: 
  move ah,9
  lea dx,nhap
  int 21h

  mov ah,1 ; goi ham nhap 1 ky tu, ki tu nhap se luu vao al
  int 21h ; thuc hien lenh trong ah
  mov kytu,al ; gan gia tri trong al vao kytu

  mov ah,9
  lea dx,xuongdong
  int 21h 
  
  lea dx,xuat
  int 21h
         
  mov ah,2 ; chuyen chuc nang ah sang 2, chuc nang in 1 ky tu trong thanh ghi dl ra man hinh      
  mov dl,kytu ; vi ham tren in ra tu thanh ghi dl, nen ta se chuyen kytu vao thanh ghi dl
  int 21h ; thuc hien ham ah
  
  main endp
end

