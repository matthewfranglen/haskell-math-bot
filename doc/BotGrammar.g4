grammar BotGrammar;

expression
    : NUMBER
    | expression ADD expression
    | expression SUBTRACT expression
    | expression MULTIPLY expression
    | expression DIVIDE expression
    ;

ADD      : 'add' ;
SUBTRACT : 'subtract' ;
MULTIPLY : 'multiply' ;
DIVIDE   : 'divide' ;

NUMBER : [0-9]+ ;

WHITESPACE : [ \t\r\n]+ -> skip ;
