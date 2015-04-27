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
Program:	MainClass ClassDecl									 {$$ = mk_tree_root($1, $2); }
	;

MainClass:	CLASS ID '{' PUBLIC STATIC VOID MAIN '(' STRING '[' ']' ID ')' '{' Statements '}' '}'    {$$ = mk_main_node($2,$12,$15); }
	;
_vre
ClassDecl: 	CLASS ID '{' VarDecl MethodDecl '}' ClassDecl 						 {$$ = mk_class_decl_node($2, $4, $5, $7); }
	|	CLASS ID EXTENDS ID '{' VarDecl MethodDecl '}' ClassDecl 
	|												 {$$ = NULL;}							     ;

VarDecl:	VarDecl VarDeclAux 									 {$$ = mk_var_decl_list_node($1,$2); }
	|	VarDecl error ';' 
	|												 {$$ = NULL;}
	;

VarDeclAux:	Type ID ';'										 {$$ = mk_var_decl_node($1,$2); }
	;

MethodDecl:     PUBLIC Type ID '(' FormalList ')' '{' VarDecl Statements RETURN Exp ';' '}' MethodDecl	 {$$ = mk_method_decl_node($2, $3, $5, $8, $9, $11, $14); }
	|												 {$$ = NULL;}			
	;

FormalList: 	Type ID FormalRest									 {$$ = mk_formal_list_node($1,$2,$3); }		
	|												 {$$ = NULL; }
	;

FormalRest: 	',' Type ID FormalRest									 {$$ = mk_formal_rest_node($2,$3,$4); }
	|												 {$$ = NULL; }
	;

Type:		INT '[' ']'										 {$$ =  mk_array_type_node(); }
	|	BOOOL											 {$$ =  mk_bool_type_node(); }
	|	INT											 {$$ =  mk_int_type_node(); }
	|	ID											 {$$ =  mk_class_type_node(); }

Statements:	Statement Statements									 {$$ = mk_stmt_list_node($1, $2); }
	|												 {$$ = NULL;}	
	;

Statement: 	SYSTEM '.' OUT '.' PRINTLN '(' Exp ')' ';'						 {$$ = mk_print_node($7); }
	|	ID EQUALS Exp ';'									 {$$ = mk_assign_node($1, $3); }
	|	ID '[' Exp ']' EQUALS Exp ';' 								 {$$ = mk_array_assign_node($1, $3, $6); }
	|	IF '(' Exp ')' Statement ELSE Statement							 {$$ = mk_if_node($3, $5, $7); }
	|	WHILE '(' Exp ')' Statement 								 {$$ = mk_while_node($3, $5); }
	|	'{' Statements '}'									 {$$ = $2; }
	;

Exp: 		Exp AND Exp										 {$$ = mk_and_expr_node($1, $3); }
	|	Exp LESSTHAN Exp									 {$$ = mk_lt_expr_node($1, $3); }
	|	Exp ADD	Exp										 {$$ = mk_add_node($1, $3); }
	|	Exp SUB Exp										 {$$ = mk_sub_node($1, $3); }
	|	Exp MULT Exp										 {$$ = mk_mul_node($1, $3); }
	| 	INTVAL											 {$$ = mk_int_val_node($1); }
	|	TRUE											 {$$ = mk_true_node(); }
	|	FALSE											 {$$ = mk_false_node(); }
	|	ID											 {$$ = get_id_node($1); }
	|	THIS											 {$$ = mk_this_node(); }
	|	READERS '.' INTREADER '.' READINT '(' ')'						 {$$ = mk_read_int_node(); }
	|	NEW INT '[' Exp ']'									 {$$ = mk_new_int_array_node($4); }
	|	NEW ID '(' ')'										 {$$ = mk_new_object($2); }
	|	'(' Exp ')'										 {$$ = $2; }
	|	NEG Exp 										 {$$ = mk_not_expr_node($2); }
	|	Exp '.' LENGTH 										 {$$ = mk_length_expr_node($1, $3); }
	|	Exp '[' Exp ']'										 {$$ = mk_array_index_expr_node($1, $3); }
	|	Exp '.' ID '(' ExpList ')'								 {$$ = mk_function_call_node($1, $3, $5); }
	|	error ';'										 		
	;

ExpList:	Exp ExpRest										 {$$ = mk_expr_list_node($1, $2); }		
	|												 {$$ = NULL; }
	;

ExpRest:	',' Exp ExpRest										 {$$ = mk_expr_rest_node($2, $3); }
	|												 {$$ = NULL; }	
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
