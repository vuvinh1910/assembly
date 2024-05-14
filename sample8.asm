.model small
.stack 100
.data
    xd db 13,10,'$'
    tb1 db 'mang cho truoc: $'
    tb2 db 'so cac so chia het cho 11: $'
    tb3 db 'tong cac so chia het cho 11 = $'
    list dw 11,22,23,121,43,'#' ; mang cho truoc ket thuc bang #
    x dw ?
    y dw ?
    n dw 0
    tong dw 0
    cach db ' $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
       
    lea si,list ; cho si tro den vi tri dau tien cua mang
    duyetmang:
    lodsw ; ham nay duyet [si] vao thanh ghi ax, va cho si++ moi lan lap
    cmp ax,'#' ; so sanh ax voi phan tu cuoi mang
    je hetduyetmang
    mov x,ax
    call xuat ; ham in ra so co 2 chu so tro len, bang cach % cho 10, push phan du vao stack roi lay ra in tung chu.vd: 15 -> stack(5,1) -> 1,5
    mov ah,9
    lea dx,cach ; in dau cach
    int 21h
    jmp duyetmang
     
    hetduyetmang: ; in ra thong bao
    mov ah,9
    lea dx,xd
    int 21h
    lea dx,tb2
    int 21h
    
    mov bx,11  ; ham nay duyet lai 1 lan nua va kiem tra ax % 11 = 0 hay khong
    lea si,list
    chiahet:
    lodsw    ; ax=[si], si++
    cmp ax,'#'
    je endchia
    mov cx,ax  ; dua cx = ax vi ax sau khi chia se luu phan nguyen (ax thay doi khi dung div bx)
    xor dx,dx
    div bx
    cmp dx,0
    jne mark1
    add n,1   ; neu chia het 11 thi so luong n++
    add tong,cx ; tong+=cx
    mark1:
    jmp chiahet
    
    endchia:
    mov dx,n
    mov ah,2
    add dx,'0'
    int 21h
    mov ah,9
    lea dx,xd
    int 21h
    lea dx,tb3
    int 21h
     
    mov cx,tong ; vi tong co the la so >= 2 chu so nen ta dung ham xuat de in so nguyen >=10
    mov x,cx
    call xuat
    
    mov ah,0
    int 21h
    main endp
; ham xuat
xuat proc
    mov bx,10
    mov ax,x
    mov cx,0
    chia:
    xor dx,dx    
    cmp ax,0
    je inra
    inc cx
    div bx
    push dx
    jmp chia
    
    inra:
    pop dx
    add dx,'0'
    mov ah,2
    int 21h
    loop inra
    
    ret
    xuat endp
end

