#include <math.h>

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

static int my_solve_eq(lua_State *l)// solve equation
{
	float a = (float) luaL_checknumber(l, 1);// get 3 arguments
	float b = (float) luaL_checknumber(l, 2);
	float c = (float) luaL_checknumber(l, 3);

	float d = b * b - 4.0f * a * c;
	if(d < 0)// no roots
	{
		lua_pushnil(l);// returnt 2 nil
		lua_pushnil(l);	
	}
	else if (d > 0)// 2 roots
	{
		float x1 = (-b - sqrtf(d)) / (2.0f * a);
		float x2 = (-b + sqrtf(d)) / (2.0f * a);
		lua_pushnumber(l, x1);// return 2 number
		lua_pushnumber(l, x2);	
	}
	else// 1 roots
	{
		float x = (-b + sqrtf(d)) / (2.0f * a);
		lua_pushnumber(l, x);
		lua_pushnil(l);// 2nd is nil
	}
	
	return 2;// return 2 variables
}

int main()
{
	lua_State *l = luaL_newstate();// create new virtual machine
	luaL_openlibs(l);// load standard libraries

	luaL_loadfile(l, "clua.lua");// load script file into vm
	lua_pcall(l, 0, 0, 0);// execute entire file to create global variables
	
	lua_pushcfunction(l, my_solve_eq);// share a C function to lua script
	lua_setglobal(l, "solve_eq");// name it solve_eq, make it globally available

	lua_getglobal(l, "run");// prepare to execute lua function
	lua_pcall(l, 0, 0, 0);// execute a function within lua

	lua_close(l);// delete lua vm
	return 0;
}
