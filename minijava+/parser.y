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
Program:	MainClass ClassDecl									 {$$ =/*mk_tree_root($1, $2);*/}
	;

MainClass:	CLASS ID '{' PUBLIC STATIC VOID MAIN '(' STRING '[' ']' ID ')' '{' Statements '}' '}'    {$$ =/*mk_main_node($2,$12,$15);*/}
	;

ClassDecl: 	CLASS ID '{' VarDecl MethodDecl '}' ClassDecl 						 {$$ =/*mk_class_decl_node($2, $4, $5, $7); */}
	|	CLASS ID EXTENDS ID '{' VarDecl MethodDecl '}' ClassDecl 
	|												 {$$ = NULL;}							     ;

VarDecl:	VarDecl VarDeclAux 									 {$$ =/*mk_var_decl_list_node($1,$2);*/}
	|	VarDecl error ';' 
	|												 {$$ = NULL;}
	;

VarDeclAux:	Type ID ';'										 {$$ =/*mk_var_decl_node($1,$2)*/;}
	;

MethodDecl:     PUBLIC Type ID '(' FormalList ')' '{' VarDecl Statements RETURN Exp ';' '}' MethodDecl	 {$$ =/*mk_method_decl_node($2, $3, $5, $8, $9, $11, $14)*/;}
	|												 {$$ = NULL;}			
	;

FormalList: 	Type ID FormalRest									 {$$ =/*mk_formal_list_node($1,$2,$3};*/}		
	|												 {$$ = NULL;}	
	;

FormalRest: 	',' Type ID FormalRest									 {$$ =/*mk_formal_rest_node($2,$3,$4);*/}
	|												 {$$ = NULL;}	
	;

Type:		INT '[' ']'										 {$$ =/}
	|	BOOOL											 { }
	|	INT											 { }
	|	ID											 { }

Statements:	Statement Statements									 { }
	|												 {$$ = NULL;}	
	;

Statement: 	SYSTEM '.' OUT '.' PRINTLN '(' Exp ')' ';'						 { }
	|	ID EQUALS Exp ';'									 { }
	|	ID '[' Exp ']' EQUALS Exp ';' 								 { }
	|	IF '(' Exp ')' Statement ELSE Statement							 { }
	|	WHILE '(' Exp ')' Statement 								 { }
	|	'{' Statements '}'									 { }
	;

Exp: 		Exp AND Exp										 { }
	|	Exp LESSTHAN Exp									 { }
	|	Exp ADD	Exp										 { }
	|	Exp SUB Exp										 { }
	|	Exp MULT Exp										 { }
	| 	INTVAL											 { }
	|	TRUE											 { }
	|	FALSE											 { }
	|	ID											 { }
	|	THIS											 { }
	|	READERS '.' INTREADER '.' READINT '(' ')'						 { }
	|	NEW INT '[' Exp ']'									 { }
	|	NEW ID '(' ')'										 { }
	|	'(' Exp ')'										 { }
	|	NEG Exp 										 { }
	|	Exp '.' LENGTH 										 { }
	|	Exp '[' Exp ']'										 { }
	|	Exp	'.' ID '(' ExpList ')'								 { }
	|	error ';'										 { }		
	;

ExpList:	Exp ExpRest										 { }		
	|												 {$$ = NULL;}	
	;

ExpRest:	',' Exp ExpRest										 { }
	|												 {$$ = NULL;}	
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
