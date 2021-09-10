%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "ERRAGRAGUI.tab.h"
%}

Blank [ \t\n]+
Number [0-9]
Alpha [a-zA-Z]
i [iI]
t [tT]
%%
{Blank} {;}
{Number}+ {  yylval.Num  = atoi(yytext);
				return(NUMBER);}
{i}[nN]{t} {return(INT_DEC);} 
"exit"  {return(EXIT);}
{Alpha}+ {yylval.VarName = yytext;
				return(VARNAME);}
[=;{}]   {return(yytext[0]);}
.    {printf("FAILLED INPUT!!!!!!!!!%c\n",yytext[0]);}
%%