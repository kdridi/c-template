DOCKER		=	docker run --name watch --rm -it -v $(shell pwd):/mnt -w /mnt

CC		=	gcc
CPPFLAGS	=	
CFLAGS		=	-W -Wall -Wextra -Werror
LDFLAGS		=	-lcriterion

SRC		=	$(wildcard src/*.c)
OBJ		=	$(SRC:.c=.o)

NAME		=	__TEMPLATE_NAME__
TARGET		=	./$(NAME).exe

all		:	$(TARGET)

test		:	all
			clear
			$(TARGET)

$(TARGET)	:	$(OBJ)
			$(CC) -o $@ $^ $(LDFLAGS)

clean		:
			$(RM) $(OBJ)

fclean		:	clean
			$(RM) $(TARGET)

re		:	fclean all

docker		:
			docker build -t __TEMPLATE_USER__/$(NAME) .

watch		:	docker
			$(DOCKER) __TEMPLATE_USER__/$(NAME) make test

.PHONY		:	all test clean fclean re docker watch
