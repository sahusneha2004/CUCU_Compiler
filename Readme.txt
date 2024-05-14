Name: Hartik Arora
ROll number: 2022CSB1314


The program assumes certain conditions:
1. The modulo operator is not allowed.
2. Only the `=` and `!=` relational operators are permitted.
3. Multiple variable declarations on the same line (e.g., `int a, b, c;`) are not supported.
4. Only the `while` loop is permitted for iterative statements.
5. The `if` statement must always precede the `else` statement.

Input is accepted via command line, and the program generates two output files: `Lexer.txt`, which contains tokens extracted from the provided code samples, and `Parser.txt`, which details the structure of the code and any syntax errors encountered.

Two sample files are provided: `Sample.cu`, which contains code with correct syntax, and `Sample1.cu`, which contains code with syntax errors.


#How to run Program?

lex cucu.l
yacc -d cucu.y 
gcc lex.yy.c y.tab.c -lfl
./a.out sample.cu
