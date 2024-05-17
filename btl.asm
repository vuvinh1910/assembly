
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ah, 00h ; chon che do do hoa de ve 
mov al, 13h 
int 10h 


mov ah, 0ch ; chế độ vẽ 1 pixel ah,12
mov al, 0fh ; chọn màu trắng al,15
mov bh, 00h ; chọn trang bh,0
mov cx, 0ah ; vị trí (X) x=10
mov dx, 0ah ; vị trí (Y) y=10
int 10h ; ham ve



ret
