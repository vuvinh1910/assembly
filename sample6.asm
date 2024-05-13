.model small
.stack 100
.data
  xd db 13,10,'$'
  xau db 50 dup('$')
  nhap db 'nhap sau: $'
  xuat1 db 'chuoi dao nguoc : $'
.code
main proc ; vidu 6
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
  lea dx,xuat1
  int 21h
  lea dx,xd
  int 21h
  
  mov cl,[xau+1]
  sub cx,256
  lea si,[xau+2]
  duyetxau:
    push [si]
    inc si
    loop duyetxau
  
  mov cl,[xau+1]
  inxau1:
    pop dx;
    mov ah,2
    int 21h;
    loop inxau1
   
  mov ah,0
  int 21h
    
main endp
end
