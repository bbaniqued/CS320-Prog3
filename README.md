Assignment #3, Brandon Baniqued
Brandon.baniqued@gmail.com
This assignment is designed to familiarize you with Lua while working with C/C++
Contents
3 sub-assignments in total.

Prog3_1.cpp:
Implemented in C/C++. Takes a single command line argument. The command line argument will be the name of a lua file. The program should then execute the Lua file in a lua environment created in the C/C++ program.

Prog3_2.lua:
The function InfixToPostfix(str) takes a single argument (it will be an input string). Tokenize that input string by space and then apply the infix to postfix algorithm to return a postfix string. 

Prog3_3.cpp:
The program will create a lua environment, load/run the file specified by the command line argument. It will then take in a line of input from stdin, call the InfixToPostfix() function in lua, retrieve the resulting postfix string from the lua stack and then print the resultant postfix string.

