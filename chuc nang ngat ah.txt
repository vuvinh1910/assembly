mov ah,1 ; nhap 1 ky tu tu ban phim, ky tu nhap se luu vao al
int 21h
kytu db ?
mov kytu,al ; kytu = al

  
mov ah,2 ; in 1 ky tu tu thanh ghi dl ra man hinh
lea dx,kytu ; hoac mov dl,kytu
int 21h

  
mov ah,9 ; xuat 1 xau tu dx ra man hinh
load dx,xau ; dx = xau
int 21h

  
xau db 100 dup('$')
mov ah,10 ; nhap 1 xau tu ban phim
lea dx,xau
int 21h
