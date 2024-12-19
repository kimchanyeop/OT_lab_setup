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

(*DBG:char md5[] = "2e1da338f764aa12c3356fbeea8de7b0";*)
(*DBG:/**)
(*DBG: * This file is part of OpenPLC Runtime*)
(*DBG: **)
(*DBG: * Copyright (C) 2023 Autonomy, GP Orcullo*)
(*DBG: * Based on the work by GP Orcullo on Beremiz for uC*)
(*DBG: **)
(*DBG: * This program is free software; you can redistribute it and/or*)
(*DBG: * modify it under the terms of the GNU General Public License*)
(*DBG: * as published by the Free Software Foundation; either version 2*)
(*DBG: * of the License, or (at your option) any later version.*)
(*DBG: **)
(*DBG: * This program is distributed in the hope that it will be useful,*)
(*DBG: * but WITHOUT ANY WARRANTY; without even the implied warranty of*)
(*DBG: * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*)
(*DBG: * GNU General Public License for more details.*)
(*DBG: **)
(*DBG: * You should have received a copy of the GNU General Public License*)
(*DBG: * along with this program; If not, see <http://www.gnu.org/licenses/>.*)
(*DBG: **)
(*DBG: */*)
(*DBG:*)
(*DBG:#include <stdbool.h>*)
(*DBG:*)
(*DBG:#include "iec_types_all.h"*)
(*DBG:#include "POUS.h"*)
(*DBG:*)
(*DBG:#define SAME_ENDIANNESS      0*)
(*DBG:#define REVERSE_ENDIANNESS   1*)
(*DBG:*)
(*DBG:uint8_t endianness;*)
(*DBG:*)
(*DBG:*)
(*DBG:extern WATERTANK RES0__INSTANCE0;*)
(*DBG:*)
(*DBG:static const struct {*)
(*DBG:    void *ptr;*)
(*DBG:    __IEC_types_enum type;*)
(*DBG:} debug_vars[] = {*)
(*DBG:    {&(RES0__INSTANCE0.MAX_LEVEL), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.TRUE0), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.FALSE0), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.THREE), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.ZERO), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MIN_LEVEL), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PUMP_SPEED), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PUMP_STATE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PUMP_CONTROL), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MAN_BUTTON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.MANUAL_CONTROL), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.WATER_LEVEL), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.RISING_LEVEL), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_SUB12_OUT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_ADD46_OUT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE50_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE50_OUT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE7_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE7_OUT), INT_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_GE31_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_GE31_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_LT69_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_LT69_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_GT71_ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_GT71_OUT), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0._TMP_MOVE66_OUT), BOOL_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               26*)
(*DBG:*)
(*DBG:uint16_t get_var_count(void)*)
(*DBG:{*)
(*DBG:    return VAR_COUNT;*)
(*DBG:}*)
(*DBG:*)
(*DBG:size_t get_var_size(size_t idx)*)
(*DBG:{*)
(*DBG:    if (idx >= VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return sizeof(INT);*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void *get_var_addr(size_t idx)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case INT_ENUM:*)
(*DBG:        return (void *)&((__IEC_INT_t *) ptr)->value;*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void force_var(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    if (forced) {*)
(*DBG:        size_t var_size = get_var_size(idx);*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case INT_ENUM: {*)
(*DBG:            memcpy(&((__IEC_INT_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_INT_t *) ptr)->value = *((INT *) val);*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        case BOOL_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_BOOL_t *) ptr)->value = *((BOOL *) val);*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    } else {*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case INT_ENUM:*)
(*DBG:            ((__IEC_INT_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        case BOOL_ENUM:*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void swap_bytes(void *ptr, size_t size) *)
(*DBG:{*)
(*DBG:    uint8_t *bytePtr = (uint8_t *)ptr;*)
(*DBG:    size_t i;*)
(*DBG:    for (i = 0; i < size / 2; ++i) *)
(*DBG:    {*)
(*DBG:        uint8_t temp = bytePtr[i];*)
(*DBG:        bytePtr[i] = bytePtr[size - 1 - i];*)
(*DBG:        bytePtr[size - 1 - i] = temp;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void trace_reset(void)*)
(*DBG:{*)
(*DBG:    for (size_t i=0; i < VAR_COUNT; i++) *)
(*DBG:    {*)
(*DBG:        force_var(i, false, 0);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_trace(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    if (idx >= 0 && idx < VAR_COUNT) *)
(*DBG:    {*)
(*DBG:        if (endianness == REVERSE_ENDIANNESS)*)
(*DBG:        {*)
(*DBG:            // Aaaaarghhhh... Stupid AVR is Big Endian.*)
(*DBG:            swap_bytes(val, get_var_size(idx));*)
(*DBG:        }*)
(*DBG:*)
(*DBG:        force_var(idx, forced, val);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_endianness(uint8_t value)*)
(*DBG:{*)
(*DBG:    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)*)
(*DBG:    {*)
(*DBG:        endianness = value;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)