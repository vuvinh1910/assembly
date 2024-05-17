.model small

.stack 200h

.data
	window_width dw 140h
	window_height dw 0c8h
	window_bound dw 3h

	time_aux db 0h
	game_active db 1h

	ball_x_default dw 0a0h
	ball_y_default dw 64h
	ball_x dw 0a0h
	ball_y dw 64h
	ball_size dw 04h
	ball_velocity_x dw 05h
	ball_velocity_y dw 02h

	player_left_points dw 0h
	paddle_left_x dw 0ah
	paddle_left_y dw 48h
	paddle_left_height dw 30h

	player_right_points dw 0h
	paddle_right_x dw 12ch
	paddle_right_y dw 48h
	paddle_right_height dw 30h

	paddle_width dw 0ah
	paddle_height_default dw 30h
	paddle_y_default dw 48h

	paddle_velocity dw 10h

	text_player_one_points db '0', '$'
	text_player_two_points db '0', '$'

	text_game_over_title db 'GAME OVER!', '$'
	text_game_over_player_1 db 'Player 1 won', '$'
	text_game_over_player_2 db 'Player 2 won', '$'
	text_play_again db '[R] - Play again.', '$'
	text_exit_game db '[Q] - Quit game.', '$'

	text_title db 'Welcome to PONG!', '$'
	text_credits_1 db 'Group 8 - Computer architecture - PTIT', '$'
	text_control_instruction_left db 'Player 1: [W], [S]', '$'
	text_control_instruction_right db 'Player 2: [O], [L]', '$'


.code

DRAW_PADDLES proc
    mov ax,@data;
    mov ds,ax;
    
    
    mov ah, 00h ; chon che do do hoa de ve 
    mov al, 13h 
    int 10h 

	mov cx, paddle_left_x
	mov dx, paddle_left_y

	DRAW_PADDLE_LEFT_PIXEL:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h

		inc cx
		mov ax, cx
		sub ax, paddle_left_x
		cmp ax, paddle_width
		jng DRAW_PADDLE_LEFT_PIXEL

		mov cx, paddle_left_x
		inc dx
		mov ax, dx
		sub ax, paddle_left_y
		cmp ax, paddle_left_height
		jng DRAW_PADDLE_LEFT_PIXEL

	mov cx, paddle_right_x
	mov dx, paddle_right_y

	DRAW_PADDLE_RIGHT_PIXEL:
		mov ah, 0ch
		mov al, 0fh
		mov bh, 00h
		int 10h

		inc cx
		mov ax, cx
		sub ax, paddle_right_x
		cmp ax, paddle_width
		jng DRAW_PADDLE_RIGHT_PIXEL

		mov cx, paddle_right_x
		inc dx
		mov ax, dx
		sub ax, paddle_right_y
		cmp ax, paddle_right_height
		jng DRAW_PADDLE_RIGHT_PIXEL

	mov ah,0
	int 21h
DRAW_PADDLES endp
