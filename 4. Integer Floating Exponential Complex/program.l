%{
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

int in = 0;
int flt = 0;
int expp = 0;
int complex = 0;
int others = 0;
%}

%option noyywrap

%%

[+-]?[0-9]+ {
    in++;
    printf("Token: integer, Value: %s\n", yytext);
}

[+-]?[0-9]*"."[0-9]+ {
    flt++;
    printf("Token: float number, Value: %s\n", yytext);
}

[+-]?[0-9]+[Ee][+-]?[0-9]+ {
    expp++;
    printf("Token: exponential, Value: %s\n", yytext);
}

[+-]?[0-9]*+[+-]?[1-9]+[iIjJ] { 
    complex++;
    printf("Token: complex number, Value: %s\n", yytext);
}

. {
    printf("Token: Other, Value: %s\n", yytext);
    others++;
}

%%

int main() {
    FILE *file = fopen("sample.txt", "r");
    if (!file) {
        fprintf(stderr, "Error opening file\n");
        return 1;
    }

    yyin = file;
    yylex();

    fclose(file);

    printf("\nTotal integers: %d\n", in);
    printf("Total floats: %d\n", flt);
    printf("Total exponentials: %d\n", expp);
    printf("Total complex numbers: %d\n", complex);
    printf("Total other tokens: %d\n", others);

    return 0;
}