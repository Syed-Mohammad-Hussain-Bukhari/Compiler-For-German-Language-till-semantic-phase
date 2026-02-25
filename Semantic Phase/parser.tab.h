/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ID = 258,                      /* ID  */
    NUMBER = 259,                  /* NUMBER  */
    STRING = 260,                  /* STRING  */
    WENN = 261,                    /* WENN  */
    SONST = 262,                   /* SONST  */
    SONSTWENN = 263,               /* SONSTWENN  */
    FUR = 264,                     /* FUR  */
    FUER = 265,                    /* FUER  */
    SOLANGE = 266,                 /* SOLANGE  */
    KLASSE = 267,                  /* KLASSE  */
    FUNKTION = 268,                /* FUNKTION  */
    DRUCKE = 269,                  /* DRUCKE  */
    EINGABE = 270,                 /* EINGABE  */
    GEBE = 271,                    /* GEBE  */
    IMPORTIERE = 272,              /* IMPORTIERE  */
    DEFINIERE = 273,               /* DEFINIERE  */
    WAHLE = 274,                   /* WAHLE  */
    FALL = 275,                    /* FALL  */
    ABBRECHEN = 276,               /* ABBRECHEN  */
    WAHR = 277,                    /* WAHR  */
    FALSCH = 278,                  /* FALSCH  */
    EQ = 279,                      /* EQ  */
    NE = 280,                      /* NE  */
    LE = 281,                      /* LE  */
    GE = 282,                      /* GE  */
    PLUSPLUS = 283,                /* PLUSPLUS  */
    MINUSMINUS = 284,              /* MINUSMINUS  */
    PLUSEQ = 285,                  /* PLUSEQ  */
    MINUSEQ = 286,                 /* MINUSEQ  */
    TIMESEQ = 287,                 /* TIMESEQ  */
    DIVEQ = 288,                   /* DIVEQ  */
    PLUS = 289,                    /* PLUS  */
    MINUS = 290,                   /* MINUS  */
    MULT = 291,                    /* MULT  */
    DIV = 292,                     /* DIV  */
    MOD = 293,                     /* MOD  */
    ASSIGN = 294,                  /* ASSIGN  */
    LT = 295,                      /* LT  */
    GT = 296,                      /* GT  */
    LBRACE = 297,                  /* LBRACE  */
    RBRACE = 298,                  /* RBRACE  */
    LPAREN = 299,                  /* LPAREN  */
    RPAREN = 300,                  /* RPAREN  */
    COLON = 301,                   /* COLON  */
    SEMICOLON = 302                /* SEMICOLON  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "parser.y"

    char *id;
    double num;
    char *str;

#line 117 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
