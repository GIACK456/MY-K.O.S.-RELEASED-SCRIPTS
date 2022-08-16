CLEARSCREEN.


SET giro TO 0.

SET thrust TO 96.
SET isp TO 295.
SET dist TO 4000.
SET fatti_veli TO 0.
SET x TO 0.
SET supposed_velo TO 178.

UNTIL x = 1 {

    SET supposed_altitude TO dist - giro.
    SET supposed_mass TO mass.
    SET fatti_veli TO (SQRT(1.63 * (2 * giro)) * 1.63).

    SET supposed_velo TO 167 + fatti_veli.

    UNTIL supposed_velo < 10 {

        SET supposed_mass TO supposed_mass - (0.1 * (thrust / (isp * 9.81))).

        SET supposed_acceleration TO (0.1 * ((thrust / supposed_mass) - 1.63)).

        SET supposed_velo TO supposed_velo - supposed_acceleration.
        
        SET supposed_altitude TO supposed_altitude - (0.1 * supposed_velo).

        IF (supposed_altitude < 10 AND supposed_altitude > 0) AND (supposed_velo < 10 AND supposed_velo > 0) {
            SET x TO 1.
        }
    }
    SET giro TO giro + 1.
    PRINT (giro).
    PRINT (supposed_altitude).
}

PRINT (supposed_alti).