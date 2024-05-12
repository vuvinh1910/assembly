.model small
.stack 100h
.data
  xuongdong db 13,10,'$'
  nhap db 'nhap ky tu: $'
  xuat db 'ky tu in hoa: $'
  kytu db ?,'$'  ; neu co them dau '$' danh dau ket thuc chuoi ky tu thi kytu se duoc in theo kieu ah,9
  
.code
  main proc ;vi du 3
  mov ax,@data
  mov ds,ax

  mov ah,9
  lea dx,nhap
  int 21h

  mov ah,1 ; nhap 1 kytu luu vao al
  int 21h
  sub al,32 ; ham cong al=al+32
  mov kytu,al

  mov ah,9
  lea dx,xuongdong
  int 21h 
  
  lea dx,xuat
  int 21h
  
  lea dx,kytu  ; vi kytu trong data la 1 chuoi nen in theo ah,9
  int 21h
  
  
  
  main endp
end
