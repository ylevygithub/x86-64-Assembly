##
## EPITECH PROJECT, 2020
## make
## File description:
## make
##

NAME	=	libasm.so

SRC	=	strlen.asm \
		strcmp.asm \
		strncmp.asm \
		memset.asm \
		strchr.asm \
		rindex.asm \
		memcpy.asm \
		memmove.asm \
		strcasecmp.asm

OBJ	=	$(SRC:.asm=.o)

%.o: %.asm
	nasm -f elf64 $< -o $@

all: $(NAME)

$(NAME): $(OBJ)
	ld -shared -o $(NAME) $(OBJ)
	rm -f $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
# gcc -lasm -L. main.c
