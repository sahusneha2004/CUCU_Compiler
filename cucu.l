%{

 
 #include <stdio.h>

 
 #define YYSTYPE char*
 #include "y.tab.h"
%}
%option noyywrap 


%%
char[ \t]*\*  { fprintf(yyout,"TYPE_C : %s\n",yytext); return TYPE;}

("int")               { yylval=strdup(yytext) ;fprintf(yyout,"TYPE_I : %s\n",yytext); return TYPE;}
("return")             { yylval=strdup(yytext) ;fprintf(yyout,"RETURN : %s\n",yytext); return RETURN;}
("while")              { yylval=strdup(yytext) ;fprintf(yyout,"WHILE : %s\n",yytext);return WHILE;}
("else")               { yylval=strdup(yytext) ;fprintf(yyout,"ELSE : %s\n",yytext);return ELSE;}
("if")                 { yylval=strdup(yytext) ;fprintf(yyout,"IF : %s\n",yytext);return IF;}
("=")                  { yylval=strdup(yytext) ;fprintf(yyout,"ASSIGN : %s\n",yytext);return ASSIGN;}
(";")                  { yylval=strdup(yytext) ;fprintf(yyout,"SEMI : %s\n",yytext);return SEMI;}
("\(")                  { yylval=strdup(yytext) ;fprintf(yyout,"L_RB : %s\n",yytext);return L_RB;}
("\)")                  { yylval=strdup(yytext) ;fprintf(yyout,"R_RB : %s\n",yytext);return R_RB;}
("\[")                  { yylval=strdup(yytext) ;fprintf(yyout,"L_SB : %s\n",yytext);return L_SB;}
("\]")                  { yylval=strdup(yytext) ;fprintf(yyout,"R_SB : %s\n",yytext);return R_SB;}
("\{")                  { yylval=strdup(yytext) ;fprintf(yyout,"L_CB : %s\n",yytext);return L_CB;}
("\}")                  {yylval=strdup(yytext) ; fprintf(yyout,"R_CB : %s\n",yytext);return R_CB;}
(",")                   { yylval=strdup(yytext) ;fprintf(yyout,"COMMA : %s\n",yytext);return COMMA;}
("!="|"=="|">"|"<")        { yylval=strdup(yytext) ;fprintf(yyout,"REL_OP: %s\n",yytext);return REL_OP;}
("+")     { yylval=strdup(yytext) ;fprintf(yyout,"PLUS: %s\n",yytext);return PLUS;}
("-")     { yylval=strdup(yytext) ;fprintf(yyout,"MINUS: %s\n",yytext);return MINUS;}
("*")     { yylval=strdup(yytext) ;fprintf(yyout,"MULTIPLY: %s\n",yytext);return MULTIPLY;}
("/")     { yylval=strdup(yytext) ;fprintf(yyout,"DIVIDE: %s\n",yytext);return DIVIDE;}
("&&"|"\|\|")     { yylval=strdup(yytext) ;fprintf(yyout,"LOG_OP: %s\n",yytext);return LOG_OP;}
("&"|"\|"|"^")     { yylval=strdup(yytext) ;fprintf(yyout,"BIT_OP: %s\n",yytext);return BIT_OP;}
(\".*\")          { yylval=strdup(yytext) ;fprintf(yyout,"STRING: %s\n",yytext);return STRING;}
[a-zA-Z][a-zA-Z0-9_]*  { yylval=strdup(yytext) ;fprintf(yyout,"ID : %s\n",yytext);return ID;}
[0-9]+                 { yylval=strdup(yytext) ; fprintf(yyout,"NUM : %s\n",yytext);return NUM;}
[ \n]                            ;
[ \t]+                      ;
(\/\*(.*\n)*.*\*\/)     ;

%%

