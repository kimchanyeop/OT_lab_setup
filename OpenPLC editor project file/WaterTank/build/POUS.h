#include "beremiz.h"
#ifndef __POUS_H
#define __POUS_H

#include "accessor.h"
#include "iec_std_lib.h"

__DECLARE_ENUMERATED_TYPE(LOGLEVEL,
  LOGLEVEL__CRITICAL,
  LOGLEVEL__WARNING,
  LOGLEVEL__INFO,
  LOGLEVEL__DEBUG
)
// FUNCTION_BLOCK LOGGER
// Data part
typedef struct {
  // FB Interface - IN, OUT, IN_OUT variables
  __DECLARE_VAR(BOOL,EN)
  __DECLARE_VAR(BOOL,ENO)
  __DECLARE_VAR(BOOL,TRIG)
  __DECLARE_VAR(STRING,MSG)
  __DECLARE_VAR(LOGLEVEL,LEVEL)

  // FB private variables - TEMP, private and located variables
  __DECLARE_VAR(BOOL,TRIG0)

} LOGGER;

void LOGGER_init__(LOGGER *data__, BOOL retain);
// Code part
void LOGGER_body__(LOGGER *data__);
// PROGRAM WATERTANK
// Data part
typedef struct {
  // PROGRAM Interface - IN, OUT, IN_OUT variables

  // PROGRAM private variables - TEMP, private and located variables
  __DECLARE_VAR(INT,MAX_LEVEL)
  __DECLARE_VAR(BOOL,TRUE0)
  __DECLARE_VAR(BOOL,FALSE0)
  __DECLARE_VAR(INT,THREE)
  __DECLARE_VAR(INT,ZERO)
  __DECLARE_VAR(INT,MIN_LEVEL)
  __DECLARE_VAR(INT,PUMP_SPEED)
  __DECLARE_VAR(BOOL,PUMP_STATE)
  __DECLARE_VAR(BOOL,PUMP_CONTROL)
  __DECLARE_VAR(BOOL,MAN_BUTTON)
  __DECLARE_VAR(BOOL,MANUAL_CONTROL)
  __DECLARE_VAR(INT,WATER_LEVEL)
  __DECLARE_VAR(INT,RISING_LEVEL)
  __DECLARE_VAR(INT,_TMP_SUB12_OUT)
  __DECLARE_VAR(INT,_TMP_ADD46_OUT)
  __DECLARE_VAR(BOOL,_TMP_MOVE50_ENO)
  __DECLARE_VAR(INT,_TMP_MOVE50_OUT)
  __DECLARE_VAR(BOOL,_TMP_MOVE7_ENO)
  __DECLARE_VAR(INT,_TMP_MOVE7_OUT)
  __DECLARE_VAR(BOOL,_TMP_GE31_ENO)
  __DECLARE_VAR(BOOL,_TMP_GE31_OUT)
  __DECLARE_VAR(BOOL,_TMP_LT69_ENO)
  __DECLARE_VAR(BOOL,_TMP_LT69_OUT)
  __DECLARE_VAR(BOOL,_TMP_GT71_ENO)
  __DECLARE_VAR(BOOL,_TMP_GT71_OUT)
  __DECLARE_VAR(BOOL,_TMP_MOVE66_OUT)

} WATERTANK;

void WATERTANK_init__(WATERTANK *data__, BOOL retain);
// Code part
void WATERTANK_body__(WATERTANK *data__);
#endif //__POUS_H
