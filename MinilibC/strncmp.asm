global strncmp

strncmp:
	cmp rdi, 0 ; if (*s1 == '\0')
	je null ; jump to null return (0);
	cmp rsi, 0 ; if (*s2 == '\0')
	je null ; jump to null return (0);
	cmp rdx, 0 ; if (size_t n == 0)
	je null ; jump to null return (0);
	xor rcx, rcx ; set index to 0
loop:
	cmp byte[rdi], 0 ; if (*s1 == '\0')
	je end ; jump to end
	mov bl, byte[rsi] ; bl is 8 bytes first part of rbx : bl = *s2
	cmp byte[rdi], bl ; if (*s1 != *s2)
	jne end ; if (*s1 != *s2), jump to end part
	inc rcx ; index++
	cmp rcx, rdx ; if (index != n)
	je end ; jump to end part
	inc rdi ; s1++
	inc rsi ; s2++
	jmp loop ; jump to loop part
end:
	xor rax, rax ; set return value to 0
	mov bl, byte[rdi] ; move *s2 vers l emplacement memoire de *s1
	sub bl, byte[rsi] ; soustrait *new_s2 et *s2
	mov al, bl ; al = bl
	ret ; return (*s2 - *s1)
null:
	xor rax, rax ; set return value to 0
	ret ; return it