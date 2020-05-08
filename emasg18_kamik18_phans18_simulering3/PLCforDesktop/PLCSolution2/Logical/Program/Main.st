
PROGRAM _INIT
//
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
			doStartP := TRUE;
			doMotorP := TRUE;
	
			(*Utils*)
			doFeederC := TRUE;
			doFeederB := TRUE;
			doFeederP:= TRUE;
	
			doPushC := FALSE;
			firstCrate := TRUE;

				
			FACTORY_STATE := AWAIT_ORDER;
			
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
//
			(*Utils*)
			doFeederC := FALSE;
			doFeederB := FALSE;
			doFeederP:= FALSE;
		
		RESET:
			doDeleteAll := TRUE;
			FACTORY_STATE := STOP;
	END_CASE;
	
	(*Non case dependent if statements*)
	
	(*Stop crate delivery*)
	IF diSensorPackagingReady THEN
		doStation2C := FALSE;
	ELSE
		doStation2C := TRUE;
	END_IF;

	(*Stop bottle feeder if line is full*)
	IF diSensorBottle THEN
		do1StationB := FALSE;
		doStartB := FALSE;
	ELSE
		do1StationB := TRUE;
		doStartB := TRUE;
	END_IF;
	
	
	(* Timer for Case STATION_1_STATE *)
	pushTimer(IN:=pushTimerInput, PT:=T#1s);
	
	CASE STATION_1_STATE OF
		NEXT_CRATE:
			// Either we have the first package or we are waiting for the crate to move on.
			IF (firstCrate AND diSensorCrateSecondScan AND NOT doAfterBeerFilling) THEN
				doBeforePusherC := TRUE;
				doStation1C := TRUE;
				doStartC := TRUE;
				doSlowDownC := TRUE;
				firstCrate := FALSE;
				doAfterBeerFilling := FALSE;
				pushTimerInput := TRUE;
				STATION_1_STATE := PUSH; 
				//do_Motor_BeerBottle_Station_1 := TRUE;	
			END_IF;
			// If crate moves on:
			IF (diSensorFullCrate AND diSensorCrateSecondScan) THEN
				doBeforePusherC := TRUE;
				doStation1C := TRUE;
				doStartC := TRUE;
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
				doRBeer := TRUE;
				STATION_1_STATE := ROBOTACTION_STATION_1;
			END_IF;
		ROBOTACTION_STATION_1:
			IF diSensorCrateSecondScan THEN
				doBeforePusherC := FALSE;
				doStation1C := FALSE;
				doStartC := FALSE;
			END_IF;
			IF diBeerComplete THEN
				doPushC := FALSE;
				doAfterBeerFilling := TRUE;
				STATION_1_STATE := STATION_1_PAUSE;
			END_IF;
		STATION_1_PAUSE:
			doRBeer := FALSE;
			IF diSensorCrateSecondScan THEN
				firstCrate := TRUE;
				STATION_1_STATE := NEXT_CRATE;
			END_IF;
			IF diSensorFullCrate THEN
				doAfterBeerFilling := FALSE;
			END_IF;	
			IF NOT diSensorCrateSecondScan AND NOT doBeforePusherC THEN
				doBeforePusherC := TRUE;
				doStation1C := TRUE;
			ELSIF diSensorCrateSecondScan THEN
				doBeforePusherC := FALSE;
				doStation1C := FALSE;
				doStartC := FALSE;
				END_IF;
				
			

	END_CASE;
	
	CASE STATION_2_STATE OF
		NO_PALLET:
			doStartP := TRUE;
			IF diSensorPalletInPos THEN
				doStartP := FALSE;
				STATION_2_STATE := FILL_PALLET;		
			END_IF;//
			
		FILL_PALLET:
			IF diSensorPackagingReady THEN
				doRPacking := TRUE;
			ELSE
				doRPacking := FALSE;
			END_IF;	
			
			IF diPalletComplete OR palletFlag THEN
				palletFlag := TRUE;
				doStartP := TRUE;
				IF NOT diSensorPalletInPos THEN
					palletFlag := FALSE;
					STATION_2_STATE := NO_PALLET;
				END_IF;
			END_IF;
			
			
		
	END_CASE;	
				
				
	palletTimer();
	pushTimer();
	pushCompleteTimer();
	
	END_PROGRAM


PROGRAM _EXIT
	 
END_PROGRAM

