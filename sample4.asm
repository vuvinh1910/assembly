.model small
.stack 100h
.data
  xd db 13,10,'$'
  nhap db 'nhap: $'
  xuat db 'chuoi vua nhap: $'
  kytu db ?,'$'
  chuoi db 200 dup('$') ; new , khai bao 1 chuoi gom 200 ky tu co dau $ o cuoi dong
.code
main proc ;vidu4
  mov ax,@data
  mov ds,ax

  mov ah,9
  lea dx,nhap
  int 21h

  mov ah,10 ; nhap 1 chuoi ky tu tu ban phim
  lea dx,chuoi
  int 21h

  mov ah,9
  lea dx,xd
  int 21h

  lea dx,xuat
  int 21h

  lea dx,chuoi+2 ; ham load den vi tri thu 2 cua chuoi vao dx
  ; tai sao +2, vi khi nhap 1 chuoi 2 con tro dau tien cua chuoi luon co gia tri : 256,so ky tu trong chuoi
  ; vi du: nhap 'heo' - > 256,3,h,e,o.
  int 21h
  
main endp
end
