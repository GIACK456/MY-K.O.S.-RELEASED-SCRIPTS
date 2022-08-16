CLEARSCREEN.
SAS OFF.

Set wanted_apoapiss TO 150000.
SET rol TO 0.
SET ptch TO 0.


SEt tminus TO 0.
SET delta_v TO 0.
SET delta_v_needeed TO 0.
SET countdown TO 0.
SET delta_v_afetr TO 0.
SET burn_duration TO 0.
SET burn_duration_halved TO 2.
SET velocyty_apo TO 0.
SET roll TO rol.
SET rick_roll TO roll.
SET velocyty_semi TO 0.
SET countdownChecker TO 100.
SET mass_burn TO 0.
SET numero_di_nepero TO CONSTANT:e.
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

    IF countdown = 94 {
        STAGE.
        PRINT (" We have ignition ").
        SET THROTTLE TO 0.0.
        AG2 ON.
        AG2 OFF.
    }

    IF countdown > 94 {
        SET THROTTLE TO ((10 - tMinus) / 10).
    }

}
AG1 ON.

SET THROTTLE TO 0.75.

WAIT 1.
STAGE.
SET STEERING TO UP.
PRINT (" We have liftoff ").

WAIT 5.
AG2 ON.
WAIT 0. 00000000000000000000001.
AG2 OFF.

WAIT UNTIL height > 301.
SET STEERING TO UP +R(-5.11,roll,pitch).

WAIT UNTIL height > 5000.
SET STEERING TO UP +R(-15.7,rick_roll,pitch).

WAIT UNTIL height > 10000.
SET STEERING TO UP +R(-20.7,rick_roll,pitch).

WAIT UNTIL height > 1100.
SET STEERING TO UP +R(-25.7,rol, pitch).

SET mass_consumptin_rate TO "tre ay im la  te r equa i n  ".

WAIT UNTIL height > 12000.
SET STEERING TO UP +R(-30.7,rick_roll,pitch).

WAIT UNTIL height > 13000.
SET STEERING TO UP +R(-35.7,rick_roll,pitch).

WAIT UNTIL height > 13500.
SET STEERING TO UP +R(-42.7,rick_roll,pitch ).

WAIT UNTIL height > 13700.
SET STEERING TO UP +R(-44.466467,roll,pitch).

WAIT UNTIL height > 20000.
SET STEERING TO UP +R(-55.6767,roll,pitch).

WAIT UNTIL height > 30000.
SET STEERING TO UP +R(-65.3366353,roll,pitch).

AG3 ON.
WAIT 0.00000000000000000000001.
AG3 OFF.


WAIT UNTIL fuel = 0.

WAIT 1.
STAGE.
WAIT 1.
STAGE.

SET THROTTLE TO 1.0.

WAIT 2.
AG4 ON.
WAIT 0.000000000000000000000001.
AG4 OFF.


WAIT UNTIL height > 40000.

SET STEERING TO UP +R(-78,roll,pitch).

WAIT UNTIL height > 50000.

Ag5 oN.
WAIT 0.000000000000000000000001.
aG5 OfF.

WAIT 3.
STAGE.

WAIT 3.

aG4 On.
WAIT 0.0000000000000000000000001.
Ag4 OfF.

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


WAIT UNTIL AG7 <> SAS.

LOCK STERRING TO RETROGRADE.

SET THROTTLE TO 1.0.

WAIT burn_duration_halved.



