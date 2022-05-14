CLEARSCREEN.


AG2 OFF.
AG20 ON.

WAIT UNTIL AG2 = AG20.




SET trget TO VESSEL("CLEG-RTGET-SAT").

SET LAT TO 17 + (1 / (60 / 49)) + (0.01 / (60 / 24)).

SET LANdF TO LATLNG(LAT,0).

LOCK DRYMASS TO SHIP:DRYMASS.
SET isp TO 295.
SET numero_di_nepero TO 2.71828182845904523536.
SET thrust TO 96.

SET GM TO 6.5138398*10^10 .

SET wapoapiss TO (10000 + 200000).


SET velocyty_apo TO ( sqrt(gm / ((apoapsis + periapsis + 400000) / 2) )).

SET angular_momentum TO ((sqrt(((2 * gm) / 2) * 2)) * (sqrt((wapoapiss * ((periapsis + apoapsis + 400000) / 2)) / (wapoapiss + ((periapsis + apoapsis + 400000) / 2))))).

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET velocyty_semi TO ( angular_momentum / ((periapsis + apoapsis + 400000) / 2) ).

SET delta_v_needeed TO velocyty_semi - velocyty_apo.

IF delta_v_needeed < 0 {
    SET delta_v_needeed TO delta_v_needeed * -1.
}

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).

SET STEERING TO RETROGRADE.
WAIT 20.

SET THROTTLE TO 1.0.

SET x TO time.

SET y TO 0.

UNTIL y > burn_duration {
    SET y TO time - x.
    SET STEERING TO RETROGRADE.
}

SET THROTTLE TO 0.0.


WAIT UNTIL ORBIT:ETA:periapsis < 0.

SET WARP TO 0.

SET he TO SHIP:GROUNDSPEED.


SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET delta_v_afetr TO ( delta_v - he ).

SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET STEERING TO UP + R (0,90,0).
WAIT 20.

SET THROTTLE TO 1.0.

SET x TO time.

SET y TO 0.

UNTIL y > burn_duration {
    SET y TO time - x.
    SET STEERING TO UP + R (0,90,0).
}

SET THROTTLE TO 0.0.


SET STEERING TO SHIP:VELOCITY:SURFACE * -1.

WAIT UNTIL ALT:RADAR < 5000.

SET STEERING TO SHIP:VELOCITY:SURFACE * -1.

WAIT UNTIL ALT:RADAR < 1600.

SET STEERING TO SHIP:VELOCITY:SURFACE * -1.

UNTIL ABS(SHIP:VERTICALSPEED) < 30 {
    SET THROTTLE TO 1.0.
}

UNTIL ALT:RADAR < 100 {
    SET THROTTLE TO 1 / ((MAXTHRUST / MASS) / 1.63).
    SET STEERING TO SHIP:VELOCITY:SURFACE * -1.
}


SET THROTTLE TO 1.0.

SET STEERING TO UP.

WAIT UNTIL (SHIP:VERTICALSPEED * -1) < 5.

SET THROTTLE TO 1 / ((MAXTHRUST / MASS) / 1.63).

WAIT UNTIL ALT:RADAR < 6.

WAIT 1.

SET THROTTLE TO 0.0.

AG2 OFF.


WAIT UNTIL AG2 = AG20.

STAGE.

WAIT 0.5.

RCS ON.

SET STEERING TO UP.

SET THROTTLE TO 1.0.

WAIT 0.1.

STAGE.

WAIT UNTIL ALT:RADAR > 200.

SET STEERING TO UP + R (0,-45,0).

WAIT UNTIL APOAPSIS > 50000.

SET THROTTLE TO 0.0.

RCS OFF.

SET WAPOAPISS TO 50000.

SET velocyty_apo TO ( sqrt(gm / ((wapoapiss + 200000) / 2) )).

SET angular_momentum TO SQRT( 2 * gm) * SQRT(((apoapsis + 200000) * (periapsis + 200000)) / (apoapsis + periapsis + 400001)).

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET velocyty_semi TO ( angular_momentum / (apoapsis + 200000)).

SET delta_v_needeed TO velocyty_semi - velocyty_apo.

IF delta_v_needeed < 0 {
    SET delta_v_needeed TO delta_v_needeed * -1.
}

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).

WAIT UNTIL ORBIT:ETA:apoapsis < burn_duration_halved - 20.

SET STEERING TO PROGRADE.

WAIT 20.

SET x TO time.

SET y TO 0.

SET THROTTLE TO 1.0.

UNTIL y > burn_duration {

    SET STEERING TO PROGRADE.

    SET y TO time - x.

}


SET THROTTLE TO 0.0.

AG2 OFF.

WAIT UNTIL AG2 = AG20.

SHUTDOWN.