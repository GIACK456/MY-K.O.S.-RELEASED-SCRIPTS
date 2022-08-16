CLEARSCREEN.

AG10 OFF.

SET velo TO SHIP:VELOCITY:ORBIT.

SET hed TO SHIP:heading.

SET thr TO rcs:maxthrust.


LOCK x TO velo:x - hed:x.

LOCK y TO velo:y - hed:y.

LOCK z TO velo:z - hed:z.


WAIT UNTIL AG2 = AG10 AND AG3 = AG10.


RCS ON.

SET SHIP:CONTROL:YAW TO x.

SET SHIP:CONTROL:PITCH TO y.

WAIT 2.

WAIT UNTIL 



