CLEARSCREEN.

AG20 ON.

WAIT UNTIL AG2 = AG20.


LOCK STEERING TO LOOKDIRUP(HEADING(90,30):VECTOR,UP:VECTOR).
SET THROTTLE TO 1.0.


SET ali TO ALT:RADAR.

WAIT UNTIL ALT:RADAR > (ali +1).

GEAR OFF.

UNTIL altitude > 20000 {
    CLEARSCREEN.
    CLEARVECDRAWS().
    PRINT (VANG(STEERING:VECTOR,FACING:VECTOR)).
    set drawRollSteer to VECDRAW(
        V(0,0,0),
        { return (FACING:VECTOR)*5. },
        BLUE,"",0.5,true).

    set drawRollSteer to VECDRAW(
    V(0,0,0),
    { return (STEERING:VECTOR)*5. },
    RED,"",0.5,true).
}