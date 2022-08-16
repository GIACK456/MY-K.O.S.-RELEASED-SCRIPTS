CLEARSCREEN.
AG2 ON.
SET wantedapo TO 70000.

UNTIL AG3 = AG2 {
    PRINT("Press 5 to increase wanted apoapsis, press 3 to select").
    PRINT(wantedapo).
    IF AG2 = AG5 {
        AG5 OFF.
        AG2 ON.
        SET wantedapo TO wantedapo + 10000.
    }
    CLEARSCREEN.
    AG2 ON.

}
AG2 ON.

AG3 ON. // to do the prelaunch blocking
PRINT("Liftoff in 10 secs").
PRINT("Going at" + wantedapo).

IF ALT:radar < 60000{   //programm reactivates after swapping, needed to don't mess up with orbit

    AG2 ON.

    WAIT UNTIL AG2 = AG7.   //stage
    SET STEERING TO UP + R (0,-55,0).

    WAIT 1.
    AG10 ON.  //activate secoundary engine

    WAIT 2.
    AG9 ON.
    SET THROTTLE TO 0.2.  //low throttle

    WAIT 1.
    SET THROTTLE TO 0.5. //semi high throttle

    WAIT 2.
    SET THROTTLE TO 1.0.
    SET STEERING TO UP + R (0,-70,0).  //higher throttle

    WAIT UNTIL altitude > 50000.  //fairing
    AG8 ON.

    WAIT UNTIL APOAPSIS > wantedapo.  //reached good apo
    SET THROTTLE TO 0.0.
    }

//data for orbital 
SET apoapiss TO apoapsis + 600000.
SET periapiss TO periapsis + 600000.
SET isp TO 316.
LOCK time_to_apo TO ORBIT:ETA:apoapsis.
SET gm TO bOdY:mU.
SET numero_di_nepero TO CONSTANT:e.
SET DRYMASS TO SHIP:DRYMASS.
SET thrust TO 300.



SET velocyty_apo TO ( sqrt(gm / apoapiss )).  // circular orbit velocity
SET angular_momentum TO ((sqrt(2 * gm)) * (sqrt((apoapiss * periapiss) / (apoapiss + periapiss)))).  //velocity apo
SET delta_v TO (((ln(MASS / SHIP:DRYMASS)) * 9.81 ) * isp).  //delta v
SET velocyty_semi TO ( angular_momentum / apoapiss ).    //actual velocity apo
SET delta_v_needeed TO velocyty_apo- velocyty_semi.  //delta c needed, velo tot - velo apo
SET delta_v_afetr TO ( delta_v - delta_v_needeed ).  // the delta v that will remain afyter the monouver
SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).  //the mass that'll remain fater the manouver
SET mass_burn TO ( mass - mass_end ).  // tre total mass to burn
SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).  //the mass burned at second
SET burn_duration TO ( mass_burn / mass_consumption_rato ).  // the duration of the burn
SET burn_duration_halved TO ( burn_duration / 2 ).  // the time to start

PRINT (burn_duration_halved).

LOCK STEERING TO PROGRADE.

WAIT UNTIL time_to_apo < burn_duration_halved.
SET THROTTLE TO 1.0.    //circularization burn
WAIT burn_duration.

SET THROTTLE TO 0.0.


SHUTDOWN.