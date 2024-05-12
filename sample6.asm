.model smaill
.stack 100h
.data
  xd db 13,10,'$'
  xau db 100 dup('$')
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

  lea si,[xau+2]
  mov ah,2
  duyetxau:
    cmp [si], '$'
    je inxau
    push [si]
    inc si
    loop duyetxau
  mov cl,[xau+1]
  inxau:
    pop dx;
    int 21h;
    loop inxau

  mov ah,0
  int 21h
    
main endp
end
