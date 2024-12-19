PROGRAM WaterTank
  VAR CONSTANT
    max_level AT %QW1 : INT := 100;
  END_VAR
  VAR CONSTANT
    true0 : BOOL := 1;
    false0 : BOOL := 0;
    three : INT := 2;
    zero : INT := 0;
  END_VAR
  VAR CONSTANT
    min_level AT %QW2 : INT := 0;
  END_VAR
  VAR
    pump_speed AT %QW3 : INT := 0;
    pump_state AT %QX0.0 : BOOL;
    pump_control AT %QX0.1 : BOOL := 0;
    man_button AT %QX0.3 : BOOL := 1;
    manual_control AT %QX0.2 : BOOL := 0;
    water_level AT %IW0 : INT := 50;
    rising_level AT %QW4 : INT := 1;
  END_VAR
  VAR
    _TMP_SUB12_OUT : INT;
    _TMP_ADD46_OUT : INT;
    _TMP_MOVE50_ENO : BOOL;
    _TMP_MOVE50_OUT : INT;
    _TMP_MOVE7_ENO : BOOL;
    _TMP_MOVE7_OUT : INT;
    _TMP_GE31_ENO : BOOL;
    _TMP_GE31_OUT : BOOL;
    _TMP_LT69_ENO : BOOL;
    _TMP_LT69_OUT : BOOL;
    _TMP_GT71_ENO : BOOL;
    _TMP_GT71_OUT : BOOL;
    _TMP_MOVE66_OUT : BOOL;
  END_VAR

  _TMP_SUB12_OUT := SUB(water_level, pump_speed);
  water_level := _TMP_SUB12_OUT;
  _TMP_ADD46_OUT := ADD(water_level, rising_level);
  water_level := _TMP_ADD46_OUT;
  _TMP_MOVE50_OUT := MOVE(EN := pump_state, IN := three, ENO => _TMP_MOVE50_ENO);
  IF _TMP_MOVE50_ENO THEN
      pump_speed := _TMP_MOVE50_OUT;
  END_IF;
  _TMP_MOVE7_OUT := MOVE(EN := NOT(pump_state), IN := zero, ENO => _TMP_MOVE7_ENO);
  IF _TMP_MOVE7_ENO THEN
      pump_speed := _TMP_MOVE7_OUT;
  END_IF;
  _TMP_GE31_OUT := GE(EN := NOT(manual_control), IN1 := water_level, IN2 := max_level, ENO => _TMP_GE31_ENO);
  _TMP_LT69_OUT := LT(EN := pump_state AND NOT(manual_control), IN1 := water_level, IN2 := max_level, ENO => _TMP_LT69_ENO);
  _TMP_GT71_OUT := GT(EN := _TMP_LT69_ENO, IN1 := water_level, IN2 := min_level, ENO => _TMP_GT71_ENO);
  pump_control := _TMP_GE31_OUT OR _TMP_GT71_OUT OR man_button AND manual_control;
  _TMP_MOVE66_OUT := MOVE(pump_control);
  pump_state := _TMP_MOVE66_OUT;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : WaterTank;
  END_RESOURCE
END_CONFIGURATION