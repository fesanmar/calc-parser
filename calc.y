%{
#include <stdio.h>

int yylex();
int yyerror(char *s);
%}
%token OP CP
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist:                  /* nothing */
 | calclist EOL 	   /* Empty lines or comment */
 | calclist exp EOL { printf("= %d\n", $2); }
 ;
exp: factor
 | exp ADD factor   { $$ = $1 + $3; }
 | exp SUB factor   { $$ = $1 - $3; }
 ; 
factor: term
 | factor MUL term  { $$ = $1 * $3; }
 | factor DIV term  { $$ = $1 / $3; }
 ;
term: NUMBER
 | ABS term ABS     { $$ = $2 >= 0 ? $2 : - $2; }
 | OP SUB NUMBER CP { $$ = - $3; }
 | OP exp CP        { $$ = $2; }
 ;

%%

int main(int argc, char **argv)
{
  yyparse();
}

int yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}

