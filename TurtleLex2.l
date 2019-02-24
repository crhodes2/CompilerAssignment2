
%{

/* Turtle Compiler lex file
   by Pete Myers
   and Christian Rhodes
   OIT Portland Fall 2008
   Flex C++ version Jan 2017

   Assignment 1 Handout
*/

#include <stdio.h>
#include <stdlib.h>
#include "TurtleYacc.h"

void PrintKeyword(const char * lexeme);
void PrintIdentifier(const char * lexeme);
void PrintNumber(const char * lexeme);
void PrintIllegal(const char * lexeme);

%}

%option noyywrap

%%

"-"?[0-9]+	{ return NUMBER; }
"+"			{ return yytext[0]; }
"-"			{ return yytext[0]; }


home		{ return HOME; }
fd			{ return FD; }


\n			{ yylineno++; }
.			{  }

%%

void PrintKeyword(const char * lexeme)
{
	printf("Keyword: %s\n", lexeme);
}

void PrintIdentifier(const char * lexeme)
{
	printf("Id: %s\n", lexeme);
}

void PrintNumber(const char * lexeme)
{
	printf("Number: %s\n", lexeme);
}

void PrintIllegal(const char * lexeme)
{
	printf("Illegal: %s\n", lexeme);
}

void yyerror(const char * msg)
{
	fprintf(stderr, "ERROR! Line #%d: %s at %s\n", yylineno, msg, yytext);
}

