%option noyywrap
%{
#include<stdio.h>
int cnt_ID,cnt_key,cnt_int,cnt_float,cnt_exp;
%}
key "int"|"main"|"for"|"while"|"else"|"return"|"do"|"printf"|"if"
digit[0-9]
letter[_A-Za-z]
%%
{key} {printf("%s is a keyword\n",yytext);cnt_key++;}
{letter}({letter}|{digit})* {printf("%s is an identifier\n",yytext);cnt_ID++;}
{digit}+ {printf("%s is an int number\n",yytext);cnt_int++;}
{digit}+"."{digit}+ {printf("%s is a float number\n",yytext);cnt_float++;}
{digit}+("."{digit}+)?("E+"|"E-"|"E"){digit}+ {printf("%s is an exponential number\n",yytext);cnt_exp++;}
. {printf("invalid number\n");}

%%
int main()
{
yylex();
printf("Total number of keywords:%d\n",cnt_key);
printf("Total number of identifier:%d\n",cnt_ID);
printf("Total number of integers:%d\n",cnt_int);
printf("Total number of float numbers:%d\n",cnt_float);
printf("Total number of exponential numbers:%d\n",cnt_exp);
return 0;
};