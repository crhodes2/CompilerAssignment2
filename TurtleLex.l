
%{

/* Turtle Compiler lex file
   by Pete Myers
   OIT Portland Fall 2008
   Flex C++ version Jan 2017

   Assignment 2 Handout
*/

#include <stdio.h>
#include <stdlib.h>
#include "TurtleYacc.h"

%}

%option noyywrap

%%

"-"?[0-9]+	{ return NUMBER; }

"+"			{ return yytext[0]; }
"-"			{ return yytext[0]; }
"*"			{ return yytext[0]; }
"/"			{ return yytext[0]; }

"("			{ return yytext[0]; }
")"			{ return yytext[0]; }
"["			{ return yytext[0]; }
"]"			{ return yytext[0]; }

"="			{ return yytext[0]; }
"<"			{ return yytext[0]; }
">"			{ return yytext[0]; }

if			{ return IF; }
ifelse		{ return IFELSE; }
repeat		{ return REPEAT; }
int			{ return INT; }
home		{ return HOME; }


fd			{ return FD; }


.			{ }
\n			{ yylineno++; }

%%

void yyerror(const char * msg)
{
	fprintf(stderr, "ERROR! Line #%d: %s at %s\n", yylineno, msg, yytext);
}

