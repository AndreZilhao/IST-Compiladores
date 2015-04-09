/* main.cc */

#include "header.h"

// prototype of bison-generated parser function
int yyparse();
int errorsL;
int errorsS;

int main(int argc, char **argv)
{
	cout << "Compiling...\n";
	errorsS = 0;
	errorsL = 0;
    assert(argc == 1);
    yyparse();
	if(!(errorsL || errorsS)){
		cout << "Compiled without errors!\n";
	} else {
		    if(errorsS){
				cout << "Number of Syntax errors: " << errorsS << "\n";
			}
			if(errorsL){
    			cout << "Number of Lexical errors: " << errorsL << "\n";
			}
	}
    return 0;
}

