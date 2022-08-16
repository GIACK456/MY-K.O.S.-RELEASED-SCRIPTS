CLEARSCREEN.
SET x TO 0.
SET io TO 100.

UNTIL x = io {      
   WAIT 1.
   PRINT("T REMAINING " + (io - x)).
   SET x to x + 1.
   SET THROTTLE TO 1.0.
       if (io - x) = 4 {
           STAGE.
           PRINT ("ENGINE START").
       }
}

WAIT 1.
STAGE.
PRINT ("LIFTOFF").
LOCK STEERING TO UP.
LOCK THROTTLE TO 1.0.
WAIT (2).
WAIT 42.5.

SET pre TO 0.
UNTIL pre = 15 {
    WAIT 1.
    SET rpe TO (pre / -0.333).
    LOCK STEERING TO UP +R(0,rpe,0).
    SET pre TO (pre + 1).
    PRINT ("STEERING TO " + rpe).
}

wait 3.
STAGE.

SET y TO 0.
UNTIL y = 41 {
    WAIT 1.
    SET t TO (rpe + (y / -1.698)).
    LOCK STEERING TO UP +R(0,t,0).
    SET y TO (y + 1).
    PRINT ("STEERING TO " + t).
    IF t > 75{
        LOCK t TO 75.
    }
}
WAIT 30.
PRINT ("READY FOR STAGE SEPARATION").
STAGE.
LOCK STEERING TO UP +R(0,-87.6,0).
WAIT 15.
PRINT ("READY FOR FAYRING DEPLOY").
WAIT (5).
STAGE.
LOCK THROTTLE TO 1.0.