 CLEARSCREEN.


SET countdown TO 0.
SET countdownChecker TO 100.
SET checker2 TO 0.

SET checker3 TO 0.
SET checkeer TO 0.
SET checkeer2 TO 0.

LOCK tim TO 0.
LOCK thru TO ship:THRUST.
LOCK velo TO CEILING(ship:velocity:surface:mag).
LOCK stgenum TO STAGE:NUMBER.

SET apoapiss TO ORBIT:apoapsis.
LOCK height TO CEILING(ship:ALTITUDE).




until countdown = countdownChecker {

    SET countdown TO countdown + 1.
    SET tMinus To CEILING(countdownChecker - countdown).



    IF countdown < 90 OR countdown = 90{
            PRINT ("////////////////////////
|                       |
|  T-" + tMinus + "                 |
|                       |
|    PRV:  ON LAUNCHPAD |
|  DOING:  FUELING      |
|  TO DO:  STARTAUP     |
|                       |
|                       |
|                       |
/////////////////////////
    ").
    }

    IF countdown > 60 AND countdown < 80{
            PRINT ("////////////////////////
|                       |
|  T-" + tMinus + "                 |
|                       |
|    PRV:  FUELING      |
|  DOING:  STARTAP      |
|  TO DO:  ARM RELESE   |
|                       |
|                       |
|                       |
/////////////////////////
    ").

    }

    IF countdown >= 80 AND countdown <= 94 {
            PRINT ("////////////////////////
|                       |
|  T-" + tMinus + "                 |
|                       |
|    PRV:  STARTAP      |
|  DOING:  ARM RELESE   |
|  TO DO:  IGNITION     |
|                       |
|                       |
|                       |
////////////////////////
").

    }

    IF countdown > 94 {    
        PRINT ("////////////////////////
|                      |
|  T-" + tMinus + "                  |
|                       |
|    PRV:  ARM RELESE   |
|  DOING:  IGNITION     |
|  TO DO:  LIFTOFF      |
|                       |
|                       |
|                       |
////////////////////////
    ").

    }

    WAIT 1.

    CLEARSCREEN.
}


SET time_qer TO 0.
SET time_qer TO time.
SET time_old To 0.
SET time_diff TO 0.



UNTIL height > 600000 {

    SET tim TO ROUND(time_diff).
    SET time_old TO 0 + (time:SECONDS - time_diff).


    IF velo < 340 {    
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  IGNITION    
|  DOING:  LIFTOFF      
|  TO DO:  SUPERSONIC   
|                       
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").
    }

    IF velo > 340 AND MAXTHRUST > 0 AND checker3 = 0 AND height < 60000 {    
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  LIFTOFF     
|  DOING:  SUPERSONIC   
|  TO DO:  STAGING      
|                       
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").
    }
    

    IF stgenum = 10 AND checker3 = 1 {    
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  SUPERSONIC   
|  DOING:  STAGE        
|  TO DO:  FAIRING SEP  
|                       
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").

    SET checker3 TO 1.
    SET checkeer2 TO 0.
    }



    IF height > 60000 AND checkeer2 = 0 {    
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  STAGE        
|  DOING:  FAIRING SEP  
|  TO DO:  BURN STOP  
|                       
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").

    SET checkeer2 TO 0.
    SET checker3 TO 0.

    }


    IF apoapiss  > 200000 AND THRU = 0 {    
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  FAIRING SEP  
|  DOING:  BURN STOP    
|  TO DO:  REIGNITION   
|                       
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").

    SET checker2 TO 1.
    }


    IF apoapiss > 200000 AND THRU > 0 {
                PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  BURN STOP    
|  DOING:  REIGNITION   
|  TO DO:  CIRCULARIZATION
|                       
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").

    SET checker TO 1.


    }

    
    
    IF (apoapiss > 200000 AND THRU = 0 AND checker = 1) AND (AG99 <> AG20) {
                PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  BURN STOP    
|  DOING:  REIGNITION   
|  TO DO:  CIRCULARIZATION
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").}


    IF AG98 = AG99 {
            PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  BURN STOP    
|  DOING:  CIRCULARIZATION
|  TO DO:  COASTING
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").

AG20 ON.


    }


    IF AG97 = AG99 {
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  BURN STOP    
|  DOING:  COASTING
|  TO DO:  TRANS MUNAR INJECTION
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }

    IF AG96 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  COASTING    
|  DOING:  TRANS MUNAR INJECTION
|  TO DO:  COASTING
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }

    IF AG95 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  TRANS MUNAR INJECTION   
|  DOING:  COATSING
|  TO DO:  IN MUN SOI
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }

    IF AG94 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  COASTING
|  DOING:  IN MUN SOI
|  TO DO:  ENCLOSING BURN
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }


    IF AG93 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  IN MUN SOI
|  DOING:  ENCLOSING BURN
|  TO DO:  COATING
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }

    IF AG92 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  ENCLOSING BURN
|  DOING:  COATING
|  TO DO:  CIRCUKLARIZATION BURN
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }

    IF AG91 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  ENCLOSING BURN
|  DOING:  CIRCULARIZATION BURN
|  TO DO:  COATSING AND CIRCUALRIZEED
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }



    IF AG90 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  ENCLOSING BURN
|  DOING:  COASTING AND CIRCULARIZED
|  TO DO:  DEORBITING BURN
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }

    IF AG89 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  ENCLOSING BURN
|  DOING:  DEORBITING BURN
|  TO DO:  COATING
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }

    IF AG88 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  DEORBITING BURN
|  DOING:  COATING
|  TO DO:  SECOND BURN
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }


    IF AG87 = AG99{
        PRINT ("////////////////////////
|                      
|  T+" + tim + "                  
|                       
|    PRV:  DEORBITING BURN
|  DOING:  SECOND BURN
|  TO DO:  LANDING BURN
|                      
|  sp " + velo + "                    
|  hg " + height +  "                    
////////////////////////
    ").




    }







    
    WAIT 1.
    CLEARSCREEN.
    SET time_diff TO time:SECONDS - time_old.
















}