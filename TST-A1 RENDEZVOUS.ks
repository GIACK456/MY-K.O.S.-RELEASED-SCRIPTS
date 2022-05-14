AG1 ON.
CLEARSCREEN.

SET A001 TO VESSEL ("CLEG-1").

WAIT UNTIL AG2 = AG1.

SET GM TO ((9.7599066 * 10^20) * (6.67 * 10^ -11)).

LOCK ANG TO VANG(SHIP:POSITION-BODY:POSITION, A001:POSITION-BODY:POSITION).

SET anl TO 360 / (SQRT(((4 * 3,14 * 3,14) * (A001:ORBIT:PERIAPSIS)) / (2 * GM))).

SET t05 TO (SQRT(((4 * 3,14 * 3,14) * (((A001:ORBIT:PERIAPSIS) + (A001:ORBIT:PERIAPSIS)) / 2) / (2 * GM))).

WAIT UNTIL ANG = ANL * t05.

PRINT ("we have it").