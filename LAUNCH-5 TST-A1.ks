CLEARSCREEN.


SET tMinus TO 0.
SET orbe_velo_tot TO 0.
SET countdownChecker TO 100.
SET countdown TO 0.
LOCK the TO MAXTHRUST.
SET orientetaion TO 0.
SET delat_v TO 0.
SET angular_momentum TO 66426464626246.876543.
SET preliminary_mass_to_burn TO 0.0.
SET absolutevalueoforbitpreliminaryminusorbitabsulute TO 0.
SET orbe_velo_apo TO 0.
LOCK the_amount_of_weight_of_the_dhip_how_much_stuff_is_in_there TO SHIP:MASS.
SET start_tie TO 0.
DECLARE e TO 2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738418793070800183000.
LOCK timT0_apotap TO ORBIT:ETA:apoapsis.
SET burn_tyme TO SQRT(3.5216000 * (10 ^ 12) / (200000 + (30 * 1000) + (20 * 1000) + (10 * 1000)) ).
SET needed_mass_to_burn TO 446766255276265627 + "there is a way o simulate 4m4n b4r4in, we work on craeting connection be t wn at i s e nd or s ored inf m tn in mem rr y,                                                                                                                                                                                                                      s hld e lso wby o i u late future it qa ton, ".
SET eng_isp TO 315.
SET delat_veeeeeeeeedsvvadgavgueagbusruhodea TO 0.
LOCK isp TO eng_isp.
LOCK enginevelo TO isp * 9.81.
LOCK fuel TO STAGE:LIQUIDFUEL.
LOCK periapiss TO periapsis + (300000 * 2).
LOCK height TO SHIP:ALTITUDE.
SET gm TO BODY:MU.

LOCK timewhenburn TO "hehdhqwuicquiqcllo".

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
SET STEERING TO UP +R(0,-5.11,0).

WAIT UNTIL height > 5000.
SET STEERING TO UP +R(0,-15.7,0).

WAIT UNTIL height > 10000.
SET STEERING TO UP +R(0,-20.7,0).

WAIT UNTIL height > 1100.
SET STEERING TO UP +R(0,-25.7,0).

SET mass_consumptin_rate TO "tre ay im la  te r equa i n  ".

WAIT UNTIL height > 12000.
SET STEERING TO UP +R(0,-30.7,0).

WAIT UNTIL height > 13000.
SET STEERING TO UP +R(0,-35.7,0).

WAIT UNTIL height > 13500.
SET STEERING TO UP +R(0,-42.7,0).

WAIT UNTIL height > 13700.
SET STEERING TO UP +R(0,-44.466467,0).

WAIT UNTIL height > 20000.
SET STEERING TO UP +R(0,-55.6767,0).

WAIT UNTIL height > 30000.
SET STEERING TO UP +R(0,-65.3366353,0).

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

SET STEERING TO UP +R(0,-78,0).

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

WAIT UNTIL apoapsis > 200000.

SET THROTTLE TO 0.012333.

WAIT 2.

SET THROTTLE TO 0.0.

LOCK STEERING TO PROGRADE.

SET orbe_velo_tot TO sqrt(gm/(apoapsis + 600000)).

PRINT ("final orbit velo" + orbe_velo_tot).

SET angular_momentum TO (sqrt(2 * gm)) * (sqrt((periapiss  * (apoapsis + 600000)) * (periapiss + (apoapsis + 600000))) ).

PRINT (angular_momentum).

SET orbe_velo_apo TO angular_momentum / 800000.

SET delat_v TO (315 * 9.81 * (ln(the_amount_of_weight_of_the_dhip_how_much_stuff_is_in_there / 0.6))).

SET absolutevalueoforbitpreliminaryminusorbitabsulute TO  (orbe_velo_tot - orbe_velo_apo).

SET delat_veeeeeeeeedsvvadgavgueagbusruhodea TO delat_v - absolutevalueoforbitpreliminaryminusorbitabsulute.

PRINT (delat_veeeeeeeeedsvvadgavgueagbusruhodea).

SET preliminary_mass_to_burn TO (e ^ ((delat_veeeeeeeeedsvvadgavgueagbusruhodea / 9.81) / 315 )) * 0.6.

SET needed_mass_to_burn TO the_amount_of_weight_of_the_dhip_how_much_stuff_is_in_there - preliminary_mass_to_burn.

SET mass_consumptin_rate TO the / (isp * 9.81).

SET burn_tyme TO needed_mass_to_burn / mass_consumptin_rate.

PRINT (preliminary_mass_to_burn).

WAIT start_tie.

WAIT start_tie.

SET THROTTLE TO 1.0.

WAIT start_tie.

WAIT start_tie.

SET THROTTLE TO 0.0123333.

WAIT 2.

SET THROTTLE TO 0.0.

