CLEARSCREEN.

//added vlaues to vars, 
LOCK DRYMASS TO SHIP:DRYMASS.
SET isp TO 355.
SET numero_di_nepero TO 2.71828182845904523536.
SET thrust TO 125.
SET GM TO 3.5316000 * 10^12.
SET wapoapiss TO 11300000.    //wanted apoapsis to touch the mun

AG20 ON.    //check when do
AG2 OFF.

WAIT UNTIL AG20 = AG2.


//setting targ to mun, so then we get orbital data of it
SET trget TO BODY ("MUN").

//locking of data of Mun
LOCK mean TO TRGET:ORBIT:ARGUMENTOFPERIAPSIS.
LOCK dfg TO ORBIT:ARGUMENTOFPERIAPSIS.
LOCK truet TO TRGET:ORBIT:TRUEANOMALY.
LOCK lan_us TO TRGET:ORBIT:LONGITUDEOFASCENDINGNODE.
LOCK lan_trgt TO ORBIT:LONGITUDEOFASCENDINGNODE.
LOCK fyfy TO ORBIT:TRUEANOMALY.


//calculates current angle
LOCK ang TO (360 - ((fyfy + lan_trgt + dfg) - (mean + truet + lan_us))).
//gets the semimajoraxis
SET a TO ((wapoapiss + ((periapsis + apoapsis + 1200000) / 2)) / 2 ).
//gets the time to get to apoapsis
SET timeTo TO (SQRT((a^3) * (4 * (3.14 ^ 2)) / GM) / 2).
//gets the angular velocity of the me 
SET angvelu TO (360 / (SQRT(((((apoapsis + periapsis + 1200000) / 2) ^ 3) * ( (3.14) ^ 2 ) * 4) / (2 * GM)))).
//gets the angular velocity of the mun
SET anguveluu TO (360 / ( (12000000 * 2 * 3.14) / (SQRT(GM / 12000000)))).
//calculates the relative angular velocity
SET angveluuu TO angvelu - anguveluu.
//calculates the velocity at vich is going
SET velocyty_apo TO ( sqrt(gm / ((apoapsis + periapsis + 1200000) / 2) )).
//calculates velocity of orbit at vich should go
SET angular_momentum TO ((sqrt(((2 * gm) / 2) * 2)) * (sqrt((wapoapiss * ((periapsis + apoapsis + 1200000) / 2)) / (wapoapiss + ((periapsis + apoapsis + 1200000) / 2))))).
//calcuates the delta v 
SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).
//gets the velocity needed
SET velocyty_semi TO ( angular_momentum / ((periapsis + apoapsis + 1200000) / 2) ).
//gets the delta v needed
SET delta_v_needeed TO velocyty_semi - velocyty_apo.
//gets the delta v that will remain
SET delta_v_afetr TO ( delta_v - delta_v_needeed ).
//gets mass that will remain
SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).
//gets the mass to burn
SET mass_burn TO ( mass - mass_end ).
//gets the mass consumption
SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).
//gets the burn duration
SET burn_duration TO ( mass_burn / mass_consumption_rato ).
//gets teh burn duration halved 
SET burn_duration_halved TO ( burn_duration / 2 ).


//sets mun as the target 
SET trget TO BODY("MUN").
//cslculates the angle changhed by the burning itself
SET ang_burn_changhed TO angveluuu * burn_duration_halved.
//calculates the angle changhe 
SET angChanghe TO timeTo * anguveluu.
//gets the final angle
SET angpart TO (angChanghe) + burn_duration_halved * angveluuu.
//other final angle
SET angTot TO ang - angpart.
AG3 OFF.

//printing of data
PRINT (timeTo).
PRINT (angvelu).
PRINT (angveluuu).
print (anguveluu).
PRINT (velocyty_apo).
PRINT (velocyty_semi).
PRINT (ang).
PRINT (angTot / angveluuu).
PRINT ( "us =" + (fyfy + lan_us + dfg)).

//wait to position checker loop
SET x TO time.
SET y TO 0.
SET checker TO 0.

UNTIL checker = 1 {

    SET y TO time - x.
    IF y > ((angTot / angveluuu) - 100) {
        SET checker TO 1.0.
    }
}


//sets warp to 0
SET WARP TO 0.0.
PRINT ("g" + burn_duration).
SET STEERING TO PROGRADE.

//waits 90 secs
WAIT 90.

SET STEERING TO PROGRADE.
SET x TO 0.

//wait loop and put forward 
UNTIL x = 10 {

    SET x TO x + 1.
    WAIT 1.
    SET STEERING TO PROGRADE.
    PRINT x.
}

