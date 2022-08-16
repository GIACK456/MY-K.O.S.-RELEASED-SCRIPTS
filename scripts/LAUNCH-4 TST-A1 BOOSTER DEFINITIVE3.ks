CLEARSCREEN.
SAS OFF.

SET cvv TO 0.
SET xx TO 0.
SET xz TO 100.
SET zz TO 0.
SET check TO 0.
LOCK aly TO ALT:RADAR.
LOCK velocità1 TO SHIP:VELOCITY:SURFACE:mag.

UNTIL xx = xz {
    SET xx TO xx + 1.
    SET zz TO (xz - xx).
    WAIT 1.

    if zz = 70 {
        AG1 ON.
    }

    if zz = 60 {
        AG1 OFF.
    }


     If zz = 68 {
          SAS OFF.
          SET STEERING TO UP +R(-90,90,-90).
     }

     If zz = 66 {

          SET STEERING TO UP +R(90,-90,-90).
     }

     If zz = 64 {

          SET STEERING TO UP +R(-90,-90,90).
     }

     If zz = 62 {

          SET STEERING TO ("KILL").
     }


    if zz = 50 {
        GEAR ON.
    }

    if zz = 40 {
        GEAR OFF.
    }

    if zz = 6 {
        STAGE.
        SET THROTTLE TO ((10 - zz) / 10 ).
    }

    if zz < 6 {
        SET THROTTLE TO ((10 - zz) / 10 ).
    }
}

STAGE.
WAIT 1.
SAS OFF.
SET STEERING TO UP +R(0,-1.199999999999,0).
SET THROTTLE TO 1.0.

WAIT UNTIL velocità1 > 342 OR AG5 = AG2 OR AG10 = AG2.
IF velocità1 > 342 {
}


WAIT UNTIL aly > 25000 OR AG5 = AG2 OR AG10 = AG2.
IF aly > 25000 {
     SET THROTTLE TO 0.6666666.
}

WAIT UNTIL aly > 33000 OR AG5 = AG2 OR AG10 = AG2.
IF aly > 33000 { 
     SET THROTTLE TO 0.333333.
}

WAIT UNTIL aly > 39500 OR AG5 = AG2 OR AG10 = AG2.
IF aly > 39000 {
     SET THROTTLE TO 0.05. 
}


WAIT UNTIL aly > 52000 OR AG5 = AG2 OR AG10 = AG2.
IF aly > 50000 {
     SET THROTTLE TO 0.0.
}


WAIT UNTIL aly > 55000 OR AG5 = AG2 OR AG10 = AG2.
IF aly > 50000 {
     STAGE.
     SET STEERING TO UP.
}

WAIT UNTIL aly > 70000 OR AG5 = AG2 OR AG10 = AG2.
IF aly > 70000 {
}

WAIT UNTIL aly > 83000 OR AG5 = AG2 OR AG10 = AG2.
IF aly > 83000 {
     SET check TO 1.
}

WAIT UNTIL aly < 70000 OR AG5 = AG2 OR AG10 = AG2.
IF aly < 70000 AND check > 0 {
}

WAIT UNTIL aly < 65000 OR AG5 = AG2 OR AG10 = AG2.
IF aly < 65000 AND check > 0 {
     AG1 ON.
     LOCK STEERING TO (-1) * SHIP:VELOCITY:ORBIT..
}


WAIT UNTIL aly < 36000 OR AG5 = AG2 OR AG10 = AG2.
IF aly < 36000 AND check > 0 {
     LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.
} 

IF AG5 = AG2 OR AG10 = AG2 {
    SET THROTTLE TO 0.0.
}

WAIT UNTIL aly < 8567 OR AG5 = AG2 OR AG10 = AG2.



IF aly < 8568 AND check > 0 {

     SET THROTTLE TO 1.0.
     AG1 ON.
     AG7 ON.

     LOCK forzaM TO MAXTHRUST.
     LOCK massa TO MASS.
     LOCK weight TO (MASS * 9.81).
     LOCK ttwr TO (weight / forzaM).

     LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.

     WAIT UNTIL velocità1 < 50.
     GEAR ON.
     LOCK THROTTLE TO ttwr.

     WAIT UNTIL aly < 43.65433.
     SET THROTTLE TO 1.0.

     WAIT UNTIL velocità1 < 6.
     LOCK THROTTLE TO (ttwr).

}



IF AG5 = AG2 OR AG10 = AG2 {
     
     SAS OFF.
     SET THROTTLE TO 0.0.
     AG1 ON.
     WAIT 10.8583875.
     AG7 ON.



     WAIT UNTIL aly < 1873.68925.
     SET THROTTLE TO 1.0.

     LOCK forzaM TO MAXTHRUST.
     LOCK massa TO MASS.
     LOCK weight TO (MASS * 9.81).
     LOCK ttwr TO (weight / forzaM).

     LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.

     WAIT UNTIL velocità1 < 50.
     GEAR ON.
     LOCK THROTTLE TO ttwr.

     WAIT UNTIL aly < 83.65433.
     SET THROTTLE TO 1.0.

     WAIT UNTIL velocità1 < 6.
     LOCK THROTTLE TO (ttwr).

}



WAIT UNTIL aly < 9.

WAIT 0.5.

SET THROTTLE TO 0.0.

WAIT UNTIL AG4 = AG2.

PRINT("shutting main computer down").

SHUTDOWN.

