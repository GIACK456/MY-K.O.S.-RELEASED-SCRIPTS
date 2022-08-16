CLEARSCREEN.
SAS OFF.

Set wanted_apoapiss TO 130000.
SET b TO 0.
SET c TO 0.

SEt tminus TO 0.
SET countdownChecker TO 100.
SET countdown TO 0.

SET delta_v TO 0.
SET delta_v_needeed TO 0.
SET delta_v_afetr TO 0.
SET burn_duration TO 0.
SET burn_duration_halved TO 2.
SET velocyty_apo TO 0.
SET mass_burn TO 0.
SET numero_di_nepero TO CONSTANT:e.
SET roll TO 0.
SET rick_roll TO roll.
SET ptch TO 0.
SET velocyty_semi TO 0.

LOCK thrusty TO ship:MAXTHRUST.

LOCK fuel TO STAGE:LIQUIDFUEL.
SET mass_end TO 0.
SET mass_consumption_rato TO 0.
SET isp TO 315.
SET thrust TO 10.0.
SET angular_momentum TO 0.
LOCK DRYMASS TO SHIP:DRYMASS.
LOCK height TO SHIP:ALTITUDE.
LOCK apoapiss TO (apoapsis + ( 300000 * 2 )).
LOCK periapiss TO (periapsis + (200000 * 3)).
LOCK mass_ship TO SHIP:mass.
LOCK time_to_apo TO ORBIT:ETA:apoapsis.
LOCK gm TO bOdY:mU.





until countdown = countdownChecker {

    SET countdown TO countdown + 1.
    SET tMinus To countdownChecker - countdown.

    PRINT (" T-" + tMinus).
    WAIT 1.

    IF countdown = 80 {
        AG1 On.
        AG2 oN.
        AG3 ON.
        AG10 ON.
    }

    IF countdown = 94 {
        STAGE.
        PRINT (" We have ignition ").
        SET THROTTLE TO 0.0.
        AG1 ON.
        AG1 OFF.
        AG10 OFF.
        AG10 ON.
    }

    IF countdown > 94 {
        SET THROTTLE TO ((10 - tMinus) / 10).
    }

}

SET THROTTLE TO 0.92453.


WAIT 0.5.
AG10 OFF.
AG10 ON.

WAIT 1.
STAGE.
SET STEERING TO UP.
PRINT (" We have liftoff ").

WAIT 5.


WAIT UNTIL height > 301.
SET STEERING TO UP +R(0,-5.11,c).

WAIT UNTIL height > 5000.
SET STEERING TO UP +R(0,-15.7,c).

WAIT UNTIL height > 10000.
SET STEERING TO UP +R(0,-20.7,b).

WAIT UNTIL height > 1100.
SET STEERING TO UP +R(0,-25.7,b).

WAIT UNTIL height > 12000.
SET STEERING TO UP +R(0,-30.7,b).

WAIT UNTIL height > 13000.
SET STEERING TO UP +R(0,-35.7,b).

WAIT UNTIL height > 13500.
SET STEERING TO UP +R(0,-42.7,b).

WAIT UNTIL height > 13700.
SET STEERING TO UP +R(0,-44.466467,b).

//WAIT UNTIL height > 20000.
//SET STEERING TO UP +R(0,-55.6767,b).

WAIT UNTIL height > 30000.
LOCK STEERING TO UP +R(0,-60.3366353,b).

AG10 OFF.
WAIT 0.1.
AG10 ON.

WAIT UNTIL MAXTHRUST = 0.

WAIT 1.

SET THROTTLE TO 0.0.
STAGE.

WAIT 0.5.

WAIT 0.5.


SET THROTTLE TO 1.0.

AG10 OFF.
WAIT 2.
AG10 ON.



WAIT UNTIL height > 50000.

AG10 oN.
WAIT 0.000000000000000000000001.

WAIT 3.
STAGE.

WAIT UNTIL height > (35000 * 2).

SET STEERING TO UP -R(0,+64,b).

WAIT 3.

AG4 On.
WAIT 0.0000000000000000000000001.

WAIT UNTIL apoapsis > wanted_apoapiss.

SET THROTTLE TO 0.012333.

WAIT 2.

SET THROTTLE TO 0.0.

LOCK STEERING TO PROGRADE.





SET velocyty_apo TO ( sqrt(gm / apoapiss )).

SET angular_momentum TO ((sqrt(((2 * gm) / 2) * 2)) * (sqrt((apoapiss * periapiss) / (apoapiss + periapiss)))).

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET velocyty_semi TO ( angular_momentum / apoapiss ).

SET delta_v_needeed TO velocyty_apo- velocyty_semi.

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).

PRINT (burn_duration_halved).

WAIT UNTIL time_to_apo < burn_duration_halved.

SET THROTTLE TO 1.0.

WAIT burn_duration.

SET THROTTLE TO 0.0.

WAIT UNTIL ag8 <> SAS.

STAGE.


WAIT UNTIL AG7 <> SAS.

LOCK STEERING TO RETROGRADE.

WAIT 5.

SET THROTTLE TO 1.0.

WAIT burn_duration_halved.

STAGE.

SHUTDOWN.



