global strchr

; char *strchr(const char *s, int c);
; The strchr() function returns a pointer to the first occurrence of the character c in the string s.
; The  strchr() return a pointer to the matched character or NULL if the character is not found.
;   The terminating null byte is considered part of the string, so that if c is specified as '\0', 
; these functions return a pointer to the terminator.

strchr:
    xor rax, rax; set return value to 0
    cmp rdi, 0 ; rdi = *s. if (*s == 0)(*s is empty)
    je empty ; if (*s == 0) jumpt to empty part
loop:
    cmp byte[rdi], sil ; search (rsi->sil=second param) in (rdi=first param)
    je finishing ; if sil exists in rdi, on jump dans finishing pour renvoyer la string a partir de l'occurence en commancant la string par sil
    cmp byte[rdi], 0 ; if on est en fin de boucle et qu on a pas trouver l'occurence
    je empty ; on jump dans empty pour return null
    inc dil ; s++, increment rdi
    jmp loop ; jump
empty:
    ret ; return rax
finishing:
    mov rax, rdi ;move rax dans rdi
    ret
