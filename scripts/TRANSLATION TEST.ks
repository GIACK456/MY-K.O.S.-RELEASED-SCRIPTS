PRINT (" WE CARE REENTERING THE ATMOSPHERE                !").

SET time_qer TO 0.
SET time_qer TO time:SECONDS.
SET time_old To 0.
SET time_diff TO 0.
AG1 ON.

WAIT UNTIL AG2 = AG1.
PRINT (ROUND ( time:SECONDS )).


WAIT UNTIL AG3 = AG1.
LOCK tme1 TO (time_diff * 1).

UNTIL time_diff = 30.22338 {
    SET tme1 TO time_diff.
    SET time_old TO  0 + (time:SECONDS - time_diff).

    WAIT 0.5.
    WAIT 0.5.
    PRINT (ROUND(tme1)).

    SET time_diff TO time:SECONDS - time_old.
}





WAIT UNTIL AG4 = AG1.
RCS ON.
SET SHIP:CONTROL:STARBOARD TO -1.