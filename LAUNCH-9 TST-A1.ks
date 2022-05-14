CLEARSCREEN.
SAS OFF.

LOCK gd TO SHIP:GROUNDSPEED.
LOCK he TO SHIP:VERTICALSPEED * -1.

SET supposed_mass TO 0.
SET supposed_velo TO 0.
SET giro TO 0.
SET SUPPOSED_ALTITUDE TO 0.
SET x TO 0.
LOCK apoapiss TO apoapsis + 200000.
SET DRYMASS TO 7.3.
SET isp TO 295.
SET numero_di_nepero TO 2.71828182845904523536.
LOCK velo TO ship:velocity:surface:mag.
LOCK height TO ALTITUDE.
LOCK dist TO ALT:RADAR.
SET gm TO 6.514 * (10 ^ 10).
SET thrust TO 96.
SET periapiss TO 200000 + 25000.
LOCK apoapiss TO apoapsis + 200000.
AG10 ON.


LOCK we_gon_crash TO dist / velo.




WAIT UNTIL AG9 = AG10.
AG9 OFF.






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

SET mna TO ORBIT:MEANANOMALYATEPOCH.

WAIT UNTIL mna > 5.

RCS ON.

SET STEERING TO RETROGRADE.

WAIT 10.

SET SHIP:CONTROL:TOP TO 1.

WAIT 2.

STAGE.

SET THROTTLE TO 1.

WAIT 1.

RCS OFF.

WAIT burn_duration - 1.

SET THROTTLE TO 0.


SET periapiss TO -20000 + 200000.

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


WAIT UNTIL eta:periapsis < burn_duration_halved.

RCS ON.

SET STEERING TO RETROGRADE.

WAIT 10.

SET SHIP:CONTROL:TOP TO 1.

WAIT 2.

STAGE.

SET THROTTLE TO 1.

WAIT 1.

RCS OFF.

WAIT burn_duration - 1.

SET THROTTLE TO 0.





WAIT UNTIL height < 15000.

RCS ON.

LOCK STEERING TO RETROGRADE.

WAIT 5.

SET THROTTLE TO 1.0.

WAIT UNTIL velo < 400.

SET THROTTLE TO 0.0.

SET STEERING TO UP + R (0,90,0).

WAIT UNTIL height < 10000.

SET THROTTLE TO 1.0.

WAIT UNTIL gd < 11.

SET THROTTLE TO 0.0.

PRINT(he).
PRINT(we_gon_crash).
PRINT(dist).

LOCK STEERING TO RETROGRADE.

SET supposed_altitude TO dist.

UNTIL x = 1 {

    SET supposed_altitude TO dist - giro.
    SET supposed_mass TO mass.

    UNTIL supposed_velo < 10 {

        SET supposed_mass TO supposed_mass - (0.1 * (thrust / (isp * 9.81))).

        SET supposed_acceleration TO (0.1 * ((thrust / supposed_mass) - 1.63)).

        SET supposed_velo TO supposed_velo - supposed_acceleration.
        
        SET supposed_altitude TO supposed_altitude - (0.1 * supposed_velo).

        IF (supposed_altitude < 10 AND supposed_altitude > 0) AND (supposed_velo < 10 AND supposed_velo > 0) {
            SET x TO 1.
        }
    }
    SET giro TO giro + 1.
}

PRINT (supposed_altitude).


WAIT UNTIL alti < supposed_altitude + 3.




SET THROTTLE TO 1.0.

WAIT UNTIL velo < 9.

LOCK THROTTLE TO (1 / (thrust / mass)).

WAIT UNTIL height < 9.

WAIT 1.

SET THROTTLE TO 0.0.




















WAIT 20.



STAGE.
SET THROTTLE TO 1.0.
SET STEERING TO UP.

RCS ON.

STAGE.

WAIT 2.


SET STEERING TO UP +R (0,45,0).

WAIT UNTIL apoapiss > 250000.

SET THROTTLE TO 0.0.

SET thust TO 10.

SET periapiss TO 250000.

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


WAIT UNTIL eta:periapsis + 5 < burn_duration_halved.


SET STEERING TO PROGRADE.

WAIT 5.

SET THROTTLE TO 1.0.

WAIT burn_duration_halved.

WAIT burn_duration_halved.

SET THROTTLE TO 0.0.

