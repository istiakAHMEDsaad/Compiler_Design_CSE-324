%{
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

int key = 0;
int id = 0;
int others = 0;

bool isKeyword(char* str);
%}

%option noyywrap

%%

"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"include"|"stdio.h"|"conio.h"|"printf"|"scanf" {
  printf("Token: Keyword, Value: %s\n", yytext);
  key++;
}

[a-zA-Z_][a-zA-Z0-9_]* {
  if (isKeyword(yytext)) {
    printf("Token: Keyword, Value: %s\n", yytext);
    key++;
  } else {
    printf("Token: Identifier, Value: %s\n", yytext);
    id++;
  }
}

. {
  printf("Token: Other, Value: %s\n", yytext);
  others++;
}

%%

bool isKeyword(char* str) {
  const char* keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do",
    "double", "else", "enum", "extern", "float", "for", "goto", "if",
    "int", "long", "register", "return", "short", "signed", "sizeof", "static",
    "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while", "stdio.h", "conio.h", "printf", "scanf", "include"
  };
  for (int i = 0; i < sizeof(keywords) / sizeof(keywords[0]); i++) {
    if (strcmp(str, keywords[i]) == 0) {
      return true;
    }
  }
  return false;
}

int main() {
  FILE *file = fopen("sample.txt", "r");
  if (!file) {
    fprintf(stderr, "Error opening file\n");
    return 1;
  }

  yyin = file;
  yylex();

  fclose(file);

  printf("\nTotal keywords: %d\n", key);
  printf("Total identifiers: %d\n", id);
  printf("Total other tokens: %d\n", others);
  return 0;
}