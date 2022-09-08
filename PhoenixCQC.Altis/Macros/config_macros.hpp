#include "dik_macros.hpp"

#define FUNC(function) class function {}
#define FUNC_PREINIT(function) class function {preInit = 1;}