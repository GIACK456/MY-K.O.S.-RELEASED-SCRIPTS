CLEARSCREEN.
AG10 ON.


WAIT UNTIL AG2 = AG10.



if ADDONS:TR:AVAILABLE {
    if ADDONS:TR:HASIMPACT {
        PRINT ADDONS:TR:IMPACTPOS:LAT.
    } else {
        PRINT "Impact position is not available".
    }
} else {
    PRINT "Trajectories is not available.".
}





