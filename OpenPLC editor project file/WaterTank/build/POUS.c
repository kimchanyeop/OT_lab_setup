void LOGGER_init__(LOGGER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MSG,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->LEVEL,LOGLEVEL__INFO,retain)
  __INIT_VAR(data__->TRIG0,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void LOGGER_body__(LOGGER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->TRIG,) && !(__GET_VAR(data__->TRIG0,)))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  
    #undef GetFbVar
    #undef SetFbVar
;
  };
  __SET_VAR(data__->,TRIG0,,__GET_VAR(data__->TRIG,));

  goto __end;

__end:
  return;
} // LOGGER_body__() 





static inline INT __WATERTANK_MOVE__INT__INT1(BOOL EN,
  INT IN,
  WATERTANK *data__)
{
  INT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE50_ENO,);
  __res = MOVE__INT__INT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE50_ENO,,__TMP_ENO);
  return __res;
}

static inline INT __WATERTANK_MOVE__INT__INT2(BOOL EN,
  INT IN,
  WATERTANK *data__)
{
  INT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_MOVE7_ENO,);
  __res = MOVE__INT__INT(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->_TMP_MOVE7_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __WATERTANK_GE__BOOL__INT3(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  WATERTANK *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_GE31_ENO,);
  __res = GE__BOOL__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_GE31_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __WATERTANK_LT__BOOL__INT4(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  WATERTANK *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_LT69_ENO,);
  __res = LT__BOOL__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_LT69_ENO,,__TMP_ENO);
  return __res;
}

static inline BOOL __WATERTANK_GT__BOOL__INT5(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  WATERTANK *data__)
{
  BOOL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->_TMP_GT71_ENO,);
  __res = GT__BOOL__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->_TMP_GT71_ENO,,__TMP_ENO);
  return __res;
}

void WATERTANK_init__(WATERTANK *data__, BOOL retain) {
  __INIT_VAR(data__->MAX_LEVEL,100,retain)
  __INIT_VAR(data__->TRUE0,1,retain)
  __INIT_VAR(data__->FALSE0,0,retain)
  __INIT_VAR(data__->THREE,2,retain)
  __INIT_VAR(data__->ZERO,0,retain)
  __INIT_VAR(data__->MIN_LEVEL,0,retain)
  __INIT_VAR(data__->PUMP_SPEED,0,retain)
  __INIT_VAR(data__->PUMP_STATE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PUMP_CONTROL,0,retain)
  __INIT_VAR(data__->MAN_BUTTON,1,retain)
  __INIT_VAR(data__->MANUAL_CONTROL,0,retain)
  __INIT_VAR(data__->WATER_LEVEL,50,retain)
  __INIT_VAR(data__->RISING_LEVEL,1,retain)
  __INIT_VAR(data__->_TMP_SUB12_OUT,0,retain)
  __INIT_VAR(data__->_TMP_ADD46_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE50_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE50_OUT,0,retain)
  __INIT_VAR(data__->_TMP_MOVE7_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE7_OUT,0,retain)
  __INIT_VAR(data__->_TMP_GE31_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_GE31_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_LT69_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_LT69_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_GT71_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_GT71_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->_TMP_MOVE66_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void WATERTANK_body__(WATERTANK *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,_TMP_SUB12_OUT,,SUB__INT__INT__INT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (INT)__GET_VAR(data__->WATER_LEVEL,),
    (INT)__GET_VAR(data__->PUMP_SPEED,)));
  __SET_VAR(data__->,WATER_LEVEL,,__GET_VAR(data__->_TMP_SUB12_OUT,));
  __SET_VAR(data__->,_TMP_ADD46_OUT,,ADD__INT__INT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (INT)__GET_VAR(data__->WATER_LEVEL,),
    (INT)__GET_VAR(data__->RISING_LEVEL,)));
  __SET_VAR(data__->,WATER_LEVEL,,__GET_VAR(data__->_TMP_ADD46_OUT,));
  __SET_VAR(data__->,_TMP_MOVE50_OUT,,__WATERTANK_MOVE__INT__INT1(
    (BOOL)__GET_VAR(data__->PUMP_STATE,),
    (INT)__GET_VAR(data__->THREE,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE50_ENO,)) {
    __SET_VAR(data__->,PUMP_SPEED,,__GET_VAR(data__->_TMP_MOVE50_OUT,));
  };
  __SET_VAR(data__->,_TMP_MOVE7_OUT,,__WATERTANK_MOVE__INT__INT2(
    (BOOL)!(__GET_VAR(data__->PUMP_STATE,)),
    (INT)__GET_VAR(data__->ZERO,),
    data__));
  if (__GET_VAR(data__->_TMP_MOVE7_ENO,)) {
    __SET_VAR(data__->,PUMP_SPEED,,__GET_VAR(data__->_TMP_MOVE7_OUT,));
  };
  __SET_VAR(data__->,_TMP_GE31_OUT,,__WATERTANK_GE__BOOL__INT3(
    (BOOL)!(__GET_VAR(data__->MANUAL_CONTROL,)),
    (UINT)2,
    (INT)__GET_VAR(data__->WATER_LEVEL,),
    (INT)__GET_VAR(data__->MAX_LEVEL,),
    data__));
  __SET_VAR(data__->,_TMP_LT69_OUT,,__WATERTANK_LT__BOOL__INT4(
    (BOOL)(__GET_VAR(data__->PUMP_STATE,) && !(__GET_VAR(data__->MANUAL_CONTROL,))),
    (UINT)2,
    (INT)__GET_VAR(data__->WATER_LEVEL,),
    (INT)__GET_VAR(data__->MAX_LEVEL,),
    data__));
  __SET_VAR(data__->,_TMP_GT71_OUT,,__WATERTANK_GT__BOOL__INT5(
    (BOOL)__GET_VAR(data__->_TMP_LT69_ENO,),
    (UINT)2,
    (INT)__GET_VAR(data__->WATER_LEVEL,),
    (INT)__GET_VAR(data__->MIN_LEVEL,),
    data__));
  __SET_VAR(data__->,PUMP_CONTROL,,((__GET_VAR(data__->_TMP_GE31_OUT,) || __GET_VAR(data__->_TMP_GT71_OUT,)) || (__GET_VAR(data__->MAN_BUTTON,) && __GET_VAR(data__->MANUAL_CONTROL,))));
  __SET_VAR(data__->,_TMP_MOVE66_OUT,,MOVE__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (BOOL)__GET_VAR(data__->PUMP_CONTROL,)));
  __SET_VAR(data__->,PUMP_STATE,,__GET_VAR(data__->_TMP_MOVE66_OUT,));

  goto __end;

__end:
  return;
} // WATERTANK_body__() 





