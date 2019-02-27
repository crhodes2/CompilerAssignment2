%{

/* Turtle Compiler yacc file
   by Pete Myers and Christian Rhodes
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
%token BK
%token LT
%token RT
%token PD
%token PU
%token SETC

%token NUMBER
%token COLORNAME
%token IF
%token IFELSE
%token XCOR
%token YCOR
%token COLOR

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
	|	BK expression													{ printf("statement->BK expression\n"); }
	|	LT expression													{ printf("statement->LT expression\n"); }
	|	RT expression													{ printf("statement->RT expression\n"); }
	|	PD expression													{ printf("statement->PD expression\n"); }
	|	PU expression													{ printf("statement->PU expression\n"); }
	|	SETC expression													{ printf("statement->SETC expression\n"); }
	|	IF'(' condition ')' '[' statements ']'							{ printf("statement->if ( condition ) [ statements ]\n"); }
	|	IFELSE'(' condition ')' '[' statements ']' '[' statements ']'	{ printf("statement->ifelse ( condition ) [ statements ] [ statements ]\n"); }
	|	REPEAT expression '[' statements ']'							{ printf("statement->REPEAT expression [ statements ]\n"); }
	;

expression:	expression '+' expression	{ printf("expression->expression + expression\n"); }
	|	expression '-' expression		{ printf("expression->expression - expression\n"); }
	|	expression '*' expression		{ printf("expression->expression * expression\n"); }
	|	expression '/' expression		{ printf("expression->expression / expression\n"); }
	|	'(' expression	')'				{ printf("expression->( expression )\n"); }
	|	NUMBER							{ printf("expression->NUMBER\n"); }
	|	function						{ printf("expression->function\n"); }
	|	COLORNAME						{ printf("expression->COLORNAME\n"); }
	;

condition:	expression '=' expression	{ printf("condition->expression = expression\n"); }
	|	expression '>' expression		{ printf("condition->expression > expression\n"); }
	|	expression '<' expression		{ printf("condition->expression < expression\n"); }
	;

function: COLOR							{ printf("function->COLOR\n"); }
	| XCOR								{ printf("function->XCOR\n"); }
	| YCOR								{ printf("function->YCOR\n"); }
	;

%%
