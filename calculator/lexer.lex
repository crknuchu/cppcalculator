%option noyywrap
%option noinput
%option nounput

%{
    #include<iostream>
    #include<cstdlib>
	#include<map>
    #include<cmath>

    using namespace std;

    #include "parser.tab.hpp"

%}

%%
[a-zA-Z][a-zA-Z0-9_]* {
    yylval.s = new string(yytext);
    return id_token;
}
[0-9]+\.?[0-9]* {
    yylval.f = atof(yytext);
    return num_token;
}
[-+*/=()\n%^] {
    return *yytext;
}
[ \t] {

}
. {
    cerr << "Lex error " <<endl;
    exit(EXIT_FAILURE);
}
%%