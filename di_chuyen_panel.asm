MOVE_PADDLES proc

	mov ah, 01h
	int 16h
	jnz CHECK_PADDLE_MOVEMENT
	ret

	CHECK_PADDLE_MOVEMENT:
		mov ah, 00h
		int 16h

		cmp al, 'w'
		je MOVE_LEFT_PADDLE_UP
		cmp al, 'W'
		je MOVE_LEFT_PADDLE_UP
		cmp al, 's'
		je MOVE_LEFT_PADDLE_DOWN
		cmp al, 'S'
		je MOVE_LEFT_PADDLE_DOWN

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
		mov ax, paddle_velocity
		sub paddle_left_y, ax
		mov ax, 0
		cmp paddle_left_y, ax
		jl FIX_PADDLE_LEFT_TOP_POSITION
		ret

	MOVE_LEFT_PADDLE_DOWN:
		mov ax, paddle_velocity
		add paddle_left_y, ax
		mov ax, window_height
		sub ax, 0
		sub ax, paddle_left_height
		cmp paddle_left_y, ax
		jg FIX_PADDLE_LEFT_BOTTOM_POSITION
		ret

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
