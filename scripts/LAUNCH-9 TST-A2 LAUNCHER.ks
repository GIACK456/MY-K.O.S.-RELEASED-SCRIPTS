CLEARSCREEN.

SET timer TO 100.
SET tir TO 0.
SET tri TO 0.
SET gm TO 3.5316000 * (10^12).
SET isp TO 380.
SET thrust TO 456.

LOCK time_to_apo TO ORBIT:ETA:APOAPSIS.
LOCK height TO ALTITUDE.
LOCK periapiss TO periapsis + 600000.
LOCK aposapiss TO apoapsis + 600000.
LOCK stuffThtaGetsBurned TO STAGE:LIQUIDFUEL.
LOCK drymass TO SHIP:DRYMASS.
SET e TO 2.71828182845.

UNTIL tir > timer {

    SET tri TO 100 - tir.
    PRINT (tri).

    WAIT 1.
    SET TIR TO TIR + 1.

    IF (TIR = 30) {
        AG3 ON.
    }

    IF (TIR = 40) {
        AG4 ON.
    }

    IF (TIR = 60) {
        AG5 ON.
    }

    IF (TIR = 70) {
        AG10 ON.
    }

    IF (TIR = 80) {
        AG9 ON.
    }

    IF (TIR = 94) {
        STAGE.
        WAIT 1.
        STAGE.
        WAIT 1.
        STAGE.
        PRINT ("IGNITION SEQUENCE START").
        SET THROTTLE TO 6.0.
    }

    IF (TIR > 94) {
        SET THROTTLE TO (1 / (100 - TIR + 0.1)).
    }
}

SET THROTTLE TO 1.0.

WAIT 1.

STAGE.


SET STEERING TO UP + R (0,0,180).


WAIT UNTIL height > 1000.

SET STEERING TO UP +R (0,-10,180).

PRINT ("GH").

UNTIL MAXTHRUST < 2700 {


WAIT 0.

PRINT (MAXTHRUST).

PRINT ("GY").


}

STAGE.

WAIT 1.

STAGE.


WAIT UNTIL height > 7000.

SET STEERING TO UP +R (0,-15,180).


WAIT UNTIL height > 10000.

LOCK STEERING TO UP + R (0,-(((height - 10000) / 200 ) + 15),180).

WAIT UNTIL height > 16000.

SET STEERING TO UP + R (0,-45,180).

WAIT UNTIL height > 25000.

SET STEERING TO UP + R (0,-55,180).

WAIT UNTIL height > 35000.

SET STEERING TO UP + R (0,-65,180).

WAIT UNTIL stuffThtaGetsBurned = 0.

STAGE.

WAIT 1.

STAGE.

WAIT 1.

STAGE.

WAIT UNTIL height > 44000.

SET STEERING TO UP + R (0,-70,180).

WAIT UNTIL height > 60000.

SET STEERING TO UP + R (0,-76,180).

WAIT UNTIL height > 60000.

WAIT 1.

AG2 ON.
AG2 ON.

WAIT UNTIL aposapiss > 800000.


SET THROTTLE TO 0.

SET velocyty_apo TO ( sqrt(gm / aposapiss )).

SET angular_momentum TO ((sqrt(((2 * gm) / 2) * 2)) * (sqrt((aposapiss * periapiss) / (aposapiss + periapiss)))).

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET velocyty_semi TO ( angular_momentum / aposapiss ).

SET delta_v_needeed TO velocyty_apo - velocyty_semi.

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( e ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).

UNTIL time_to_apo < burn_duration_halved {
    SET STEERING TO PROGRADE.
}


SET THROTTLE TO 1.0.

SET x TO time.
SET y TO 0.

AG99 ON.
AG98 ON.

UNTIL y > burn_duration {
    SET STEERING TO PROGRADE.
    SET y TO time - x.
}

SET THROTTLE TO 0.0.

AG20 ON.
AG2 OFF.

AG98 OFF.
AG97 ON.

WAIT UNTIL AG10 = AG2.

AG20 ON.

STAGE.



WAIT 20.

SET STEERING TO UP + R (0,90,0).

WAIT 20.

SET THROTTLE TO 0.3.

WAIT 2.

SET THROTTLE TO 0.0.


SET STEERING TO RETROGRADE.

WAIT 10.

SET THROTTLE TO 1.0.

WAIT 7.

SET THROTTLE TO 0.0.


SHUTDOWN.





