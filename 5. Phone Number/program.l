/* Global Definition */
%{
	#include<stdio.h>
	int Banglalink = 0;
	int Grameenphone = 0;
	int Robi = 0;
	int Airtel = 0;
	int Teletalk = 0;
	int others = 0;
%}

/* Rules Part */
%%

"01"[4|9][0-9]+ {
	Banglalink++;
	fprintf(yyout, "%s is a Banglalink number.\n", yytext);
}
"01"[3|7][0-9]+ {
	Grameenphone++;
	fprintf(yyout, "%s is a Grameenphone number.\n", yytext);
}
"018"[0-9]+ {
	Robi++;
	fprintf(yyout, "%s is a Robi number.\n", yytext);
}
"016"[0-9]+ {
	Airtel++;
	fprintf(yyout, "%s is an Airtel number.\n", yytext);
}
"015"[0-9]+ {
	Teletalk++;
	fprintf(yyout, "%s is a Teletalk number.\n", yytext);
}

[ \n\t] {others++;}
. {others++;}
%%

/* Main Function */
int main()
{
	yyin=fopen("sample.txt","r");
	//yyout = fopen("output.txt","w");

	yylex();
	printf("\n");
	printf("Banglalink Number: %d\n", Banglalink);
	printf("Grameenphone Number: %d\n", Grameenphone);
	printf("Robi Number: %d\n", Robi);
	printf("Airtel Number: %d\n", Airtel);
	printf("Teletalk Number: %d\n", Teletalk);

	return 0;
}

int yywrap()
{
	return 1;
}