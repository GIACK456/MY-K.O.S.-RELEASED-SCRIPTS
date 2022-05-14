CLEARSCREEN.


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
SET check12 TO 0.
SET check13 TO 0.

SET phrase_old TO (" ENGINE IGNITION ").
SET phrase_prt TO (" LIFTOFF ").
SET phrase_net TO (" SUPERSONIC ").
LOCK aly TO ALT:RADAR.
LOCK velocità1 TO SHIP:VELOCITY:SURFACE:mag.
LOCK aly_check TO SHIP:ALTITUDE.
SET old_aly_check TO 0.
LOCK qpressure_check TO SHIP:Q.
SET qpressure_check_old TO 0.


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


    IF zz = 10{
         PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                       |
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

    IF AG3 = AG2 AND zz = 6 {
         SET GO_NOGO TO 1.
         PRINT ("|///////////////////////////////|
|                               !
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


        
     IF zz < 6 {
        PRINT ("|///////////////////////////////|
|                               |
|   T- " + zz + "                        |
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

    

    WAIT 1.
    CLEARSCREEN.
}






SET time_qer TO 0.
SET time_qer TO time.
SET time_old To 0.
SET time_diff TO 0.

UNTIL AG6 = AG2 OR AG5 = AG2 OR AG10 = AG2 OR (aly < 9 AND check = 1) {

     SET tme1 TO ROUND(time_diff).
     SET time_old TO 0 + (time:SECONDS - time_diff).


     IF velocità1 > 342 {
         SET phrase_old TO (" LIFTOFF ").
         SET phrase_prt TO (" We are supersonic ").
         SET phrase_net TO (" ENGINE TO 66% ").
         SET check1 TO 1.
     }



     IF aly > 25000 AND check1 = 1 {
          SET phrase_old TO (" We ArE SuPeRsOnIc").
          SET phrase_prt TO (" ENGINE TO 66 ").
          SET phrase_net TO (" ENGINE TO 33 ").
          SET check2 TO 1.
     }


     IF aly > 33000 AND check2 = 1 { 
          SET phrase_old TO (" ENGINE TO 66 ").
          SET phrase_prt TO (" ENGINE TO 33 ").
          SET phrase_net TO (" ENGINE TO 5 ").
          SET check3 TO 1.
     }


     IF aly > 39000 AND check3 = 1 {
          SET phrase_old TO (" ENGINE TO 533 ").
          SET phrase_prt TO (" ENGINE TO 5 "). 
          SET phrase_net TO (" MAIN ENGINE CUT OFF ").
          SET check4 To 1.
     }



     IF aly > 50000 AND check4 = 1 {
          SET phrase_old TO (" ENGINE TO 533 ").
          SET phrase_prt TO (" MAIN ENGINE CUT OFF ").
          SET phrase_net TO (" CREW CAPSULE SEPARATION ").
          SET check5 TO 1.
     }



     IF aly > 55000 AND check5 = 1 {
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


     IF (old_aly_check > aly_check) AND check7 = 1 {
          SET phrase_old TO (" WE ARE IS SPACE ").
          SET phrase_prt TO (" APPROACHING APOGEE ").
          SET phrase_net TO ("  WE CARE REENTERING THE ATMOSPHERE         !").
          SET check TO 1.
          SET check8 TO 1.
     }


     IF aly < 70000 AND check > 0 AND check8 = 1 {
          SET phrase_old TO (" APPROACHING APOGEE ").
          SET phrase_prt TO ("  WE CARE REENTERING THE ATMOSPHERE         !").
          SET phrase_net TO (" OPENING GROD FINS ").
          SET check9 TO 1.
     }


     IF aly < 65000 AND check > 0 AND check9 = 1 {
          SET phrase_old TO (" WE CARE REENTERING THE ATMOSPHERE         |").
          SET phrase_prt TO (" OPENING GRID FONS ").
          SET phrase_net TO (" LANDING BURN START ").
          SET checK10 TO 1.
     }



     IF aly < 36000 AND check > 0 AND checK10 = 1 {
          SET check11 TO 1.
     } 

     IF (AG5 = AG2 OR AG10 = AG2) AND aly < 1873.68925 {
         SET phrase_prt TO (" LANDING BuRn StART ").
         SET phrase_net TO (" OPENING lAnDiNG GER ").
         SET check12 TO 1.

     }

     IF (AG5 = AG2 OR AG10 = AG2) AND velocità1 < 50 AND check12 > 0 {
         SET phrase_old TO (" LANDING BURN Start ").
         SET phrase_prt TO (" opening LANDING GER ").
         SET phrase_net TO (" WE ARE LANDED ").
         SET check13 TO 1.

     }

    IF (AG5 = AG2 OR AG10 = AG2) AND aly < 9 AND check13 > 0 {
        SET phrase_old TO (" OPENING LANDING GEAR ").
         SET phrase_prt TO (" WE ARE LANDED ").
         SET phrase_net TO (" COMPUTER SHUTDOWN ").
     }

    IF aly < 6350.727273 AND check > 0 {
         SET phrase_old TO (" OPENEING GROD FONS ").
         SET phrase_prt TO (" LANDING BURN START ").
         SET phrase_net TO (" OPENING LANDING GER ").
         SET check12 TO 1.
     }

    IF velocità1 < 83.33456 AND check > 0 {
        SET phrase_old TO (" LANDING bUrN sTaRT ").
         SET phrase_prt TO (" Opening Landing gEr ").
         SET phrase_net TO (" WE ARE LANDED ").
         SET check13 TO 1.
     }

         IF aly < 9 AND check13 > 0 {
        SET phrase_old TO (" OPEning Landing Ger ").
         SET phrase_prt TO (" We ARE andedd ").
         SET phrase_net TO (" COMPUTER SHUTDOWN ").
     }

     PRINT ("|///////////////////////////////|
|                               
|   T+ " + ROUND (tme1) + "                        
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

     WAIT 0.5.
     WAIT 0.5.
     SET time_diff TO time:SECONDS - time_old.
     SET old_aly_check TO aly_check.
     CLEARSCREEN.
}


WAIT 5.

PRINT ("shutting down").

WAIT 5.

PRINT ("eabhh").

SHUTDOWN.




