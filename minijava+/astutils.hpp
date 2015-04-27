#ifndef _ASTUTILS_H
#define _ASTUTILS_H 1

#include "SymbolTable.hpp"
#include "AST.hpp"

namespace ASTUtils {

	void init_ast_utils(SymbolTable &st);

	bool get_varsok();

	ASTNode * get_root_node();

	void set_root_node(ASTNode* rn);

	void push_scope();

	void pop_scope();

	void set_ast_root(ASTNode *);

	ASTNode * mk_tree_root($1, $2);
	ASTNode * mk_main_node($2,$12,$15);
	ASTNode * mk_class_decl_node($2, $4, $5, $7);
	ASTNode * mk_var_decl_list_node($1,$2);
	ASTNode * mk_var_decl_node($1,$2);
	ASTNode * mk_method_decl_node($2, $3, $5, $8, $9, $11, $14);
	ASTNode * mk_formal_list_node($1,$2,$3) ;
	ASTNode * mk_formal_rest_node($2,$3,$4);
	ASTNode * mk_array_type_node();
	ASTNode * mk_bool_type_node();
	ASTNode * mk_int_type_node();
	ASTNode * mk_class_type_node();
	ASTNode * mk_stmt_list_node($1, $2);
	ASTNode * mk_print_node($7);
	ASTNode * mk_assign_node($1, $3);
	ASTNode * mk_array_assign_node($1, $3, $6);
	ASTNode * mk_if_node($3, $5, $7);
	ASTNode * mk_while_node($3, $5);
	ASTNode * mk_and_expr_node($1, $3);
	ASTNode * mk_lt_expr_node($1, $3);
	ASTNode * mk_add_node($1, $3);
	ASTNode * mk_sub_node($1, $3);
	ASTNode * mk_mul_node($1, $3);
	ASTNode * mk_int_val_node($1);
	ASTNode * mk_true_node();
	ASTNode * mk_false_node();
	ASTNode * get_id_node($1);
	ASTNode * mk_this_node();
	ASTNode * mk_read_int_node();
	ASTNode * mk_new_int_array_node($4);
	ASTNode * mk_new_object($2);
	ASTNode * mk_not_expr_node($2);
	ASTNode * mk_length_expr_node($1, $3);
	ASTNode * mk_array_index_expr_node($1, $3);
	ASTNode * mk_function_call_node($1, $3, $5);
	ASTNode * mk_expr_list_node($1, $2);
	ASTNode * mk_expr_rest_node($2, $3);

}

#endif /* _ASTUTILS_H */