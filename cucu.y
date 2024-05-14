%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#define YYSTYPE char*
     int yylex();
	extern FILE* yyin;
	extern FILE* yyout;
	extern void yyerror(char* msg);
%}

%token TYPE RETURN  WHILE ELSE IF ASSIGN SEMI NUM ID  L_RB R_RB L_SB R_SB L_CB R_CB COMMA REL_OP   LOG_OP BIT_OP STRING PLUS MINUS MULTIPLY DIVIDE BOOLEAN

%%


PROGRAM: PROGRAM VAR_DEC 
| PROGRAM FUN_DEF
| PROGRAM FUN_DEC
| VAR_DEC
| FUN_DEF
| FUN_DEC
;


VAR_DEC: TYPE ID SEMI          {printf("DATATYPE : %s \nIDENTIFIER : %s \n",$1,$2);}
| TYPE ID ASSIGN NUM SEMI      {printf("DATATYPE : %s \nIDENTIFIER : %s \n",$1,$2);}
| TYPE ID ASSIGN STRING SEMI   {printf("DATATYPE : %s \nIDENTIFIER : %s \n",$1,$2);}
;

FUN_DEC: TYPE ID L_RB FUN_ARG R_RB SEMI  {printf("FUNTION DECLARATION :  \tDATATYPE : %s \nIDENTIFIER : %s",$1,$2);} 
;


FUN_ARG:  FUN_ARG COMMA TYPE ID   {printf("\nFUNTION ARGUMENTS :  \nID : %s \nIDENTIFIER : %s",$3,$4);}
|TYPE ID                          {printf("\nFUNTION ARGUMENTS :  \nID : %s \nIDENTIFIER : %s",$1,$2);}
| 
;

FUN_DEF: TYPE ID L_RB FUN_ARG R_RB    {printf("\nFUNTION DEFFINTAION OF TYPE : %s  ",$1);} BODY
;


BODY: L_CB R_CB           {printf("\nFUNTION BODY   \n ");}            
|L_CB BLOCK_ITEM R_CB     {printf("\nFUNTION BODY  \n ");}
;


BLOCK_ITEM: VAR_DEC        {printf("\nVARIABLE DECLARATION  \n ");}
| STATEMENT                 {printf("\nSTATEMENT  \n ");}
| BLOCK_ITEM VAR_DEC        
| BLOCK_ITEM STATEMENT
;


STATEMENT: EXPR_STMT 
| BODY 
|IF_STMT
| WHILE_STMT 
|RETURN_STMT  
;

EXPR_STMT: EXPR SEMI        {printf("\nEXPRESSION  \n ");}   
| SEMI            
;

IF_STMT: IF L_RB EXPR R_RB BODY       {printf("\nIF STATEMENT  \n ");}  
| IF L_RB EXPR R_RB BODY ELSE BODY    {printf("\nIF ELSE STATEMENT  \n ");}  
;

WHILE_STMT:  WHILE L_RB EXPR R_RB  BODY   {printf("\nWHILE STATEMENT  \n ");}  
;

RETURN_STMT: RETURN EXPR SEMI           {printf("\nRETURN STATEMENT  \n ");}  
| RETURN SEMI                            {printf("\nRETURN STATEMENT  \n ");} 
;  



EXPR: ID ASSIGN EXPR                      {printf("\nASSINGMENT  \n ");} 
| EXPR1                                   {printf("\nSIMPLE EXPRESSION  \n ");} 
;
EXPR1: ARTH_EXPR REL_OP ARTH_EXPR         {printf("\nRELATIONAL OPERATOR: %s \n ",$2);}   
|ARTH_EXPR                                
;

ARTH_EXPR: ARTH_EXPR PLUS1 TERM            {printf("\nARITHMATIC EXPRESSION BETWEEN %s %s \n ",$1,$3);} 
| TERM                
;

PLUS1: PLUS                {printf("\nPLUS: %s  \n",$1);} 
|		MINUS              {printf("\nMINUS: %s  \n",$1);} 
;

TERM: TERM MULTIPLY1 FACTOR
|	FACTOR
;

MULTIPLY1: MULTIPLY           {printf("\nMULTIPLY: %s  \n",$1);} 
|DIVIDE                        {printf("\nDIVIDE: %s  \n",$1);} 
;

FACTOR: L_RB EXPR R_RB         
| ID 
| ID L_RB R_RB 
|ID L_RB ARG_LIST R_RB
| NUM  
;

ARG_LIST: ARG_LIST COMMA EXPR 
|EXPR 
;



%%
void yyerror(char *str)
{
printf("SYNTAX ERROR : SYNTAX INCORRECT\n");
}

int main(int argc,char** argv)

{   
    if(argc<2){
        printf("Give filename in terminal");
	}
	yyin = fopen(argv[1], "r"); 
	yyout = fopen("Lexer.txt", "w");
	stdout=fopen("parser.txt","w");
	yyparse();
    return 0;
}