//burns
SET x TO 0.

STAGE.
SET THROTTLE TO 1.0.

SET x TO time.
SET y TO 0.

AG97 OFF.
AG96 ON.

//burns and keeps forward
UNTIL y > burn_duration {


    SET STEERING TO PROGRADE.
    WAIT 0.01.
    SET y TO time - x.
    SET THROTTLE TO 1.0.
    PRINT ("IWERTY").
}

AG96 OFF.
AG95 ON.

//stops burn
SET THROTTLE TO 0.0.



//waits until close enought to target 
LOCK tht TO trget:distance.
WAIT UNTIL tht < 2400000.


//warp 0
SET WARP TO 0.

WAIT 50.

SET wapoapiss TO 200000.

SET GM TO 6.5138398*10^10.

SET velocyty_apo TO  (SQRT(2 * GM) * (SQRT(((wapoapiss + 200000) * (periapsis + 200000)) / (200000 + 200000 + wapoapiss + periapsis))))   /    (periapsis + 200000).

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET velocyty_semi TO VELOCITYAT(SHIP, ETA:PERIAPSIS).

PRINT ("velo semi =" + velocyty_semi).

SET delta_v_needeed TO velocyty_semi - velocyty_apo.

SET delta_v_afetr TO ( delta_v - delta_v_needeed ).

SET mass_end TO ( ( numero_di_nepero ^ ((delta_v_afetr / isp) / 9.81)) * DRYMASS ).

SET mass_burn TO ( mass - mass_end ).

SET mass_consumption_rato TO ( thrust / ( isp * 9.81 )).

SET burn_duration TO ( mass_burn / mass_consumption_rato ).

SET burn_duration_halved TO ( burn_duration / 2 ).

WAIT UNTIL ORBIT:ETA:PERIAPSIS < 20.

SET STEERING TO RETROGRADE.

WAIT 20.

SET x TO time.
SET y TO 0.

AG94 OFF.
AG93 ON.

UNTIL y > burn_duration {
    SET STEERING TO RETROGRADE.
    WAIT 0.01.
    SET y TO time - x.
    SET THROTTLE TO 1.0.
    PRINT ("IWERTY").



}

AG93 OFF.
AG92 ON.


SET THROTTLE TO 0.0.




IF ((apoapsis + 200000) > 390000) AND ((apoapsis + 200000) < 410000) {
    SET a TO 1.
    SET periopis TO (apoapsis + 200000).

} 

IF ((periapsis + 200000) > 390000) AND ((periapsis + 200000) < 410000) {
    SET a TO 0.
    SET periopis TO (periapsis + 200000).

}





SET wapoapiss TO 400000.

SET velocyty_apo TO SQRT((GM / ((wapoapiss + periopis) / 2))).

SET angular_momentum TO ((SQRT(2 * GM)) * SQRT((wapoapiss * periopis) / (wapoapiss + periopis))).

SET delta_v TO (((ln(MASS / DRYMASS)) * 9.81 ) * isp).

SET velocyty_semi TO angualr_momentum / periopis.

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


IF a > 0 {
    WAIT UNTIL ORBIT:ETA:apoapsis > (burn_duration_halved - 100).
    SET STEERING TO PROGRADE.
}

IF a = 0 {
    WAIT UNTIL ORBIT:ETA:periapsis > (burn_duration_halved - 100).
    SET STEERING TO RETROGRADE.
}


WAIT 90.

SET x TO time.
SET y TO 0.

UNTIL y > 10{
    SET y TO time - x.
    IF a > 0 {
    WAIT UNTIL ORBIT:ETA:apoapsis > (burn_duration_halved - 100).
    SET STEERING TO PROGRADE.
}

    IF a = 0 {
    WAIT UNTIL ORBIT:ETA:periapsis > (burn_duration_halved - 100).
    SET STEERING TO RETROGRADE.
    }
    
}

SET THROTTLE TO 1.0.

SET x TO time.
SET y TO 0.

AG92 OFF.
AG91 ON.

UNTIL y > burn_duration {
        IF a > 0 {
    WAIT UNTIL ORBIT:ETA:apoapsis > (burn_duration_halved - 100).
    SET STEERING TO PROGRADE.
}

    IF a = 0 {
    WAIT UNTIL ORBIT:ETA:periapsis > (burn_duration_halved - 100).
    SET STEERING TO RETROGRADE.
    }

    SET y TO time - x.
}

AG91 OFF.
AG90 ON.

SET THROTTLE TO 0.0.


AG2 OFF.
AG20 ON.

WAIT UNTIL AG2 = AG20.

STAGE.

SHUTDOWN.






