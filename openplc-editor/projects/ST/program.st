PROGRAM program0
  VAR
    LevelLow AT %QX0.1 : BOOL;
    MasterCoil AT %QX0.2 : BOOL;
    LeveLHigh AT %QX0.3 : BOOL;
    InletValve AT %QX0.4 : BOOL;
    OutletValve AT %QX0.5 : BOOL;
    Start AT %QX0.6 : BOOL;
    Stop AT %QX0.7 : BOOL;
  END_VAR

  MasterCoil := NOT(Stop) AND (MasterCoil OR Start);
  OutletValve := NOT(LevelLow) AND (LevelHigh OR OutletValve) AND MasterCoil;
  InletValve := NOT(LevelHigh) AND (InletValve OR LevelLow OR Start) AND MasterCoil;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#1s,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
