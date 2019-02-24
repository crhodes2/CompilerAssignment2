%{

/* Turtle Compiler yacc file
   by Pete Myers
   OIT Portland Fall 2008
   Bison C++ version Jan 2017

   Assignment 2 Handout
*/

#include <stdio.h>
#include <stdlib.h>

extern FILE * yyin;
extern FILE * yyout;
extern int yylineno;
void yyerror(const char *);

int yylex(void);

%}

%token HOME
%token FD
%token NUMBER

%token IF
%token IFELSE
%token REPEAT
%token INT


%left '+' '-'
%left '*' '/'


%%

statements:	statement statements		{ printf("statements->statement statements\n"); }
	|									{ printf("statements-><empty>\n"); }
	;

statement:	HOME														{ printf("statement->HOME\n"); }
	|	FD expression													{ printf("statement->FD expression\n"); }
	|	IF'(' condition ')' '[' statements ']'							{ printf("statement->if ( condition ) [ statements ]\n"); }
	;

expression:	expression '+' expression	{ printf("expression->expression + expression\n"); }
	|	expression '-' expression		{ printf("expression->expression - expression\n"); }
	|	expression '*' expression		{ printf("expression->expression * expression\n"); }
	|	expression '/' expression		{ printf("expression->expression / expression\n"); }
	|	'(' expression	')'				{ printf("expression->( expression )\n"); }
	|	NUMBER							{ printf("expression->NUMBER\n"); }
	;

condition:	expression '=' expression	{ printf("condition->expression = expression\n"); }
	|	expression '>' expression		{ printf("condition->expression > expression\n"); }
	|	expression '<' expression		{ printf("condition->expression < expression\n"); }
	;


%%
