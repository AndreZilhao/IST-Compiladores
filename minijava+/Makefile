# Makefile

OBJS	= main.o parser.tab.o lex.yy.o

CC	= g++
CFLAGS	= -g -Wall -ansi -pedantic -std=gnu++11

mjp:		$(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o mjc -L/opt/local/lib -lfl

parser.tab.o:	parser.tab.c
	$(CC) $(CFLAGS) -c -o parser.tab.o parser.tab.c

parser.tab.c:	parser.y lexer.l
	bison -Wconflicts-sr -d -v parser.y 

lex.yy.o:	lex.yy.c
	$(CC) $(CFLAGS) -c -o lex.yy.o lex.yy.c

lex.yy.c:	lexer.l parser.y
	flex lexer.l

main.o:		main.cc
	$(CC) $(CFLAGS) -c main.cc -o main.o

clean:
	rm -f *.o *~ lex.yy.* parser.tab.* parser.output mjc

test: mjp
	
