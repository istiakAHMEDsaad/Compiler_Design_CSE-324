%{
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
int comments = 0;
%}

%option noyywrap

%%
"/""*"(.|\n)*"*""/" {
  // Multi-line comment
  printf("Token: Multi-line comment, Value: %s\n", yytext);
  comments++;
}

"//".* {
  // Single-line comment
  printf("Token: Single line comment, Value: %s\n", yytext);
  comments++;
}

%%

int main() {
  FILE *file = fopen("sample.c", "r");
  if (!file) {
    fprintf(stderr, "Error opening file\n");
    return 1;
  }

  yyin = file;
  yylex();

  fclose(file);

  printf("\nTotal comments: %d\n", comments);
  return 0;
}