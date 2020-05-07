
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
	doMotorP := FALSE;

	(*Utils*)
	doBeerCrateCounter := 1;
	// If less than 40 new beer
	doFeederC := TRUE;
	doFeederB := TRUE;
	doFeederP:= FALSE;
	
	doPushCrate := FALSE;
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
	pushCompleteTimer(IN:= pushCompleteInput, PT := T#1s);
	pushTimer(IN:=pushTimerInput, PT:=T#3s);
	
	
	CASE STATION_1_STATE OF
		NEXT_CRATE:
			// Either we have the first package or we are waiting for the crate to move on.
			IF (firstCrate AND diSensorCrateFirstScan) THEN
				doSlowDownC := TRUE;
				firstCrate := FALSE;
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
			END_IF;
			
		PUSH:
			IF pushTimer.Q THEN
				pushTimerInput := FALSE;
				doSlowDownC := FALSE;
				doPushCrate := TRUE;
				pushCompleteInput := TRUE;
				STATION_1_STATE := ROBOTACTION_STATION_1;
			END_IF;
		ROBOTACTION_STATION_1:
			IF diSensorCrateFirstScan THEN
				doBeforePusherC := FALSE;
			END_IF;
			IF pushCompleteTimer.Q THEN
				pushCompleteInput := FALSE;
				doPushCrate := FALSE;
				doAfterBeerFilling := TRUE;
			END_IF;
			// Do action
			STATION_1_STATE := STATION_1_PAUSE;
		STATION_1_PAUSE:
			STATION_1_STATE := NEXT_CRATE;

	END_CASE;
	
(*	CASE STATION_2_STATE OF
		PALLET_IN_POS:
			Pallet_timer.IN := TRUE;
			Pallet_timer.PT := T#5s ;
			MOTOR_PackagingStart := TRUE;
			
			IF SENSOR_Packaging THEN
				MOTOR_PackagingStart := FALSE;
				//STATION_2_STATE := ROBOTACTION_STATION_2;
				STATION_2_STATE := NEXT_CRATE_SCANNER;
				//CREATE COUNTER TO DETERMINE NUMBER OF CRATES ON PALLET
			ELSIF (Pallet_timer.Q AND NOT SENSOR_Packaging) THEN
				Pallet_timer.IN := FALSE;
				STATION_2_STATE := NO_PALLET;
			END_IF;
			
			
		ROBOTACTION_STATION_2:
			IF SENSOR_Packaging_Crates THEN
				MOTOR_BeerCrate_Station_2 := FALSE;
				(*DoAction
			ELSE
				MOTOR_BeerCrate_Station_2 := TRUE;
			END_IF;	
			
		NEXT_CRATE_SCANNER:
			MOTOR_PackagingStart := TRUE;
			Feeder_Packaging:= TRUE;
			STATION_2_STATE := STATION_2_PAUSE;
			
		STATION_2_PAUSE:
			Feeder_Packaging:= FALSE;
			STATION_2_STATE := PALLET_IN_POS;
		
		NO_PALLET:
			Feeder_Packaging:= TRUE;
			STATION_2_STATE := STATION_2_PAUSE;
		
	END_CASE*);	
	palletTimer();
	pushTimer();
	pushCompleteTimer();
	
	END_PROGRAM


PROGRAM _EXIT
	 
END_PROGRAM

