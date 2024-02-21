%{
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
int ch = 0;
int word = 0;
int space = 0;
int line = 0;
int others = 0;
%}
%option noyywrap
%%
[a-zA-Z_] {
    ch++;
    printf("Token: Character, Value: %s\n", yytext);
}
[a-zA-Z_][a-zA-Z0-9_]* {
    word++;
    printf("Token: Word, Value: %s\n", yytext);
}
" " {
    space++;
    printf("Token: Space, Value: %s\n", yytext);
}
"\n" {
    line++;
    printf("Token: New line, Value: %s\n", yytext);
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

    printf("\nTotal words: %d\n", word);
    printf("Total characters: %d\n", ch);
    printf("Total spaces: %d\n", space);
    printf("Total lines: %d\n", line);
    printf("Total other tokens: %d\n", others);
    return 0;
}