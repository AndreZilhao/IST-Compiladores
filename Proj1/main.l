%{
#include<iostream>
#include<string>
using namespace std;

#ifdef DEBUG
	#define trace(x) { cout << x << endl; }
#else
	#define trace(x);
#endif

int lineno = 1;
int errosno = 0;

void yyerror(string s, int line);

void yyerror(char * s, int line);

%}

digit							[0-9]
integer							{digit}+

letter							[a-zA-Z_]
indentifier						{letter}({letter}|{digit})*

%s comment

%%

	/* Operadores Basicos */
"&&"							{ trace("&&"); }
"<"								{ trace("<"); }
"+"								{ trace("+"); }
"-"								{ trace("-"); }
"*"								{ trace("*"); }
"!"								{ trace("!"); }
"="								{ trace("="); }

	/* Operadores de Precedencia e outros */
"("								{ trace("("); }
")"								{ trace(")"); }
";"								{ trace(";"); }
"["								{ trace("["); }
"]"								{ trace("]"); }
"{"								{ trace("{"); }
"}"								{ trace("}"); }
","								{ trace(","); }
"."								{ trace("."); }

	/* Palavras Reservadas */
"class"							{ trace("class"); }
"public"						{ trace("public"); }
"static"						{ trace("static"); }
"void"							{ trace("void"); }
"main"							{ trace("main"); }
"String"						{ trace("String"); }
"extends"						{ trace("extends"); }
"return"						{ trace("return"); }
"int"							{ trace("int"); }
"boolean"						{ trace("boolean"); }
"if"							{ trace("if"); }
"else"							{ trace("else"); }
"while"							{ trace("while"); }
"System"						{ trace("System"); }
"out"							{ trace("out"); }
"println"						{ trace("println"); }
"Readers"						{ trace("Readers"); }
"IntReader"						{ trace("IntReader"); }
"readInt"						{ trace("readInt"); }
"true"							{ trace("true"); }
"false"							{ trace("false"); }
"this"							{ trace("this"); }
"new"							{ trace("new"); }
"lenght"						{ trace("lenght"); }

	/* Comentarios */
"//".*							{ trace("//"); }

"/*"        				    { trace("Begin Comment"); BEGIN(comment); }
<comment>[^*\n]*				{}
<comment>"*"+[^*/\n]*			{}
<comment>[\r\n]					{ trace("Line count"); ++lineno; }
<comment>"*/"					{ trace("End Comment"); BEGIN(INITIAL); }

	/* Identificadores e Inteiros */
{indentifier}					{ trace("ID\t" + string(yytext)); }
{integer}						{ trace("INT"); }

	/* Contagem de Linhas */
[\r\n]							{ ++lineno; }
[ \t]							{}

	/* Detecao de Erros */
.								{ yyerror(yytext, lineno); errosno++;}

%%


void yyerror(string token, int line) {
	cout << "Unrecognized token \"" << token << "\" in line: " << line << endl;
}

void yyerror(char * s, int line) {
	yyerror(string(s), line);
}


int main (int argc, char *argv[]) {
	yylex();
	trace(lineno);
	cout << "Number of lexical errors: " << errosno << endl;
	return 0;
}
