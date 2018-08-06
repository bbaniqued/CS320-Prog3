/*
 Compile with:
 g++ prog3_1.cpp -o prog3_1 -I lua-5.3.4/src -L lua-5.3.4/src -l lua -l m -l dl
 */

extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
}
#include <string>
#include <iostream>

int main(int argc, char *argv[]) {
	printf("Assignment #3-3, Brandon Baniqued, brandon.baniqued@gmail.com\n");
	if (argc != 2) {
		printf("Error: must have 1 argument\n");
		return 0;
	}
	lua_State *L = luaL_newstate(); // create the new lua state
	luaL_openlibs(L);
	luaL_dofile(L, argv[1]);         // run the provided file

	// read input
	std::string strIn = "";
	std::getline(std::cin, strIn);
	const char* pushStr = strIn.c_str();

	lua_getglobal(L, "InfixToPostfix"); // push the function to the stack
	lua_pushstring(L, pushStr);         // push arguments to the stack
	lua_pcall(L, 1, 1, 0);              // call the function
	std::cout << lua_tostring(L, -1);   // print result from the stack

	lua_close(L);
	return 0;
}
