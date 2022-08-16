CLEARSCREEN.
WAIT 30.
STAGE.
SET STEERING TO UP +R(0,0,0).
SET THROTTLE TO 1.0.
WAIT 1.
LOCK altitudine TO ALT:RADAR.
PRINT (altitudine).
UNTIL altitudine > 100 {
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



SET THROTTLE TO 0.2.