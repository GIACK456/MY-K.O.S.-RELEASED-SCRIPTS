CLEARSCREEN.
SET x TO 0.
SET a TO 0.
SET b TO 0.
SET c TO 0.
SET melo TO R( a, b, c ).

LOCK velo TO SHIP:VELOCITY:SURFACE:DIRECTION.
LOCK belo TO SHIP:VELOCITY:SURFACE.
LOCK alti TO ALT:RADAR.


LOCK melo TO velo.

UNTIL x > 1000 {
    WAIT 1.
    PRINT (" MELO " + melo).
    PRINT (" BELO " + belo).
    PRINT (" VELO " + velo).
    SET x TO x +1.
} 


