global memset
; The memset() function fills the first n bytes of the memory area pointed to by s with the constant byte c.
; void *memset(void *s, int c, size_t n);
; memset - fill memory with a constant byte
; The memset() function returns a pointer to the memory area s.
; rdi destination pointer for string instruction. rdi = first param = *s
; rsi source pointer for string instruction second param 
; rdx = n

memset:
    xor rax, rax ; set return value to 0
    mov rax, rdi ; rdi = *s
    jmp loop

loop:
    mov byte[rdi], sil ; rdi = *s ; exemple : s=salut
    dec dl ; dl = first part bites of rdx: n-- ; exemple : n = 3->2->1->0.
    inc dil ; dil = first part bites of rdi: s++ ; exemple s[c] = s[1] = a. s="sa"->s="sal"->s="salu"
    cmp dl, 0 ; if (n == 0) ; memset("salut", 3, 3) == *s = "salu"
    je end ; if (n == 0) jump to end
    jmp loop; jump to loop
end:
    ret