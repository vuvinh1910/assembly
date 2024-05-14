.model small
.stack 100
.data
    tb1 db 'nhap xau A: $'
    tb2 db 'nhap xau B: $'
    xd db 13,10,'$'
    x dw ?
    y dw ?
    temp dw 0
    vt dw ?
    vitri db 'vi tri xau B trong xau A: $'
    xaua db 200 dup('$')
    xaub db 200 dup('$')
    khong db 'xau B khong phai xau con $'
    phay db ' '
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    mov ah,10
    lea dx,xaua
    int 21h
    
    mov ah,9
    lea dx,xd
    int 21h
    lea dx,tb2
    int 21h
    
    mov ah,10
    lea dx,xaub
    int 21h
    
    mov ah,9
    lea dx,xd
    int 21h
    
    lea si,xaua+2 ; con tro si tro den phan tu dau tien cua xaua
    mov y,-1
    
    lapa:
    mov x,si
    add y,1
    lea di,xaub+2 ; con tro di tro den phan tu dau tien cua xaub
    cmp [si],'$'
    je end1
    mov ax,[di] ; so sanh [si] va [si], vi cmp so sanh thanh ghi nen cho ax=[di] lam trung gian, ko the so sanh truc tiep [di],[si]
    cmp [si],al
    je timchuoi
    lapa1:
    mov si,x
    inc si
    jmp lapa
    
    luuvitri:
    add temp,1
    cmp temp,1
    je in2
    lvt2:
    mov ah,2
    mov dx,y
    add dx,'0'
    int 21h
    mov dl,phay
    int 21h
    jmp lapa1
    
    timchuoi:
    inc si
    inc di
    cmp [di],13 ; so sanh xem da duyet het xaub hay chua, so sanh voi ky tu xuong dong, trong ma ascii la 13
    je luuvitri
    mov ax,[di]
    cmp [si],al
    jne lapa1
    jmp timchuoi
    
    end1:
    cmp temp,0
    je in1
    cmp temp,0
    jne end2
    
    in1:
    mov ah,9
    lea dx,khong
    int 21h
    jmp end2
    
    in2:
    mov ah,9
    lea dx,vitri
    int 21h
    jmp lvt2
    
    end2:
    mov ah,0
    int 21h 
    main endp
end
