.model small
.stack 100h
.data
  xd db 13,10,'$'
  nhap db 'nhap : $'
  xuat db 'xau thuong: $'
  xuat2 db 'xau hoa : $'
  kytu db ?,'$'
  xau db 200 dup('$')
.code
main proc ; vidu 5
  mov ax,@data
  mov ds,ax

  mov ah,9
  lea dx,nhap
  int 21h

  mov ah,10
  lea dx,xau
  int 21h

  mov ah,9
  lea dx,xd
  int 21h

  lea dx,xuat
  int 21h
  call inthuong ;dung de goi ham con inthuong

  mov ah,9
  lea dx,xd
  int 21h

  lea dx,xuat2
  int 21h
  call inhoa ; goi ham con inhoa
            
  mov ah,0 ;ham return
  int 21h
  

main endp
inthuong proc
    lea si,xau+2 ; thanh ghi si tro den dia chi thu 2 trong xau
    looptu:
      mov dl,[si] ; [si] la gia tri noi dung ma thanh ghi si dang tro den, goi dl de in ra bang lenh ah,2
      cmp dl, 'A' ; so sanh dl voi ki tu A
      jl in1 ; jn la jump less, neu dl nho hon a thi chay lenh in1
      cmp dl, 'Z' ; so sanh dl voi Z
      jg in1 ; jg la jump greater, neu dl lon hon z thi chay lenh in1
      add dl,32 ; neu cac ham so sanh tren sai thi chay lenh nay
    in1:
      mov ah,2 ; ham in 1 ky tu duoc luu trong thanh ghi dl
      int 21h
      inc si ; tuong tu si++, tang con tro len 1 don vi
      cmp [si], '$' ; so sanh [si] co phai ky tu ket thuc xau hay khong
      jne looptu ; jump not equal tuong tu nhu phep so sanh != trong c++
  ret ; quan trong, ham con luon co ret trong ham
  inthuong endp

inhoa proc
    lea si,xau+2 ; thanh ghi si tro den dia chi thu 2 trong xau
    looptu1:
      mov dl,[si] ; [si] la gia tri noi dung ma thanh ghi si dang tro den, goi dl de in ra bang lenh ah,2
      cmp dl, 'a' ; so sanh dl voi ki tu a
      jl in2 ; jn la jump less, neu dl nho hon a thi chay lenh in1
      cmp dl, 'z' ; so sanh dl voi z
      jg in2 ; jg la jump greater, neu dl lon hon z thi chay lenh in1
      sub dl,32 ; neu cac ham so sanh tren sai thi chay lenh nay
    in2:
      mov ah,2 ; ham in 1 ky tu duoc luu trong thanh ghi dl
      int 21h
      inc si ; tuong tu si++, tang con tro len 1 don vi
      cmp [si], '$' ; so sanh [si] co phai ky tu ket thuc xau hay khong
      jne looptu1 ; jump not equal tuong tu nhu phep so sanh != trong c++
  ret ; quan trong, ham con luon co ret trong ham
  inhoa endp
end
