.model small
.stack 100h
.data
  xuongdong db 13,10,'$'
  nhap db 'nhap ky tu: $'
  xuat db 'ky tu in hoa: $'
  kytu db ?
  
.code
  main proc ;vi du 3
  mov ax,@data
  mov ds,ax

  mov ah,9
  lea dx,nhap
  int 21h

  mov ah,1 ; nhap 1 kytu luu vao al
  int 21h 
  mov kytu,al
  sub kytu,20h

  mov ah,9
  lea dx,xuongdong
  int 21h

  mov ah,2
  mov al,kytu
  int 21h

  
  
  
  main endp
end
