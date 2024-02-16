%option noyywrap
%{
 #include<stdio.h>
 int c_int, c_float, c_exp, c_id, c_key;
%}
key "int"|"main"|"return"|"for"|"while"|"do"|"if"|"else"|"printf"|"scanf"
digit [0-9]
letter [A-Za-z_]
%%
{key} {printf("%s is a keyword\n",yytext); c_key++;}
{letter}({letter}|{digit})* {printf("%s is an identifier\n",yytext); c_id++;}
{digit}+ {printf("%s is an int number\n",yytext); c_int++;}
{digit}+"."{digit}+ {printf("%s is a floating point number\n",yytext); c_float++;}
{digit}+("."{digit}+)?("E+"|"E-"|"E"){digit}+ {printf("%s is a floating point number.\n",yytext); c_exp++;}
. {printf("Invalid Token\n");}
%%
int main ()
{
yylex();
printf("Total number of keyword: %d\n",c_key);
printf("Total number of identifier: %d\n",c_id);
printf("Total number of int number: %d\n",c_int);
printf("Total number of floating point number: %d\n",c_float);
printf("Total number of exponential number: %d\n",c_exp);

return 0;
}


/*
lex (name.l)
gcc lex.yy.c
./a.out
*/