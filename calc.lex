%{
#include "calc.tab.h"
%}

%%
"+"      { return ADD;  }
"-"      { return SUB;  }
"*"      { return MUL; }
"/"      { return DIV; }
"|"      { return ABS; }
"("      { return OP; }
")"      { return CP; }
[0-9]+   { yylval = atoi(yytext); return NUMBER;}
"\n"     { return EOL; }
[ \t]    { /* Ignore whitespaces  */ }
"//".*   { /* Ignore comments  */ }
.        { printf("Mystery character %c\n", *yytext); }
%%

