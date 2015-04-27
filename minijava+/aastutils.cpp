
#include "astutils.hpp"


extern int yylineno;

static bool varsok = true;

static ASTNode* troot = NULL;

static SymbolTable* stab = NULL;


void ASTUtils::init_ast_utils(SymbolTable &st) {
	stab = st;
}

bool ASTUtils::get_varsok() {
	return varsok;
}

ASTNode * ASTUtils::get_root_node() {
	return troot;
}

void ASTUtils::set_root_node(ASTNode* rn) {
	troot = rn;
}

void ASTUtils::push_scope() {
	assert(stab != NULL);
	stab->push_scope();
}

void ASTUtils::pop_scope() {
	assert(stab != NULL);
	stab->pop_scope();
}


ASTNode * ASTUtils::mk_tree_root(ASTNode * mainClassNode, ASTNode * classNode) {
	assert(mainClassNode != NULL);
	if (classNode != NULL) {
		set_root_node(mainClassNode);
		return mainClassNode;
	}
	ASTNode * root = new ASTRootNode(mainClassNode, classNode);
	return root;
}

ASTNode * ASTUtils::mk_main_node(string id, string argsId, ASTNode * statements) {

}


ASTNode * ASTUtils::mk_class_decl_node($2, $4, $5, $7) {

}

ASTNode * ASTUtils::mk_var_decl_list_node($1,$2) {

}

ASTNode * ASTUtils::mk_var_decl_node($1,$2) {

}

ASTNode * ASTUtils::mk_method_decl_node($2, $3, $5, $8, $9, $11, $14) {

}

ASTNode * ASTUtils::mk_formal_list_node($1,$2,$3)  {

}

ASTNode * ASTUtils::mk_formal_rest_node($2,$3,$4) {

}

ASTNode * ASTUtils::mk_array_type_node() {

}

ASTNode * ASTUtils::mk_bool_type_node() {

}

ASTNode * ASTUtils::mk_int_type_node() {

}

ASTNode * ASTUtils::mk_class_type_node() {

}

ASTNode * ASTUtils::mk_stmt_list_node($1, $2) {

}

ASTNode * ASTUtils::mk_print_node($7) {

}

ASTNode * ASTUtils::mk_assign_node($1, $3) {

}

ASTNode * ASTUtils::mk_array_assign_node($1, $3, $6) {

}

ASTNode * ASTUtils::mk_if_node($3, $5, $7) {

}

ASTNode * ASTUtils::mk_while_node($3, $5) {

}

ASTNode * ASTUtils::mk_and_expr_node($1, $3) {

}

ASTNode * ASTUtils::mk_lt_expr_node($1, $3) {

}

ASTNode * ASTUtils::mk_add_node($1, $3) {

}

ASTNode * ASTUtils::mk_sub_node($1, $3) {

}

ASTNode * ASTUtils::mk_mul_node($1, $3) {

}

ASTNode * ASTUtils::mk_int_val_node($1) {

}

ASTNode * ASTUtils::mk_true_node() {

}

ASTNode * ASTUtils::mk_false_node() {

}

ASTNode * ASTUtils::get_id_node($1) {

}

ASTNode * ASTUtils::mk_this_node() {

}

ASTNode * ASTUtils::mk_read_int_node() {

}

ASTNode * ASTUtils::mk_new_int_array_node($4) {

}

ASTNode * ASTUtils::mk_new_object($2) {

}

ASTNode * ASTUtils::mk_not_expr_node($2) {

}

ASTNode * ASTUtils::mk_length_expr_node($1, $3) {

}

ASTNode * ASTUtils::mk_array_index_expr_node($1, $3) {

}

ASTNode * ASTUtils::mk_function_call_node($1, $3, $5) {

}

ASTNode * ASTUtils::mk_expr_list_node($1, $2) {

}

ASTNode * ASTUtils::mk_expr_rest_node($2, $3) {

}

