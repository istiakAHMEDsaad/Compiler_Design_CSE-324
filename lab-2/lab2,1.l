%option noyywrap
%{
	#include<stdio.h>
	int i=0;
%}
%%
([A-Za-z0-9])* {i++;}
"\n" {printf("Total Number of Word: %d\n", i); 
     i=0; }
%%
int main()
{
    yylex();
	return 0;
}