global strlen

strlen:
	push rbp
	mov rbp, rsp
	xor rax, rax ; I set the index to 0
loop:
	cmp [rdi + rax], byte 0 ; cmp (pointer+index) with '\0'
	je endloop ; end of the loop
	inc rax ; increment the index
	jmp loop ; continue the loop

endloop:
	mov rsp, rbp
	pop rbp
	ret
