

lexer: lex.yy.c
	g++ -o lexer lex.yy.c -lfl

debug: lex.yy.c
	g++ -D DEBUG=1 -o lexer lex.yy.c -lfl

lex.yy.c: main.l
	flex main.l

clean:
	rm -f lex.yy.c lexer
