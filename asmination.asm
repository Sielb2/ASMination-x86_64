%macro print 2
	inc	rbx
	cmp	rbx, 7 ; remove this line to run in a loop
	jg	exit ; also this line
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, clear
	mov	rdx, clear_len
	syscall
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, %1
	mov	rdx, %2
	syscall
	mov	rax, 35
	mov	rdi, delay
	xor	rsi, rsi
	syscall
	mov	rdi, %1
	mov	rcx, %2
	xor	rax, rax
	rep	stosb
%endmacro
%macro openread 1
	mov 	rax, 257
	mov	rdi, [animation_fd]
	lea	rsi, [rel %1]
	mov	rdx, 0
	syscall
	mov	[frame_fd], eax
	mov	rax, 0
	mov	rdi, [frame_fd]
	mov	rsi, FRAME_BUFFER
	mov	rdx, 2000
	syscall
	mov	rdi, frame_fd ; wasted a hour not realizing the file descriptor will be the same
	mov	rcx, 2
	xor	rax, rax
	mov	byte [rdi], al
%endmacro
section .data
	delay dq 0, 300000000 ; delay between frames, here 300ms
	clear db 27, "[2J", 27, "[H", 0
	clear_len equ $-clear
	animation db "animation", 0 ; animation directory
	src db "src", 0 ; source directory
	file1 db "1.txt", 0 ; sorry i got lazy
	file2 db "2.txt", 0
	file3 db "3.txt", 0
	file4 db "4.txt", 0
	file5 db "5.txt", 0
	file6 db "6.txt", 0
	file7 db "7.txt", 0
section .bss
	FRAME_BUFFER resb 2000
	src_fd resd 1
	animation_fd resb 1
	frame_fd resd 1
section .text
	global _start
_start:
	mov 	rax, 2
	lea	rdi, [rel src]
	mov	rsi, 0
	mov	rdx, 0
	syscall
	mov	[src_fd], eax
	mov 	rax, 257
	mov	rdi, [src_fd]
	lea	rsi, [rel animation]
	mov	rdx, 0
	syscall
	mov	[animation_fd], eax
	mov	rbx, 1
	call	loop
loop:
	openread file1
	print FRAME_BUFFER, 2000 ; #menace
	openread file2
	print FRAME_BUFFER, 2000
	openread file3
	print FRAME_BUFFER, 2000
	openread file4
	print FRAME_BUFFER, 2000
	openread file5
	print FRAME_BUFFER, 2000
	openread file6
	print FRAME_BUFFER, 2000
	openread file7
	print FRAME_BUFFER, 2000
	jmp loop
exit:
	mov	rax, 60
	xor	rdi, rdi
	syscall ; good boyyyyy
