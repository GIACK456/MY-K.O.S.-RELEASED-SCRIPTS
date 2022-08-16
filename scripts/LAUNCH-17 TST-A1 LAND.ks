CLEARSCREEN.

AG1 ON.
WAIT 10.



//pre liftoff procedure
STAGE.  //arms one

WAIT 1.
STAGE. //arms two

WAIT 1.
STAGE.   //big arm 

WAIT 1.
STAGE.   //sprinclers

AG1 ON.  //camera swap
WAIT 1.
STAGE.  //engines




//trhottle up during pre launch
SET checker TO 0.

UNTIL (checker = 100) {

    SET THROTTLE TO checker / 100.
    SET checker TO checker + 1.


    WAIT 0.06.        //gradually trhottles up to 60 %
}




AG1 ON.         //camera swap

SET THROTTLE TO 0.7.    //trhottle and stearing cehcking
SET STEERING TO UP.    

STAGE.            //liftoff
AG1 ON.           //camera swap




WAIT UNTIL ALT:RADAR > 1000.
SET STEERING TO UP + R (0,-15,0).  //inclinating after 1000m 


WAIT UNTIL ALT:RADAR > 5000.      //inclinating more after 5000m
SET STEERING TO UP + R (0,-25,0).


WAIT UNTIL ALT:RADAR > 7000.      //trhottling up at 7000m
SET THROTTLE TO 0.8.


WAIT UNTIL ALT:RADAR > 10000.   //starts inclinating after altitude is bigger than 10000m 


//gradually inclinating after 10000m and before 16000m
UNTIL (ALT:RADAR > 16000) {

    SET STEERING TO UP + R (0,-(((ALT:RADAR - 10000) * 0.00333) + 25) ,0).

}


WAIT UNTIL ALT:RADAR > 20000.       //inclinates more and throttles up at 20000m
SET THROTTLE TO 1.0.
SET STEERING TO UP + R (0,-50,0).


WAIT UNTIL ALT:RADAR > 25000.       //even more at 25000m
SET THROTTLE TO 1.0.
SET STEERING TO UP + R (0,-60,0).


WAIT UNTIL ALT:RADAR > 30000.   //waits some stuff


SET THROTTLE TO 0.0.   //throttle to 0
AG1 ON.               //camera activation
STAGE.
WAIT 1.

STAGE.                 //staging
SET STEERING TO UP + R (0,-60,0).

WAIT 0.5.                //separators activation
AG3 ON.
SET STEERING TO UP + R (0,-60,0).

WAIT 2.               //engine start (plume)
AG4 ON.
SET THROTTLE TO 0.0.
SET STEERING TO UP + R (0,-60,0).

WAIT 2.                //actual engine ignition
LOCK STEERING TO UP + R (0,-60,0).


//gradual trhottle up

AG1 ON.                //camera on engine
SET THROTTLE TO 0.4.

WAIT 1.
SET THROTTLE TO 0.7.

WAIT 1.

SET THROTTLE TO 1.0.                 //last throttle up and lock
LOCK STEERING TO UP + R (0,-60,0).





WAIT UNTIL ALT:RADAR > 40000.           //inclinates more
LOCK STEERING TO UP + R (0,-70,0).

WAIT UNTIL apoapsis > 140000.           //throttles to 0 
SET THROTTLE TO 0.



//orbital insertion part
SET apoapiss TO apoapsis  + 600000.      //sets needed varaiables fro the calculation of gfiring time
SET gm TO BODY:MU.
SET periapiss TO periapsis + 600000.
SET DRYMASS TO 13.7647.
SET isp TO 355.
SET numero_di_nepero TO CONSTANT:e.
SET thrust TO 125.


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


LOCK STEERING TO PROGRADE.    //waits until at right position
WAIT (ORBIT:ETA:APOAPSIS - burn_duration_halved).


//gets to orbit
SET THROTTLE TO 1.0.
WAIT burn_duration.

SET THROTTLE TO 0.0.

//wait to decouple
AG6 ON.
AG5 OFF.
WAIT UNTIL AG5 = AG6.

STAGE.