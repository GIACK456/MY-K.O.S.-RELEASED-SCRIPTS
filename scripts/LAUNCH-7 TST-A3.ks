CLEARSCREEN.

SET isp TO 100.

SET thrust TO 2.
SET timer TO 0.

WAIT 10.

AG1 on.
RCS on.


STAGE.
WAIT 2.


UNTIL timer > 10 {

    SET timer TO timer + 1.
    SET thrust TO MAXTHRUST.
    SET SHIP:CONTROL:STARBOARD TO -1.





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
RCS off.