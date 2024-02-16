%option noyywrap
%{
	#include<stdio.h>
        int countup;
        int countlow;
        int countspecial;
        int c_int, c_float, c_exp;
 
%}
digit [0-9]
upcase [A-Z]
lowcase [a-z]
spchar "!"|"@"|"#"|"$"|"%"|"^"|"&"|"*"|"?"
 
%%

{upcase}   {printf("%s is a uppercase letter\n",yytext); countup++;}
{lowcase}  {printf("%s is a lowercase letter\n",yytext); countlow++;}
{spchar}   {printf("%s is a special character\n",yytext); countspecial++;}
{digit}+ {printf("%s is an int number\n",yytext); c_int++;}
{digit}+"."{digit}+ {printf("%s is a floating point number\n",yytext); c_float++;}
{digit}+("."{digit}+)?("E+"|"E-"|"E"){digit}+ {printf("%s is a floating point number.\n",yytext); c_exp++;}
.          {printf("Invalid Token\n");}
 
%%
int main()
{
        yylex();
 
        printf("Total uppercase letter: %d\n",countup);
	printf("Total lowercase letter: %d\n",countlow);
	printf("Total special characters: %d\n",countspecial);
 
	getchar();
	return 0;
}