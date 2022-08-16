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



    IF countdown < 60 OR countdown = 60{
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

    IF velo > 340 AND MAXTHRUST > 0 AND checker3 = 0 AND height < 40000{    
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
    

    IF stgenum = 3 AND checker3 = 1{    
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



    IF height > 55000 AND checkeer2 = 0{    
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


    IF apoapiss  > 130000 AND THRU = 0{    
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


    IF apoapiss > 130000 AND THRU > 0 {
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

    
    
    IF apoapiss > 130000 AND THRU = 0 AND checker = 1{
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



    }







    
    WAIT 1.
    CLEARSCREEN.
    SET time_diff TO time:SECONDS - time_old.
















}








