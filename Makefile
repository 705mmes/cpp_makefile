# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sammeuss <sammeuss@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/08 15:09:53 by sammeuss          #+#    #+#              #
#    Updated: 2023/11/08 16:04:40 by sammeuss         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#     ███▄ ▄███▓ ▄▄▄       ██ ▄█▀▓█████   █████▒██▓ ██▓    ▓█████ 
#    ▓██▒▀█▀ ██▒▒████▄     ██▄█▒ ▓█   ▀ ▓██   ▒▓██▒▓██▒    ▓█   ▀ 
#    ▓██    ▓██░▒██  ▀█▄  ▓███▄░ ▒███   ▒████ ░▒██▒▒██░    ▒███   
#    ▒██    ▒██ ░██▄▄▄▄██ ▓██ █▄ ▒▓█  ▄ ░▓█▒  ░░██░▒██░    ▒▓█  ▄ 
#    ▒██▒   ░██▒ ▓█   ▓██▒▒██▒ █▄░▒████▒░▒█░   ░██░░██████▒░▒████▒
#    ░ ▒░   ░  ░ ▒▒   ▓▒█░▒ ▒▒ ▓▒░░ ▒░ ░ ▒ ░   ░▓  ░ ▒░▓  ░░░ ▒░ ░
#    ░  ░      ░  ▒   ▒▒ ░░ ░▒ ▒░ ░ ░  ░ ░      ▒ ░░ ░ ▒  ░ ░ ░  ░
#    ░      ░     ░   ▒   ░ ░░ ░    ░    ░ ░    ▒ ░  ░ ░      ░   
#           ░         ░  ░░  ░      ░  ░        ░      ░  ░   ░  ░
                                                            
NAME        =	
PRINT_NAME  =	
PRINT_PREFIX= \033[1m\033[38;5;240m[\033[0m\033[38;5;250m$(PRINT_NAME)\033[1m\033[38;5;240m] \033[38;5;105m~\033[0m

SRC = main	\

CC = c++
CFLAGS = -Wall -Werror -Wextra -std=c++98

SRCS        = $(addsuffix .cpp, $(SRC))
OBJS        = $(SRCS:%.cpp=$(OBJ_DIR)/%.o)
OBJ_DIR 	= obj/

NUM_FILES   = $(words $(SRCS))
BAR_LENGTH  = $(shell echo "$$(($(NUM_FILES)*2))")

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJS)
		@printf "$(PRINT_PREFIX)\033[0;38;5;226m Compiling \033[0m["
		@for i in $(shell seq 1 $(BAR_LENGTH)); do \
			sleep 0.1; \
			printf "\033[38;5;40m█"; \
		done
		@printf "\033[38;5;40m] \033[0m\n"
		@$(CC) $(CFLAGS) $(OBJS) -o $(NAME)
		@echo "$(PRINT_PREFIX)\033[0;32m Done \033[0;32m\n"

$(OBJ_DIR):
	@mkdir -p obj
	
$(OBJ_DIR)/%.o: %.cpp
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
		@echo "$(PRINT_PREFIX)\033[0;38;5;226m Cleaning \033[0m\n"
		@rm -rf $(OBJ_DIR)
		@echo "$(PRINT_PREFIX)\033[0;32m Done \033[0;32m\n"

fclean: clean
		@rm -f $(NAME)

re: fclean all

run: all clean
	./$(NAME)

.PHONY: all clean fclean re