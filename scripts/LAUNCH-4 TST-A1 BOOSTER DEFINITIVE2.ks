CLEARSCREEN.
SAS ON.

SET cvv TO 0.
SET xx TO 0.
SET xz TO 100.
SET zz TO 0.
SET check TO 0.
SET GO_NOGO TO 0.
SET tme TO 0.
SET tme1 TO 1.

SET check1 TO 0.
SET check2 TO 0.
SET check3 TO 0.
SET checK4 TO 0.
SET check5 TO 0.
SET check6 TO 0.
SET check7 TO 0.
SET check8 TO 0.
SET check9 TO 0.
SET checK10 TO 0.
SET check11 TO 0.

SET phrase_old TO 0.
SET phrase_prt TO 0.
SET phrase_net TO 0.
LOCK aly TO ALT:RADAR.
LOCK velocità1 TO SHIP:VELOCITY:SURFACE:mag.

PRINT ("DEBUFGGF").

UNTIL xx = xz {
    SET xx TO xx + 1.
    SET zz TO (xz - xx).
    

    IF zz > 70 {
    PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                       |
|                               |
|   D: PREPARED                 |
|   S: WAITITNG ON THE PAD      |
|   N: GID FINS TEST            |
|                               |
|                               |
|   MC: NOT YET CONFIRMED       |
|                               |
|                               |
|///////////////////////////////|
").
     }



    if zz = 70 {
        AG1 ON.
     } 



     IF zz < 71 AND zz > 60 {
        PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                       |
|                               |
|   D: PREPARED                 |
|   S: GID FINS TEST            |
|   N: GID FINS TEST RESULT     |
|                               |
|                               |
|   MC: NOT YET CONFIRMED       |
|                               |
|                               |
|///////////////////////////////|").
     }



    if zz = 60 {
        AG1 OFF.
     }



     IF zz < 61 AND zz > 50 {
        PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                       |
|                               |
|   D: GID FINS TEST            |
|   S: GID FINS GOOD            |
|   N: LANDING GEAR TEST        |
|                               |
|                               |
|   MC: NOT YET CONFIRMED       |
|                               |
|                               |
|///////////////////////////////|").
    }



    if zz = 50 {
        GEAR ON.
     }

     IF zz < 51 AND zz > 40 {
        PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                       |
|                               |
|   D: GID FINS TEST            |
|   S: LANDING GEAR TEST        |
|   N: LANDING GEAR TEST RESULT |
|                               |
|                               |
|   MC: NOT YET CONFIRMED       |
|                               |
|                               |
|///////////////////////////////|").
    }



    if zz = 40 {
        GEAR OFF.
     }
        
     IF (zz < 41 AND zz > 10) AND NOT(AG3 = AG2) {
        PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                       |
|                               |
|   D: GID FINS TEST RESULT     |
|   S: LanGea TEST SUCESS       |
|   N: GO / NO GO               |
|                               |
|                               |
|   MC: NOT YET CONFIRMED       |
|                               |
|                               |
|///////////////////////////////|").
    }

    
    IF zz > 10 AND AG3 = AG2 {
         PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                       |
|                               |
|   D: GID FINS TEST RESULT     |
|   S: GO FOR LAUNCH            !
|   N: ENGINE IGNITION          |
|                               |
|                               |
|   MC: GO                      |
|                               |
|                               |
|///////////////////////////////|").
    }


    IF zz < 10 AND zz > 6 {
         PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                        |
|                               |
|   D: GID FINS TEST RESULT     |
|   S: GO FOR LAUNCH            !
|   N: ENGINE IGNITION          !
|                               |
|                               |
|   MC: GO                      |
|                               |
|                               |
|///////////////////////////////|").

    }

    IF AG3 = AG2 AND (zz = 6 OR zz < 6) {
         SET GO_NOGO TO 1.
         PRINT ("|///////////////////////////////|
|   T- " + zz + "                        |
|                               |
|   D: Land Gear TEST SUCESS    |
|   S: GO FOR LAUNCH            |
|   N: ENGINE IGNITION          |
|                               |
|                               |
|   MC: GO                      !
|                               |
|                               |
|///////////////////////////////").
    }



    if zz = 6 AND AG3 = AG2 {
        STAGE.
        SET THROTTLE TO ((10 - zz) / 10 ).
     }
        
     IF zz = 6 OR zz < 6 {
        PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                       |
|                               |
|   D: Go For Launch            |
|   S: ENGINE IGNITION          |
|   N: LIFTOFF                  |
|                               |
|                               |
|   MC: GO                      |
|                               |
|                               |
|///////////////////////////////|").
    }


    if zz < 6 AND AG3 = AG2{
        SET THROTTLE TO ((10 - zz) / 10 ).
    }
    

    WAIT 1.
    CLEARSCREEN.
}



STAGE.
WAIT 1.
SAS OFF.
SET STEERING TO UP +R(0,-1.199999999999,0).
PRINT ("|///////////////////////////////|
|                               |
|   T+ 1                        |
|                               |
|   D: ENGINE IGNITION          |
|   S: LIFTOFF                  |
|   N: SUPERSONIC               |
|                               |
|                               |
|   Vl: " + velocità1 + "                         |
|   Al: " + aly + "                            |
|                               |
|///////////////////////////////|").
SET THROTTLE TO 1.0.





UNTIL AG6 = AG2 OR AG5 = AG2 OR AG10 = AG2 OR (aly < 6353.23 AND check = 1) {
     
     IF tme = 1 {
          SET tme TO 0.
          SET tme1 TO tme1 + 1. 
     }

     IF velocità1 > 342 {
         SET phrase_old TO (" LIFTOFF ").
         SET phrase_prt TO (" We are supersonic ").
         SET phrase_net TO (" ENGINE TO 66% ").
         SET check1 TO 1.
     }



     IF aly > 25000 AND check1 = 1 {
          SET THROTTLE TO 0.6666666.
          SET phrase_old TO (" We are supersonic ").
          SET phrase_prt TO (" ENGINE TO 66 ").
          SET phrase_net TO (" ENGINE TO 33 ").
          SET check2 TO 1.
     }


     IF aly > 33000 AND check2 = 1 { 
          SET THROTTLE TO 0.333333.
          SET phrase_old TO (" ENGINE TO 66 ").
          SET phrase_prt TO (" ENGINE TO 33 ").
          SET phrase_net TO (" ENGINE TO 5 ").
          SET check3 TO 1.
     }


     IF aly > 39000 AND check3 = 1 {
          SET THROTTLE TO 0.05.
          SET phrase_old TO (" ENGINE TO 533 ").
          SET phrase_prt TO (" ENGINE TO 5 "). 
          SET phrase_net TO (" MAIN ENGINE CUT OFF ").
          SET check4 To 1.
     }



     IF aly > 50000 AND check4 = 1 {
          SET THROTTLE TO 0.0.
          SET phrase_old TO (" ENGINE TO 533 ").
          SET phrase_prt TO (" MAIN ENGINE CUT OFF ").
          SET phrase_net TO (" CREW CAPSULE SEPARATION ").
          SET check5 TO 1.
     }



     IF aly > 55000 AND check5 = 1 {
          STAGE.
          SET STEERING TO UP.
          SET phrase_old TO (" MAIN ENGINE CUT OFF ").
          SET phrase_prt TO (" CREW CAPSULE SEPARATION ").
          SET phrase_net TO (" WE ARE IN SPACE ").
          SET check6 TO 1.
     }


     IF aly > 70000 AND check6 = 1 {
          SET phrase_old TO (" CREW CASPULE SEPARATION ").
          SET phrase_prt TO (" WE ARE IN SPACE ").
          SET phrase_net TO (" APPROACHING APOGEE ").
          SET check7 TO 1.
     }


     IF aly > 83000 AND check7 = 1 {
          SET phrase_old TO (" WE ARE IS SPACE ").
          SET phrase_prt TO (" APPROACHING APOGEE ").
          SET phrase_net TO (" WE CARE REENTERING THE ATMOSPHERE ").
          SET check TO 1.
          SET check8 TO 1.
     }


     IF aly < 70000 AND check > 0 AND check8 = 1 {
          SET phrase_old TO (" APPROACHING APOGEE ").
          SET phrase_prt TO (" WE CARE REENTERING THE ATMOSPHERE ").
          SET phrase_net TO (" OPENING GROD FINS ").
          SET check9 TO 1.
     }


     IF aly < 65000 AND check > 0 AND check9 = 1 {
          AG1 ON.
          LOCK STEERING TO (-1) * SHIP:VELOCITY:ORBIT..
          SET phrase_old TO (" WE CARE REENTERING THE ATMOSPHERE ").
          SET phrase_prt TO (" OPENING GRID FONS ").
          SET phrase_net TO (" LANDING BURN START ").
          SET checK10 TO 1.
     }



     IF aly < 36000 AND check > 0 AND checK10 = 1 {
          LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.
          SET check11 TO 1.
     } 

     IF AG5 = AG2 OR AG10 = AG2 {
          SET THROTTLE TO 0.0.
     }


     PRINT ("|///////////////////////////////|
|                               
|   T+ " + tme1 + "                        
|                               
|   D: " + phrase_old + "          
|   S: " + phrase_prt + "               
|   N: " + phrase_net + "             
|                               
|                               
|   Vl: " + ROUND(velocità1) + "                         
|   Al: " + ROUND(aly) + "                            
|                               
|///////////////////////////////
").

     WAIT 0.1.
     SET tme TO tme + 0.1.
     CLEARSCREEN.
}






IF aly < 6353 AND check > 0 {

     SET THROTTLE TO 1.0.
     PRINT ("LANDING BURN START").
     AG1 ON.
     AG7 ON.

     LOCK forzaM TO MAXTHRUST.
     LOCK massa TO MASS.
     LOCK weight TO (MASS * 9.81).
     LOCK ttwr TO (weight / forzaM).

     LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.

     WAIT UNTIL velocità1 < 50.
     GEAR ON.
     PRINT (" OPENING LANDING GEAR ").
     LOCK THROTTLE TO ttwr.

     WAIT UNTIL aly < 43.65433.
     SET THROTTLE TO 1.0.

     WAIT UNTIL velocità1 < 6.
     LOCK THROTTLE TO (ttwr).

}



IF AG5 = AG2 OR AG10 = AG2 {
     
     SET THROTTLE TO 0.0.
     AG1 ON.
     WAIT 10.8583875.
     AG7 ON.

     PRINT (" lAnDiNg BuRn StArT ").

     WAIT UNTIL aly < 1873.68925.
     SET THROTTLE TO 1.0.

     LOCK forzaM TO MAXTHRUST.
     LOCK massa TO MASS.
     LOCK weight TO (MASS * 9.81).
     LOCK ttwr TO (weight / forzaM).

     LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.

     WAIT UNTIL velocità1 < 50.
     GEAR ON.
     PRINT (" OPENING LANDING GEAR ").
     LOCK THROTTLE TO ttwr.

     WAIT UNTIL aly < 83.65433.
     SET THROTTLE TO 1.0.

     WAIT UNTIL velocità1 < 6.
     LOCK THROTTLE TO (ttwr).


}






WAIT UNTIL aly < 9.

WAIT 0.5.

SET THROTTLE TO 0.0.
PRINT (" WE ARE LANDED ").

