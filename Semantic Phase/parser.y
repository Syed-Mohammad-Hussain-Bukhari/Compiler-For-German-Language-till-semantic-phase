%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int line_num;
extern int yylex();
void yyerror(const char *s);
%}

%union {
    char *id;
    double num;
    char *str;
}

%token <id> ID
%token <num> NUMBER
%token <str> STRING
%token WENN SONST SONSTWENN FUR FUER SOLANGE KLASSE FUNKTION
%token DRUCKE EINGABE GEBE IMPORTIERE DEFINIERE WAHLE FALL ABBRECHEN WAHR FALSCH
%token EQ NE LE GE PLUSPLUS MINUSMINUS PLUSEQ MINUSEQ TIMESEQ DIVEQ
%token PLUS MINUS MULT DIV MOD ASSIGN LT GT
%token LBRACE RBRACE LPAREN RPAREN COLON SEMICOLON

%left PLUS MINUS
%left MULT DIV MOD
%left EQ NE LT GT

%%

program : stmt_list
        { printf("Syntax analysis successful\n"); }
        ;

stmt_list : stmt_list stmt
          | stmt
          ;

stmt : declaration_stmt
     | assignment_stmt
     | conditional_stmt
     | loop_stmt
     | output_stmt
     ;

declaration_stmt
    : FUNKTION ID LPAREN RPAREN LBRACE stmt_list RBRACE
    | KLASSE ID LBRACE stmt_list RBRACE
    ;

assignment_stmt
    : ID ASSIGN expr SEMICOLON
    | ID PLUSEQ expr SEMICOLON
    | ID MINUSEQ expr SEMICOLON
    | ID TIMESEQ expr SEMICOLON
    | ID DIVEQ expr SEMICOLON
    ;

conditional_stmt
    : WENN LPAREN expr RPAREN LBRACE stmt_list RBRACE elseif_chain optional_else
    ;

elseif_chain
    : SONSTWENN LPAREN expr RPAREN LBRACE stmt_list RBRACE elseif_chain
    | /* empty */
    ;

optional_else
    : SONST LBRACE stmt_list RBRACE
    | /* empty */
    ;

loop_stmt
    : SOLANGE LPAREN expr RPAREN LBRACE stmt_list RBRACE
    | FUR LPAREN assignment_stmt expr SEMICOLON assignment_stmt RPAREN LBRACE stmt_list RBRACE
    ;

output_stmt
    : DRUCKE LPAREN expr RPAREN SEMICOLON
    | EINGABE LPAREN ID RPAREN SEMICOLON
    ;

expr : NUMBER
     | STRING
     | ID
     | expr PLUS expr
     | expr MINUS expr
     | expr MULT expr
     | expr DIV expr
     | expr MOD expr
     | expr EQ expr
     | expr NE expr
     | expr LT expr
     | expr GT expr
     | LPAREN expr RPAREN
     ;

%%

void yyerror(const char *s) {
    printf("Syntax error at line %d: %s\n", line_num, s);
}

int main() {
    printf("Parsing started...\n");
    yyparse();
    return 0;
}
