.model small
.stack 100
.data
    xau db 100 dup('$')
    xaub db 'ktmt$'
    x dw ?
    y dw ?
    n dw 0
    tb db 'nhap xau: $'
    tb2 db 'so lan xuat hien: $'
    xd db 13,10,'$'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb
    int 21h
    mov ah,10
    lea dx,xau
    int 21h
    
    lea si,xau+2
    lapxau:
    mov x,si
    cmp [si],13
    je ennd
    mov ax,[si]
    lea di,xaub
    cmp al,[di]
    je lapxau2
    lapxau3:
    mov si,x
    inc si
    jmp lapxau
    
    congn:
    add n,1
    jmp lapxau3
    
    lapxau2:
    inc si
    inc di
    mov ax,[di]
    cmp al,'$'
    je congn
    cmp al,[si]
    jne lapxau3
    jmp lapxau2
    
    ennd:
    mov ax,n
    mov x,ax
    mov ah,9
    lea dx,xd
    int 21h
    lea dx,tb2
    int 21h
    call xuat
    
    mov ah,0
    int 21h
    
    main endp
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



