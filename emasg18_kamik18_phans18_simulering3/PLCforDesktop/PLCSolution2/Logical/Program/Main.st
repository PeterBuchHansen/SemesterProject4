
PROGRAM _INIT
	(*Bottle conveyer*)
	doStartB := TRUE;
	doMotorB := TRUE;
	do1StationB := TRUE;

	(*Crate conveyer*)
	doStartC := TRUE;
	doMotorC := TRUE;
	doStation1C := TRUE;
	doStation2C := TRUE;
	doBeforePusherC := TRUE;
	doSlowDownC := FALSE; 
	doAfterBeerFilling := FALSE;
	
	(*Packaging conveyer*)
	doStartP := FALSE;
	doMotorP := TRUE;
	

	(*Utils*)
	doBeerCrateCounter := 1;
	// If less than 40 new beer
	doFeederC := TRUE;
	doFeederB := TRUE;
	doFeederP:= TRUE;
	
	doPushC := FALSE;
	firstCrate := TRUE;
	diSensorCrateSecondScan := FALSE;
END_PROGRAM


PROGRAM _CYCLIC

	CASE FACTORY_STATE OF			
		START:
			(*Bottle conveyer*)
				doStartB := TRUE;
				doMotorB := TRUE;
				do1StationB := TRUE;

				(*Crate conveyer*)
				doStartC := TRUE;
				doMotorC := TRUE;
				doStation1C := TRUE;
				doStation2C := TRUE;
				doBeforePusherC := TRUE;
				doSlowDownC := FALSE; 
				doAfterBeerFilling := FALSE;
	
				(*Packaging conveyer*)
				doStartP := FALSE;
				doMotorP := FALSE;

				(*Utils*)
				doBeerCrateCounter := 1;
				// If less than 40 new beer
				doFeederC := TRUE;
				doFeederB := TRUE;
				doFeederP:= FALSE;
				
				FACTORY_STATE := AWAIT_ORDER;
		
(*			IF di_Sensor_Bottle THEN
				do_Motor_BeerBottle_Station_1 := FALSE;
			ELSE 
				do_Motor_BeerBottle_Station_1 := TRUE;
			END_IF;*)
			
		AWAIT_ORDER:
			
		STOP:
			(*Bottle conveyer*)
			doStartB := FALSE;
			doMotorB := FALSE;
			do1StationB := FALSE;

			(*Crate conveyer*)
			doStartC := FALSE;
			doMotorC := FALSE;
			doStation1C := FALSE;
			doStation2C := FALSE;
			doBeforePusherC := FALSE;
			doSlowDownC := FALSE; 
			doAfterBeerFilling := FALSE;
	
			(*Packaging conveyer*)
			doStartP := FALSE;
			doMotorP := FALSE;

			(*Utils*)
			doBeerCrateCounter := 1;
			// If less than 40 new beer
			doFeederC := FALSE;
			doFeederB := FALSE;
			doFeederP:= FALSE;
		
		RESET:
			doDeleteAll := TRUE;
			FACTORY_STATE := STOP;
	END_CASE;

	// Timers for Case STATION_1_STATE
	pushCompleteTimer(IN:= pushCompleteInput, PT := T#3s);
	pushTimer(IN:=pushTimerInput, PT:=T#1s);
	
	
	CASE STATION_1_STATE OF
		NEXT_CRATE:
			// Either we have the first package or we are waiting for the crate to move on.
			IF (firstCrate AND diSensorCrateFirstScan AND NOT doAfterBeerFilling) THEN
				doBeforePusherC := TRUE;
				doSlowDownC := TRUE;
				firstCrate := FALSE;
				doAfterBeerFilling := FALSE;
				pushTimerInput := TRUE;
				STATION_1_STATE := PUSH; 
				//do_Motor_BeerBottle_Station_1 := TRUE;	
			END_IF;
			// If crate moves on:
			IF diSensorFullCrate THEN
				doBeforePusherC := TRUE;
				doSlowDownC := TRUE;
				doAfterBeerFilling := FALSE;
				pushTimerInput := TRUE;
				STATION_1_STATE := PUSH;
			END_IF;//
			
		PUSH:
			IF pushTimer.Q THEN
				pushTimerInput := FALSE;
				doSlowDownC := FALSE;
				doPushC := TRUE;
				pushCompleteInput := TRUE;
				STATION_1_STATE := ROBOTACTION_STATION_1;
			END_IF;
		ROBOTACTION_STATION_1:
			IF diSensorCrateFirstScan THEN
				doBeforePusherC := FALSE;
			END_IF;
			IF pushCompleteTimer.Q THEN
				pushCompleteInput := FALSE;
				doPushC := FALSE;
				doAfterBeerFilling := TRUE;
				STATION_1_STATE := STATION_1_PAUSE;
			END_IF;
		STATION_1_PAUSE:
			IF diSensorCrateFirstScan THEN
				firstCrate := TRUE;
				STATION_1_STATE := NEXT_CRATE;
				// Send new crate
			END_IF;
			IF diSensorFullCrate THEN
				doAfterBeerFilling := FALSE;
			END_IF;	
			

	END_CASE;
	
	CASE STATION_2_STATE OF
		NO_PALLET:
			doFeederP := TRUE;
			STATION_2_STATE := NEXT_CRATE_SCANNER;
			
		NEXT_CRATE_SCANNER:
			IF diSensorPackagingReady THEN
				STATION_2_STATE := ROBOTACTION_STATION_2;				
			END_IF;

		ROBOTACTION_STATION_2:
			doFeederP := FALSE;
			IF diSensorPackagingReady THEN
				doStation2C := FALSE;
				doRobotCrateReadyForPacking := TRUE;
			ELSE
				doStation2C := TRUE;
				doRobotCrateReadyForPacking := FALSE;
			END_IF;	
			
			IF diRobotPalletComplete THEN
				doStartP := TRUE;
				STATION_2_STATE := STATION_2_PAUSE;
			END_IF;
			
		STATION_2_PAUSE:
			IF diSensorPalletFreeFromStart THEN
	  			doStartP := FALSE;
				STATION_2_STATE := NO_PALLET;
			END_IF;
		
	END_CASE;	
	palletTimer();
	pushTimer();
	pushCompleteTimer();
	
	END_PROGRAM


PROGRAM _EXIT
	 
END_PROGRAM

