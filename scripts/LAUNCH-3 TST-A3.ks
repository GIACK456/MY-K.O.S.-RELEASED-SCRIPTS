CLEARSCREEN.
SET cvv TO 0.
SET xx TO 0.
SET xz TO 100.
SET zz TO 0.
LOCK altitudine TO ALT:RADAR.

UNTIL xx = xz {
    SET xx TO xx + 1.
    SET zz TO (xz - xx).
    PRINT (" TIME REMAINING " + zz).
    WAIT 1.
    if zz = 6 {
        STAGE.
        SET THROTTLE TO 1.0.
        PRINT (" ENGINE IGNITION ").
    }
}

PRINT (" LIFTOFF ").
STAGE.
SET THROTTLE TO 1.0.
SET STEERING TO UP.

WAIT UNTIL altitudine > 400.0.
PRINT(" MAIN ENGINE CUT OFF ").
SET THROTTLE TO 0.0.
SET STEERING TO UP.
SET cvv TO 1.

WAIT UNTIL altitudine < 375.0.
PRINT (" LANDING BURN START ").
SET THROTTLE TO 1.0.
SET STEERING TO UP.
LEGS ON.

LOCK velocità1 TO SHIP:VELOCITY:SURFACE:mag.
WAIT UNTIL velocità1 < 7.0.
UNTIL altitudine < 9 {
     LOCK forzaM TO MAXTHRUST.
     LOCK massa TO MASS.
     LOCK weight TO (MASS * 9.81).
     LOCK ttwr TO (weight / forzaM).
     LOCK THROTTLE TO (ttwr).
     LOCK STEERING TO UP.
     PRINT (forzaM).
     PRINT (massa).
     PRINT (weight).
     PRINT (ttwr).
}

WAIT 0.5.
SET THROTTLE TO 0.0.
PRINT (" WE ARE LANDED ").