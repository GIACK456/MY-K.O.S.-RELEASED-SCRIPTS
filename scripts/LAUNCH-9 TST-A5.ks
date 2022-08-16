CLEARSCREEN.



SET trget TO VESSEL("CLEG-RTGET-SAT").


SET LAT TO 17 + (1 / (60 / 49)) + (0.01 / (60 / 24)).

SET LANdF TO LATLNG(LAT,0).

LOCK DRYMASS TO SHIP:DRYMASS.
SET isp TO 295.
SET numero_di_nepero TO 2.71828182845904523536.
SET thrust TO 96.

SET GM TO 6.5138398*10^10 .

SET wapoapiss TO (TRGET:ORBIT:APOAPSIS + 200000).



AG20 ON.
WAIT UNTIL AG20 = AG2.
AG2 ON.
AG10 OFF.
WAIT UNTIL AG10 = AG2.

LOCK mean TO TRGET:ORBIT:ARGUMENTOFPERIAPSIS.
LOCK dfg TO ORBIT:ARGUMENTOFPERIAPSIS.
LOCK truet TO TRGET:ORBIT:TRUEANOMALY.

LOCK lan_us TO TRGET:ORBIT:LONGITUDEOFASCENDINGNODE.

LOCK lan_trgt TO ORBIT:LONGITUDEOFASCENDINGNODE.


LOCK fyfy TO ORBIT:TRUEANOMALY.

LOCK ang TO (360 - ((fyfy + lan_us + dfg) - (mean + truet + lan_trgt))).





SET wapoapiss TO (200000 + 10000).

SET timeTo TO ((SQRT( ((((wapoapiss + ((periapsis + apoapsis + 400000) / 2) / 2)) ^ 3) * 4 * (3.14 ^ 2)) / (GM) )) / 2).

SET anguvelu TO (360 / (((apoapsis + periapsis + 400000) * 2 * 3.14) / (SQRT((GM) / (periapsis + apoapsis + 400000))))).

SET anguveluu TO (360 / ((WAPOAPISS * 3.14 * 2) / (SQRT((GM) / (WAPOAPISS))))).

SET anguveluuu TO (anguvelu - anguveluu).

SET angular_momentum TO ((sqrt(((2 * gm) / 2) * 2)) * (sqrt((wapoapiss * ((periapsis + apoapsis + 400000) / 2)) / (wapoapiss + ((periapsis + apoapsis + 400000) / 2))))).

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET velocyty_semi TO ( angular_momentum / ((periapsis + apoapsis + 400000) / 2) ).

SET delta_v_needeed TO velocyty_semi - velocyty_apo.

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).

SET ang_burn_changhed TO anguveluuu * burn_duration_halved.

SET angChanghe TO timeTo * anguveluu.

SET angpart TO (angChanghe) + burn_duration_halved * anguveluuu.

SET angTot TO ang - angpart.

AG3 OFF.

SET x TO time.
SET y TO 0.
SET checker TO 0.

UNTIL checker = 1 {

    SET y TO time - x.
    IF y > ((angTot / angveluuu) - 100) {
        SET checker TO 1.0.
    }
}



SET WARP TO 0.0.

PRINT ("g" + burn_duration).

SET STEERING TO PROGRADE.

WAIT 90.

SET STEERING TO PROGRADE.

SET x TO 0.

UNTIL x = 10 {
    SET x TO x + 1.
    WAIT 1.
    SET STEERING TO PROGRADE.
    PRINT x.
}

SET x TO 0.

STAGE.
SET THROTTLE TO 1.0.

SET x TO time.
SET y TO 0.

UNTIL y > burn_duration {
    SET STEERING TO PROGRADE.
    WAIT 0.01.
    SET y TO time - x.
    PRINT x.
    SET THROTTLE TO 1.0.
    PRINT ("IWERTY").



}

SET THROTTLE TO 0.0.




SET THROTTLE TO 0.0.
SET checker TO 0.

SET velo TO velocity:mag.


UNTIL velo < 20 {
    SET STEERING TO RETROGRADE.
    IF (ALT:RADAR / (SHIP:VERTICALSPEED * -1)) < ((-1 * SHIP:VERTICALSPEED / (MAXTHRUST / MASS)) + 10) {
        SET THROTTLE TO 1.0.
    }
}

UNTIL ALT:RADAR < 40 {
    SET THROTTLE TO (1.63 / (MAXTHRUST / MASS)).
    SET STEERING TO RETROGRADE.
}

SET THROTTLE TO 1.0.

SET STEERING TO UP.

WAIT UNTIL VELOCITY < 4.

UNTIL ALT:RADAR < 7 {
    SET THROTTLE TO (1.63 / (MAXTHRUST / MASS)).
}

WAIT 1.

SET THROTTLE TO 0.0.

AG1 OFF.
AG2 ON.

WAIT UNTIL AG1 = AG2.

WAIT 10.

STAGE.

SET THROTTLE TO 1.0.

WAIT 6.

RCS ON.

SET STEERING TO UP+

STAGE.

WAIT UNTIL ALT:RADAR > 400.

SET STEERING TO UP + R(0,45,0).

WAIT UNTIL apoapsis > 50000.

SET THROTTLE TO 0.0.

SET velocyty_apo TO SQRT(GM / (apoapsis + 200000)).

SET angular_momentum TO SQRT(2 * GM) * SQRT(((APOAPSIS + 200000) * (PERIAPSIS + 200000)) / (APOAPSIS + PERIAPSIS + 200000 + 200000)).

SET velocyty_semi TO angular_momentum / (APOAPSIS + 200000).

SET velo_To_Kilu TO velocyty_semi - velocyty_apo.

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET delta_v_needeed TO velo_To_Kilu.

IF delta_v_needeed < 0 {
    SET delta_v_needeed TO delta_v_needeed * -1.
}

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).


WAIT UNTIL ORBIT:ETA:PERIAPSIS < (burn_duration_halved + 20).

SET velo_To_Kilu TO SHIP:GROUNDSPEED.

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET delta_v_needeed TO velo_To_Kilu.

IF delta_v_needeed < 0 {
    SET delta_v_needeed TO delta_v_needeed * -1.
}

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).
WAIT 20.

RCS OFF.

SET STEERING TO PROGRADE.

WAIT UNTIL ORBIT:ETA:PERIAPSIS < BURN_DURATION_HALVED.

SET x TO time.

SET y TO 0.

UNTIL y = burn_duration {
    SET y TO time - x.
    SET STEERING TO PROGRADE.
    SET THROTTLE TO 1.0.
}


SET THROTTLE TO 0.0.

AG2 OFF.
AG1 ON.

WAIT UNTIL AG2 = AG1.



SHUTDOWN.
