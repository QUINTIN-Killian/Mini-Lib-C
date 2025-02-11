##
## EPITECH PROJECT, 2025
## MiniLibC
## File description:
## Makefile
##

SRC	=	src/strlen.asm	\
		src/strchr.asm	\
		src/strrchr.asm	\
		src/memset.asm	\
		src/memcpy.asm	\
		src/strcmp.asm	\

OBJ	=	$(SRC:src/%.asm=bin/%.o)

LIB_NAME	=	libasm.so

all:	$(LIB_NAME)

$(LIB_NAME):	$(OBJ)
	ld -shared -o $(LIB_NAME) $(OBJ)

bin/%.o:	src/%.asm
	@mkdir -p bin
	nasm -f elf64 $< -o $@

clean:
	rm -rf bin

fclean:	clean
	rm -f $(LIB_NAME)

re:	fclean all

.PHONY:	all compile_lib clean fclean re
