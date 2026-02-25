%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int line_num = 1;
extern FILE *yyout;
extern FILE *yyin;
%}

%option noyywrap

DIGIT       [0-9]
EXP         [eE][+-]?{DIGIT}+
LETTER      [a-zA-ZäöüßÄÖÜ]
ID          {LETTER}({LETTER}|{DIGIT}|_)*
NUMBER      ({DIGIT}+(\.{DIGIT}+)?{EXP}?)|(\.{DIGIT}+{EXP}?)
STRING      \"[^\"]*\"

%%

\n                      { line_num++; }
[ \t]+                  ;

"wenn"                  { fprintf(yyout,"Line %d: WENN\n", line_num); return WENN; }
"sonst"                 { fprintf(yyout,"Line %d: SONST\n", line_num); return SONST; }
"sonstwenn"             { fprintf(yyout,"Line %d: SONSTWENN\n", line_num); return SONSTWENN; }
"fur"|"für"             { fprintf(yyout,"Line %d: FUR\n", line_num); return FUR; }
"solange"               { fprintf(yyout,"Line %d: SOLANGE\n", line_num); return SOLANGE; }
"klasse"                { fprintf(yyout,"Line %d: KLASSE\n", line_num); return KLASSE; }
"funktion"              { fprintf(yyout,"Line %d: FUNKTION\n", line_num); return FUNKTION; }
"drucke"                { fprintf(yyout,"Line %d: DRUCKE\n", line_num); return DRUCKE; }
"eingabe"               { fprintf(yyout,"Line %d: EINGABE\n", line_num); return EINGABE; }
"gebe"                  { fprintf(yyout,"Line %d: GEBE\n", line_num); return GEBE; }
"importiere"            { fprintf(yyout,"Line %d: IMPORTIERE\n", line_num); return IMPORTIERE; }
"definiere"             { fprintf(yyout,"Line %d: DEFINIERE\n", line_num); return DEFINIERE; }
"wahle"|"wähle"         { fprintf(yyout,"Line %d: WAHLE\n", line_num); return WAHLE; }
"fall"                  { fprintf(yyout,"Line %d: FALL\n", line_num); return FALL; }
"abbrechen"             { fprintf(yyout,"Line %d: ABBRECHEN\n", line_num); return ABBRECHEN; }
"wahr"                  { fprintf(yyout,"Line %d: WAHR\n", line_num); return WAHR; }
"falsch"                { fprintf(yyout,"Line %d: FALSCH\n", line_num); return FALSCH; }

"=="                    { fprintf(yyout,"Line %d: EQ\n", line_num); return EQ; }
"!="                    { fprintf(yyout,"Line %d: NE\n", line_num); return NE; }
"<="                    { fprintf(yyout,"Line %d: LE\n", line_num); return LE; }
">="                    { fprintf(yyout,"Line %d: GE\n", line_num); return GE; }
"++"                    { fprintf(yyout,"Line %d: PLUSPLUS\n", line_num); return PLUSPLUS; }
"--"                    { fprintf(yyout,"Line %d: MINUSMINUS\n", line_num); return MINUSMINUS; }
"+="                    { fprintf(yyout,"Line %d: PLUSEQ\n", line_num); return PLUSEQ; }
"-="                    { fprintf(yyout,"Line %d: MINUSEQ\n", line_num); return MINUSEQ; }
"*="                    { fprintf(yyout,"Line %d: TIMESEQ\n", line_num); return TIMESEQ; }
"/="                    { fprintf(yyout,"Line %d: DIVEQ\n", line_num); return DIVEQ; }
"+"                     { fprintf(yyout,"Line %d: PLUS\n", line_num); return PLUS; }
"-"                     { fprintf(yyout,"Line %d: MINUS\n", line_num); return MINUS; }
"*"                     { fprintf(yyout,"Line %d: MULT\n", line_num); return MULT; }
"/"                     { fprintf(yyout,"Line %d: DIV\n", line_num); return DIV; }
"%"                     { fprintf(yyout,"Line %d: MOD\n", line_num); return MOD; }
"="                     { fprintf(yyout,"Line %d: ASSIGN\n", line_num); return ASSIGN; }
"<"                     { fprintf(yyout,"Line %d: LT\n", line_num); return LT; }
">"                     { fprintf(yyout,"Line %d: GT\n", line_num); return GT; }

"{"                     { fprintf(yyout,"Line %d: LBRACE\n", line_num); return LBRACE; }
"}"                     { fprintf(yyout,"Line %d: RBRACE\n", line_num); return RBRACE; }
"("                     { fprintf(yyout,"Line %d: LPAREN\n", line_num); return LPAREN; }
")"                     { fprintf(yyout,"Line %d: RPAREN\n", line_num); return RPAREN; }
":"                     { fprintf(yyout,"Line %d: COLON\n", line_num); return COLON; }
";"                     { fprintf(yyout,"Line %d: SEMICOLON\n", line_num); return SEMICOLON; }

{ID}       { yylval.id = strdup(yytext); fprintf(yyout,"Line %d: ID -> %s\n", line_num, yytext); return ID; }
{NUMBER}   { yylval.num = atof(yytext); fprintf(yyout,"Line %d: NUMBER -> %s\n", line_num, yytext); return NUMBER; }
{STRING}   { yylval.str = strdup(yytext); fprintf(yyout,"Line %d: STRING -> %s\n", line_num, yytext); return STRING; }

.          { fprintf(stderr,"Line %d: ERROR -> %s\n", line_num, yytext); }

%%
