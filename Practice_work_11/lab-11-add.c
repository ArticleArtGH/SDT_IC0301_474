#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#include <math.h>

int main(){
	lua_State *l = luaL_newstate();
	luaL_openlibs(l);
	
	luaL_loadfile(l, "lab-11-add.lua");
	lua_pcall(l, 0, 0, 0);	
	
	lua_pushcfunction(l, CAreaTriangle);
	lua_setglobal(l, "AreaTriangle");

	lua_getglobal(l, "run");
	lua_pcall(l, 0, 0, 0);

	lua_close(l);
	return 0;
}

static float CAreaTriangle(lua_State *l){
	float a = (float) luaL_checknumber(l, 1);
	float h = (float) luaL_checknumber(l, 2);
	
	float S = 0.5f * a * h;
	lua_pushnumber(l, S);

	return 1;	
}
