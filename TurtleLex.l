
%{

/* Turtle Compiler lex file
   by Pete Myers and Christian Rhodes
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
black		{ return COLORNAME; }
white		{ return COLORNAME; }
orange		{ return COLORNAME; }
red			{ return COLORNAME; }
yellow		{ return COLORNAME; }

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
bk			{ return BK; }
rt			{ return RT; }
lt			{ return LT; }
pd			{ return PD; }
pu			{ return PU; }
setc		{ return SETC; }

color		{ return COLOR; }
xcor		{ return XCOR; }
ycor		{ return YCOR; }

.			{ }
\n			{ yylineno++; }

%%

void yyerror(const char * msg)
{
	fprintf(stderr, "ERROR! Line #%d: %s at %s\n", yylineno, msg, yytext);
}

