CLEARSCREEN.


SET tmi TO time.
LOCK titi TO time.
LOCK isp TO 280.
SET timer   TO 0.

WAIT 10.

AG1 ON.
AG3 ON.

WAIT 1.

STAGE.
UNTIL (titi - tmi) > 100 {

    SET timer TO timer + 1.
    SET thrust TO MAXTHRUST.


    IF timer = 2 {
        SET THROTTLE TO 0.7.
    }

    IF timer = 3 {
        SET throttle TO 0.8.
    }

    IF time = 3 {
        SET THROTTLE TO 0.9.
    }

    IF timer = 5 {
        SET throttle TO 0.99.
    }

    IF timer = 10 OR timer = 20 OR timer = 30 {
        SET STEERING TO UP + R(90,0,0).
    }

    IF timer = 12 OR timer = 22 OR timer = 32 {
        SET STEERING TO UP + R(-90,0,0).
    }


    IF timer = 14 OR timer = 24 OR timer = 34 {
        SET STEERING TO UP + R(0,0,90).
    }

    IF timer = 15 OR timer = 25 OR timer = 35{
        SET STEERING TO UP + R(0,0,-90).
    }

    IF timer = 17 OR timer = 27 OR timer = 37{
        SET STEERING TO UP + R(0,0,0).
    }




    PRINT("/////////////////
|                
|  T+" + timer + "              
|                
|  T=" + thrust + "              
|                
|  ISP=" + isp + "              
|                
//////////////////").

    WAIT 1.
    CLEARSCREEN.

}

SET throttle TO 0.0.