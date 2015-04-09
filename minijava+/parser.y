%{
#include "header.h"
int yyerror(char const *s);
int yylex(void);
%}

%union{
  int           ival;
  std::string*       vval;
}

%start Program
%token <ival> INTVAL
%token <vval> ID
/*Operadores Basicos*/
%token AND LESSTHAN ADD SUB MULT NEG EQUALS
/*Operadores de Precedencia e outros*/
%token LPAR RPAR SEMICOLON LBRACE RBRACE COLON DOT LBRACKET RBRACKET
/*Palavras Reservadas*/
%token CLASS PUBLIC STATIC VOID MAIN STRING EXTENDS RETURN INT BOOOL IF ELSE
%token WHILE SYSTEM OUT PRINTLN READERS INTREADER READINT TRUE FALSE THIS NEW LENGTH
/*Associacoes e Precedencias*/
%nonassoc EQUALS
%left AND
%left LESSTHAN
%left ADD SUB
%left MULT
%left NEG
%right '.' '['
/*Confirguracoes Bison*/
%define parse.error verbose
%%

/*Definicao da gramatica*/
Program:		MainClass ClassDecl
	;

MainClass:		CLASS ID '{' PUBLIC STATIC VOID MAIN '(' STRING '[' ']' ID ')' '{' Statements '}' '}'
	;

ClassDecl: 		CLASS ID '{' VarDecl MethodDecl '}' ClassDecl
	|			CLASS ID EXTENDS ID '{' VarDecl MethodDecl '}' ClassDecl
	|
	;

VarDecl:		VarDecl VarDeclAux
	|			VarDecl error ';' 
	|			
	;

VarDeclAux:		Type ID ';'
	;

MethodDecl:     PUBLIC Type ID '(' FormalList ')' '{' VarDecl Statements RETURN Exp ';' '}' MethodDecl
	|
	;

FormalList: 	Type ID FormalRest
	|
	;

FormalRest: 	',' Type ID FormalRest
	|
	;

Type:			INT '[' ']'
	|			BOOOL
	|			INT
	|			ID

Statements:		Statement Statements
	|
	;

Statement: 		SYSTEM '.' OUT '.' PRINTLN '(' Exp ')' ';'
	|			ID EQUALS Exp ';'
	|			ID '[' Exp ']' EQUALS Exp ';' 
	|			IF '(' Exp ')' Statement ELSE Statement
	|			WHILE '(' Exp ')' Statement 
	|			'{' Statements '}'
	;

Exp: 			Exp AND Exp
	|			Exp LESSTHAN Exp
	|			Exp ADD	Exp
	|			Exp SUB Exp
	|			Exp MULT Exp
	| 			INTVAL
	|			TRUE
	|			FALSE
	|			ID
	|			THIS
	|			READERS '.' INTREADER '.' READINT '(' ')'
	|			NEW INT '[' Exp ']'
	|			NEW ID '(' ')'
	|			'(' Exp ')'
	|			NEG Exp 
	|			Exp '.' LENGTH 
	|			Exp '[' Exp ']'
	|			Exp	'.' ID '(' ExpList ')'
	|			error ';'
	;

ExpList:		Exp ExpRest
	|
	;

ExpRest:		',' Exp ExpRest
	|
	;
%%

/* --- --- */

int yyerror(string s)
{
  extern int yylineno;  // defined and maintained in lex.yy.c
  extern char *yytext;  // defined and maintained in lex.yy.c
  extern int errorsS; // define in main.cc, used to count the number of syntax errors.
  errorsS++;
  cerr << "ERROR: " << s << " at symbol \"" << yytext;
  cerr << "\" on line " << yylineno << endl;

  return (1);
}

int yyerror(char const *s)
{
  
  return yyerror(string(s));

}
