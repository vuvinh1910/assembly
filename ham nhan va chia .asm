// ham nhan mul
lay so duoc luu trong al nhan voi so duoc dung trong lenh mul
vidu mov al,2 ; al=2
  mov bl,5
mul bl ; ax = bl x al = 10
      ; ket qua ham mul se luu vao ax
// ham chia div
mov ax,20
mov bx,6
div bl ;chia 8 bit 
div bx ;chia 16bit
// so bi chia lay trong thanh ghi al neu 8 bit ax neu 16 bit
// so chia lay trong bl neu 8bit bx neu 16 bit
// neu chia theo 8bit div bl thi phan nguyen duoc luu trong al va phan du luu trong ah.vd 20/6. ah = 2, al = 3.
// neu chia theo 16 bit thi phan nguyen luu trong ax va phan du luu trong dx
