CLEARSCREEN.

BRAKES ON.
AG10 ON.

WAIT UNTIL AG1 = AG10.

STAGE.

SET THROTTLE TO 0.2.

WAIT 5.

SET THROTTLE TO 0.5.

WAIT 5.

BRAKES OFF.

SET THROTTLE TO 1.0.

SET STEERING TO HEADING.

SET initial_alti TO ALT:RADAR.

WAIT UNTIL ALT:RADAR > (initial_alti + 2).

SET STEERING TO HEADING(0, 15).

WAIT UNTIL SHIP:VELOCITY:SURFACE:mag > 300.

SET STEERING TO HEADING(0, 30).

WAIT UNTIL ALT:RADAR > 5000.

SET STEERING TO HEADING(0,45.

WAIT UNTIL ALT:RADAR > 12000.

SET STEERING TO HEADING(0,60).

WAIT UNTIL ALT:RADAR > 15000.

SET STEERING TO(0,65).

AG2 ON.

WAIT UNTIL 
