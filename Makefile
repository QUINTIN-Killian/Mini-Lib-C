##
## EPITECH PROJECT, 2025
## MiniLibC
## File description:
## Makefile
##

SRC	=	strlen.asm

LIB_NAME	=	libasm.so

all:	$(LIB_NAME)

$(LIB_NAME):	$(SRC)
	nasm -f elf64 $(SRC)
	ld -shared -o $(LIB_NAME) *.o

clean:
	rm -f *.o

fclean:	clean
	rm -f $(LIB_NAME)

re:	fclean all

.PHONY:	all compile_lib clean fclean re
