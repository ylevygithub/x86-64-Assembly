global strcmp

strcmp:
	xor	rax, rax ; set return value to 0

loop:
	mov	al, byte[rdi]	; al is 8 bytes part of rax : al = *s1
	mov bl, byte[rsi]	; bl is 8 bytes part of rbx : bl = *s2
	cmp	bl, al ; if (*s2 != *s1)
	jne	difference ; if (*s2 != *s1), return *s2 - *s1
	cmp	al, 0 ; if (*s1 == '\0')
	cmp	bl, 0 ; if (*s1 == '\0')
	je	exit ; jump to return 0
	inc rdi ;s1++
	inc rsi ;s2++
	jmp	loop ; loop

difference:
	xor	ecx, ecx ; set tmp to 0
	mov	cl, byte[rsi] ; cl is 8 bytes part of rcx : cl = *s2
	sub	eax, ecx ; eax (return value) = eax -= *s2

exit:
	ret ; return *s1 - *s2
