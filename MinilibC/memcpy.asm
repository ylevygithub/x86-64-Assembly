global memcpy
; void *memcpy(void *dest, const void *src, size_t n);
; The  memcpy()  function copies n bytes from memory area src to memory area dest.
; The memory areas must not overlap.  Use memmove(3) if the memory areas do over‐lap.
; The memcpy() function returns a pointer to dest.
; rdx->dl : size_t n
; rax : return value
; rax->al : *dest
; rdi->dil : *dest
; rsi->sil : *src

memcpy:
    xor rax, rax ; set return value to 0
    mov rax, rdi ; rdi = *dest
    jmp loop

loop:
    cmp dl, 0 ; if (n == 0) ; memcpy(*dest, "salut", 3) == *dest = "salu"
    je end ; if (n == 0) jump to end
    mov al, byte[rsi] ; al is 8 bytes part of rax : al = *src
    mov byte[rdi], al ; move *src in *dest
    dec dl ; dl = first part bites of rdx: n-- ; exemple : n = 3->2->1->0.
    inc dil ; dil = first part bites of rdi: dest++ ; exemple dest[n] = dest[1] = a. dest="sa"->dest="sal"->dest="salu"
    inc sil ; sil = first part bites of rsi: src++ ; exemple src[n] = src[1] = a. src="sa"->src="sal"->src="salu"
    jmp loop; jump to loop
end:
    ret
