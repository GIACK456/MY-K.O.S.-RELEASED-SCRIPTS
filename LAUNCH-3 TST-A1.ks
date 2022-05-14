CLEARSCREEN.
SET cvv TO 0.
WAIT 19.
PRINT "T REMAINING 11". 
WAIT 5.
STAGE.
PRINT ("ENGINE START").
SET STEERING TO UP.
SET THROTTLE TO 0.2.
WAIT 6.
GEAR OFF.
SET THROTTLE TO 1.0.
SET STEERING TO UP.
LOCK altitudine TO ALT:RADAR.
WAIT UNTIL TRUE.
WHEN altitudine > 400.0 THEN {
    SET THROTTLE TO 0.0.
    SET STEERING TO UP.
    SET cvv TO 1.
    PRINT("GHF").
} 
WAIT UNTIL TRUE.

 WHEN cvv = 1 THEN {
     WHEN altitudine < 400.0 THEN {
         SET THROTTLE TO 1.0.
         SET STEERING TO UP.
         LEGS ON.
         SET velocità TO SHIP:VELOCITY:SURFACE.
         WHEN velocità < 7.0 THEN {
             SET forzaM TO MAXTHRUST.
             SET massa TO MASS.
             SET weight TO (MASS * 9.81).
             SET ttwr TO (weight / forzaM).
             SET THROTTLE TO (ttwr).
             SET STEERING TO UP.
         }
         WAIT UNTIL TRUE.
     }
     WAIT UNTIL TRUE.
 }
WAIT UNTIL TRUE.

