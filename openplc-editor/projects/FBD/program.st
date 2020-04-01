PROGRAM program0
  VAR
    LocalVar0 AT %MD0 : DINT := 10;
    LocalVar1 AT %MD1 : DINT := 20;
    LocalVar2 AT %MD2 : DINT;
  END_VAR
  VAR
    MUL4_OUT : DINT;
  END_VAR

  MUL4_OUT := MUL(LocalVar0, LocalVar1);
  LocalVar2 := MUL4_OUT;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#1s,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
