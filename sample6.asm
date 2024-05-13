.model small
.stack 100
.data
  xd db 13,10,'$'
  xau DB 40 dup('$')
  nhap db 'nhap sau: $'
  xuat1 db 'chuoi dao nguoc : $'
.code
main proc ; vidu 6
  mov ax,@data
  mov ds,ax
  mov cx,0 ; sử dụng loop sẽ căn cứ vào cx, cứ mỗi lần loop thì cx--, nếu cx=0 thì dừng lại vòng lặp
           ; khai báo cx=0 để xác định cx, nếu không dòng 31 sẽ lỗi, vidu lỗi: cx=256 thay vì đúng là 0 sau khi gán xau+1 cho cl
  
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
  
  mov cl,[xau+1]  ; cl để lưu byte kí tự,cx thường lưu số nguyên, gán cl cho số phần tử của xau, thì cx sẽ thay đổi thành số kí tự của xau
                  ; cl = '3' cx = 3
  lea si,[xau+2]  ; con trỏ si trỏ tới phần tử đầu tiên của xâu
  duyetxau:
    push [si]
    inc si
    loop duyetxau
  
  mov cl,[xau+1] ; gán lại cl và cx vì cx ở loop trước đã trừ hết = 0
  inxau1:
    pop dx ; pop phần tử của stack và đưa vào dx  
    mov ah,2
    int 21h ; hàm ah,2 in ra dl mà dl là thanh ghi con trong dx
    loop inxau1
   
  mov ah,0
  int 21h
    
main endp
end
