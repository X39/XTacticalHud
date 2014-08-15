#define ISSTRING(X) (typeName X == "STRING" || typeName X == "TEXT")
#define ISOBJECT(X) (typeName X == "OBJECT")
#define ISBOOL(X) (typeName X == "BOOL")

#define assignVariable(X,Y) if(isNil {X})then{X = Y;};
#define forceLocal(UNIT) if(!local UNIT) exitWith {[_this, _fnc_scriptName, UNIT, false] call BIS_fnc_MP};

//#define DEBUG

#define KOMMA ,
#define COMMA ,
#ifndef DEBUG
	#define DEBUG_LOG(X) 
	#define DEBUG_LOG_WFn(X) 
	#define DEBUG_CODE(X) 
	#define DEBUG_CODE_NS(X) 
#else
	#define DEBUG_LOG(X) diag_log (X); systemChat X;
	#define DEBUG_LOG_WFn(X) diag_log format["%1 - %2: %3", time, _fnc_scriptName, X];
	#define DEBUG_CODE(X) X;
	#define DEBUG_CODE_NS(X) X
#endif
#ifndef PREVENTCALLOUTPUT
DEBUG_CODE(if(isNil "_fnc_scriptName") then { _fnc_scriptName = "nil"; })
DEBUG_LOG(format["%3: %1 call %2" COMMA _this COMMA _fnc_scriptName COMMA time])
#endif