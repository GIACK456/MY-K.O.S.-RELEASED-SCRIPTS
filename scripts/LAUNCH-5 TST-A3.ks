CLEARSCREEN.
SAS OFF.

SEt tminus TO 0.
SET delta_v TO 0.
SET delta_v_needeed TO 0.
SET countdown TO 0.
SET delta_v_afetr TO 0.
SET burn_duration TO 0.
SET burn_duration_halved TO 2.
SET velocyty_apo TO 0.
SET velocyty_semi TO 0.
SET countdownChecker TO 100.
SET mass_burn TO 0.
SET ènumero_di_nepero TO CONSTANT:e.
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




SET velocyty_apo TO ( sqrt(gm / apoapiss )).

SET angular_momentum TO ((sqrt(((2 * gm) / 2) * 2)) * (sqrt((apoapiss * periapiss) / (apoapiss + periapiss)))).

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET velocyty_semi TO ( angular_momentum / apoapiss ).

SET delta_v_needeed TO velocyty_apo- velocyty_semi.

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( ènumero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).

PRINT (burn_duration_halved).

WAIT UNTIL time_to_apo < burn_duration_halved.

SET THROTTLE TO 1.0.

WAIT 5.

SET THROTTLE TO 0.0.