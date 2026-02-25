%{
#include <stdio.h>
int line_num = 1;
%}
%option noyywrap

DIGIT       [0-9]
EXP         [eE][+-]?{DIGIT}+
LETTER      [a-zA-ZäöüßÄÖÜ]
ID          {LETTER}({LETTER}|{DIGIT}|_)*
NUMBER      ({DIGIT}+(\.{DIGIT}+)?{EXP}?)|(\.{DIGIT}+{EXP}?)
STRING      \"[^\"]*\"
CHAR	    \'[^\']*\'

%%

\n                      { line_num++; }
[ \t]+			;

"wenn"|"sonst"|"sonstwenn"|"fur"|"für"|"solange"|"klasse"|"funktion"|\
"drucke"|"eingabe"|"gebe"|"importiere"|"definiere"|"wahle"|"wähle"|\
"fall"|"abbrechen"|"wahr"|"falsch"   { printf("Line %d: KEYWORD -> %s\n", line_num, yytext); }

"=="|"!="|"<="|">="|"++"|"--"|"+="|"-="|"*="|"/="               { printf("Line %d: OPERATOR -> %s\n", line_num, yytext); }

"+"|"-"|"*"|"/"|"%"|"="|"<"|">"					{ printf("Line %d: OPERATOR -> %s\n", line_num, yytext); }

"{"|"}"|"("|")"|":"|";"                   { printf("Line %d: PUNCTUATION -> %s\n", line_num, yytext); }

{ID}                       { printf("Line %d: IDENTIFIER -> %s\n", line_num, yytext); }
{NUMBER}                   { printf("Line %d: NUMBER -> %s\n", line_num, yytext); }
{STRING}                   { printf("Line %d: STRING -> %s\n", line_num, yytext); }

.                          { printf("Line %d: ERROR -> %s\n", line_num, yytext); }

%%

int main(){
yylex();
return 0;
}
