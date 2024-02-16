calc: calc.tab.c calc.tab.h lex.yy.c
	gcc -o $@ calc.tab.c lex.yy.c -lfl

calc.tab.c calc.tab.h: calc.y
	bison -d $<

lex.yy.c: calc.lex
	flex $<

