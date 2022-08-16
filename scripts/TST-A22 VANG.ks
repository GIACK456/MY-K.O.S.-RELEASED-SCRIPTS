CLEARSCREEN.

AG2 ON.

WAIT UNTIL AG1 = AG2.

SET trget TO VESSEL ("CLEG-RTGET-SAT").

SET trget TO BODY ("MUN").

LOCK ang TO vang(ship:position-body:position,trget:position-body:position).
LOCK mean TO TRGET:ORBIT:ARGUMENTOFPERIAPSIS.
LOCK dfg TO ORBIT:ARGUMENTOFPERIAPSIS.
LOCK truet TO TRGET:ORBIT:TRUEANOMALY.

LOCK lan_us TO TRGET:ORBIT:LONGITUDEOFASCENDINGNODE.

LOCK lan_trgt TO ORBIT:LONGITUDEOFASCENDINGNODE.


LOCK fyfy TO ORBIT:TRUEANOMALY.



UNTIL AG3 = AG2 {
    CLEARSCREEN.
    PRINT ("ANG = " + ang).
    PRINT ("mean tr = " + mean).
    PRINT ("treu tr = " + truet).
    PRINT ("lan trg =" + lan_us ).
    PRINT ("mean = " + dfg).
    PRINT ("true = " + fyfy).
    PRINT ("lan  = " + lan_trgt).
   
    WAIT 0.5.
}