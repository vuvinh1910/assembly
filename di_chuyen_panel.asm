MOVE_PADDLES proc

	mov ah, 01h ;  kiểm tra coi có phím nhấn chưa
	int 16h
	jnz CHECK_PADDLE_MOVEMENT ;nếu có phím nhấn, zero flag sẽ có giá trị 1
	ret
	;Trong hệ thống tọa độ màn hình, tọa độ Y tăng lên khi đi xuống dưới màn hình và giảm khi đi lên trên màn hình,
	;tọa độ X tăng khi đi sang phải và giảm khi đi sang trái màn hình
	CHECK_PADDLE_MOVEMENT:
		mov ah, 00h ;   kiểm tra xem phím được nhấn là phím gì ?
		int 16h	;  trả giá trị phím nhấn vào thanh ghi al

		; di chuyen panel ben trai
		cmp al, 'w'
		je MOVE_LEFT_PADDLE_UP
		cmp al, 'W'
		je MOVE_LEFT_PADDLE_UP
		cmp al, 's'
		je MOVE_LEFT_PADDLE_DOWN
		cmp al, 'S'
		je MOVE_LEFT_PADDLE_DOWN

		; di chuyen panel ben phai
		cmp al, 'o'
		je MOVE_RIGHT_PADDLE_UP
		cmp al, 'O'
		je MOVE_RIGHT_PADDLE_UP
		cmp al, 'l'
		je MOVE_RIGHT_PADDLE_DOWN
		cmp al, 'L'
		je MOVE_RIGHT_PADDLE_DOWN

		ret

	MOVE_LEFT_PADDLE_UP:
		mov ax, paddle_velocity ; ax = van toc vector
		sub paddle_left_y, ax ; toa do y panel trai -= ax, đưa panel lên trên
		mov ax, 0
		cmp paddle_left_y, ax ; kiem tra xem panel da chạm biên trên 
		jl FIX_PADDLE_LEFT_TOP_POSITION ; neu y < 0 thì gọi hàm để giữ panel không bi tràn biên bằng cách cho y cố định = 0
		ret

	MOVE_LEFT_PADDLE_DOWN:
		mov ax, paddle_velocity ; ax = vận tốc panel
		add paddle_left_y, ax ; y += ax, đưa panel xuống dưới
		mov ax, window_height ; gán ax cho biên dưới của màn hình
		sub ax, paddle_left_height ; ax-= chiều dài của panel, vì tọa độ y nằm phía trên cùng bên trái của panel
		; để so sánh với biên phía dưới ta cần so sánh y với "biên dưới - chiều dài panel"
		cmp paddle_left_y, ax ; so sánh tọa độ y với ax (biên phía dưới)
		jg FIX_PADDLE_LEFT_BOTTOM_POSITION ; nếu y > ax thì gọi hàm để giữ panel không tràn biên bằng cách cho y cố dịnh = biên dưới - độ dài panel
		ret

	; hàm di chuyển vợt phải cũng tương tự vợt trái
	MOVE_RIGHT_PADDLE_UP:
		mov ax, paddle_velocity
		sub paddle_right_y, ax
		mov ax, 0
		cmp paddle_right_y, ax
		jl FIX_PADDLE_RIGHT_TOP_POSITION
		ret
	
	MOVE_RIGHT_PADDLE_DOWN:
		mov ax, paddle_velocity
		add paddle_right_y, ax
		mov ax, window_height
		sub ax, 0
		sub ax, paddle_left_height
		cmp paddle_right_y, ax
		jg FIX_PADDLE_RIGHT_BOTTOM_POSITION
		ret

	FIX_PADDLE_LEFT_TOP_POSITION:
		mov ax, 0
		mov paddle_left_y, ax
		ret

	FIX_PADDLE_LEFT_BOTTOM_POSITION:
		mov paddle_left_y, ax
		ret
	
	FIX_PADDLE_RIGHT_TOP_POSITION:
		mov ax, 0
		mov paddle_right_y, ax
		ret

	FIX_PADDLE_RIGHT_BOTTOM_POSITION:
		mov paddle_right_y, ax
		ret

MOVE_PADDLES endp
