.model small
.stack 100
.data
    xd db 13,10,'$'
    tb1 db 'nhap: $'
    tb2 db 'xuat: $'
    x dw ? ; goi bien x kieu dword(so) ko co gia tri ban dau
    y dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap
    
    mov ah,9
    lea dx,xd
    int 21h
    lea dx,tb2
    int 21h
    call xuat
    
    mov ah,0
    int 21h
    main endp
;ham nhap
nhap proc
    mov x,0
    mov y,0
    mov cx,0 ; goi bien cx = 0, ta se tang bien cx++ de dem so luong chu so cua so nhap vao
    mov bx,10 ; bx = 10 de chia ax nhan cho bx, ax += ax*bx
    
    loop1:
    mov ah,1
    int 21h
    cmp al,13 ; so sanh neu ta nhap dau enter thi ket thuc ham nhap,13 la dau enter trong ma ascii
    je thoat
    sub al,'0' ; al la char, phai doi dang dec bang cach tru di '0'
    xor ah,ah ; xoa ah trong thanh ghi ax, de ta chuyen ax chinh xac vao bien y
    mov y,ax
    mov ax,x
    mul bx ; ax=ax*bx
    add ax,y ; ax+=ax+y
    mov x,ax
    inc cx ; cx++
    jmp loop1 
    
    thoat:
    ret
    nhap endp
; ham xuat
xuat proc
    mov bx,10
    mov ax,x
    chia:
    xor dx,dx ; phai xoa dx
    cmp ax,0 ; neu ax = 0 thi thoat
    je inra
    div bx ; chia ax cho dx, phan nguyen luu vao ax, phan du chuyen vao dx, vi vay can phai xoa dx truoc khi chia
    push dx ; cho dx vao stack
    jmp chia
    
    inra:  ; ham se lap bang cach cx-- va dung cho den khi cx = 0
    pop dx
    add dx,'0' ; chuyen dx sang dang char va xuat ra man hinh bang ham ngat ah,2
    mov ah,2
    int 21h
    loop inra
    
    thoat2:
    ret
    xuat endp
end

