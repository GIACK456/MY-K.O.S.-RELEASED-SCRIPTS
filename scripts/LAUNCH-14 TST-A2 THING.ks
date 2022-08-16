CLEARSCREEN.
AG2 ON.
WAIT UNTIL AG3 = AG2.
WAIT 10.  //liftoff part

SET THROTTLE TO 0.2. 
STAGE.
SAS ON.
WAIT 6.

SET THROTTLE TO 1.0.
STAGE.     //liftoff
SAS OFF.

SET STEERING TO UP.

WAIT UNTIL altitude > 1000.
SET STEERING TO UP + R (0,-10,0).  //initial steering

WAIT UNTIL altitude > 5000.
SET STEERING TO UP + R (0,-15,0).  //secoundary steering

WAIT UNTIL altitude > 10000.

UNTIL altitude > 16000 {

    SET STEERING TO UP + R (0,-(15 + ((altitude - 10000) * 0.005833)),0).  //10 / 16 km steering loop
}

WAIT UNTIL altitude > 20000.
SET STEERING TO UP + R (0,-50,0).   //some more steering

WAIT UNTIL altitude > 25000.
SET STEERING TO UP + R (0,-55,0).

WAIT UNTIL altitude > 30000.  //main engine cutoff
SET THROTTLE TO 0.0.

RCS ON.  

WAIT 1.0.

AG7 ON.
STAGE.  //atge


WAIT 3.0.

SET STEERING TO UP + R (0,90,0).   //set to horizontal
WAIT 15.

LOCK STEERING TO UP + R (0,90,0).


if ADDONS:TR:AVAILABLE {         //trajectories check stuff
    if ADDONS:TR:HASIMPACT {
        PRINT ADDONS:TR:IMPACTPOS:LNG.
    } else {
        PRINT "Impact position is not available".
    }
} else {
    PRINT "Trajectories is not available.".
}



SET THROTTLE TO 1.0.

WAIT UNTIL ADDONS:TR:IMPACTPOS:LNG < -74.6.   // wair until it'll land in the right place
SET THROTTLE TO 0.0.

LOCK STEERING TO RETROGRADE.    //retrograde
BRAKES ON.

WAIT UNTIL altitude < 36000.    //surface retrograde
LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.

WAIT UNTIL altitude < 4000.   //attiva motore
SET THROTTLE TO 0.9.

WAIT UNTIL SHIP:VELOCITY:SURFACE:mag < 30.   //wait until velocity low
LOCK THROTTLE TO (MASS * 9.81 / MAXTHRUST).   //no acceleration down

WAIT UNTIL ALT:radar < 50.   //wait buntil altitude low
SET STEERING TO UP.
SET THROTTLE TO 1.0.

WAIT UNTIL SHIP:VELOCITY:SURFACE:mag < 7.   //wait utntil velo low again
LOCK THROTTLE TO (MASS * 9.81 / MAXTHRUST).// no accleleration down

WAIT UNTIL ALT:radar < 25.   //wait buntil altitude low
SET STEERING TO UP.
SET THROTTLE TO 1.0.

WAIT UNTIL SHIP:VELOCITY:SURFACE:mag < 3.   //wait utntil velo low again
LOCK THROTTLE TO (MASS * 9.81 / MAXTHRUST).// no accleleration down

WAIT UNTIL ALT:radar < 19.  //is landed
SET THROTTLE TO 0.0.

WAIT 10.

SHUTDOWN.