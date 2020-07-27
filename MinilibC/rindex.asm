global rindex
; char *rindex(const char *s, int c);
; The rindex() function returns a pointer to the last occurrence of the character c in the string s.
; The rindex() function return a pointer to the matched character or NULL if the character is not found.

rindex:
    xor rax, rax ; set return value to 0
loopinc:
    cmp byte[rdi], 0 ; si rdi[dil] == '\0' (rdi etant le premier param)(dil etant l index de rdi)
    je loopdec ; si la comparaison d au dessus est vrai alors on jump dans loopdec
    inc dil ; autrement on continue a incrementer jusqua la fin de la boucle
    jmp loopinc ; on continue la boucle loopinc
loopdec:
    cmp byte[rdi], sil ; mtnt qu on est en fin de boucle, on compare rdi[dil] avec sil(le second param)
    je finishing ; si la condition est juste alors on jump dans finishing pour return rax
    cmp dil, 0 ; on regarde si on arrive jusqua rdi[0] et si c le cas c qu on a pas trouver l occurence ds la decrementation
    je empty ; si la condition d au dessus est juste alors on jump dans empty pour return null
    dec dil ; si rien d au dessus n est vrai a ce moment la de la boucle alors on continue a decrementer dil
    jmp loopdec ; on continue la boucle de decrementation
finishing:
    cmove rax, rdi ; if (cmp(rdi[dil], silEnChar) == 0) alors on met la partie de la string commencant par rdi[dil] jusqua '\0' dans rax
    ret
empty:
    ret
