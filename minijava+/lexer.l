%{
#include<iostream>
#include<string>
#include "parser.tab.h"
#include "header.h"
using namespace std;

#ifdef DEBUG
	#define trace(x) { cout << x << endl; }
#else
	#define trace(x);
#endif

int lineno = 1;
extern int errorsL;

void yyerror(string s, int line);

void yyerror(char * s, int line);

%}

digit							[0-9]
integer							{digit}+

letter							[a-zA-Z_]
indentifier						{letter}({letter}|{digit})*

%s comment
%option nounput
%option yylineno

%%

	/* Operadores Basicos */
"&&"							{ trace("&&"); return AND;}
"<"								{ trace("<"); return LESSTHAN;}
"+"								{ trace("+"); return ADD;}
"-"								{ trace("-"); return SUB;}
"*"								{ trace("*"); return MULT;}
"!"								{ trace("!"); return NEG;}
"="								{ trace("="); return EQUALS;}

	/* Operadores de Precedencia e outros */
"("								{ trace("("); return *yytext;}
")"								{ trace(")"); return *yytext;}
";"								{ trace(";"); return *yytext;}
"["								{ trace("["); return *yytext;}
"]"								{ trace("]"); return *yytext;}
"{"								{ trace("{"); return *yytext;}
"}"								{ trace("}"); return *yytext;}
","								{ trace(","); return *yytext;}
"."								{ trace("."); return *yytext;}

	/* Palavras Reservadas */
"class"							{ trace("class"); return CLASS;}
"public"						{ trace("public"); return PUBLIC;}
"static"						{ trace("static"); return STATIC;}
"void"							{ trace("void"); return VOID;}
"main"							{ trace("main"); return MAIN;}
"String"						{ trace("String"); return STRING;}
"extends"						{ trace("extends"); return EXTENDS;}
"return"						{ trace("return"); return RETURN;}
"int"							{ trace("int"); return INT;}
"boolean"						{ trace("boolean"); return BOOOL;}
"if"							{ trace("if"); return IF;}
"else"							{ trace("else"); return ELSE;}
"while"							{ trace("while"); return WHILE;}
"System"						{ trace("System"); return SYSTEM;}
"out"							{ trace("out"); return OUT;}
"println"						{ trace("println"); return PRINTLN;}
"Readers"						{ trace("Readers"); return READERS;}
"IntReader"						{ trace("IntReader"); return INTREADER;}
"readInt"						{ trace("readInt"); return READINT;}
"true"							{ trace("true"); return TRUE;}
"false"							{ trace("false"); return FALSE;}
"this"							{ trace("this"); return THIS;}
"new"							{ trace("new"); return NEW;}
"lenght"						{ trace("lenght"); return LENGTH;}

	/* Comentarios */
"//".*							{ trace("//"); }

"/*"        				    { trace("Begin Comment"); BEGIN(comment); }
<comment>[^*\n]*				{}
<comment>"*"+[^*/\n]*			{}
<comment>[\r\n]					{ trace("Line count"); ++lineno; }
<comment>"*/"					{ trace("End Comment"); BEGIN(INITIAL); }

	/* Identificadores e Inteiros */
{indentifier}					{ trace("ID\t" + string(yytext)); return ID; }
{integer}						{ trace("INT"); return INTVAL;}

	/* Contagem de Linhas */
[\r\n]							{ ++lineno; }
[ \t]							{}

	/* Detecao de Erros */
.								{ yyerror(yytext, lineno); errorsL++;}

%%


void yyerror(string token, int line) {
	cout << "Unrecognized token \"" << token << "\" in line: " << line << endl;
}

void yyerror(char * s, int line) {
	yyerror(string(s), line);
}