
PROGRAM _INIT

END_PROGRAM


PROGRAM _CYCLIC

	CASE FACTORY_STATE OF			
		START:
			(*Bottle conveyer*)
			doStartB := TRUE;
			doMotorB := TRUE;
			//do1StationB := TRUE;

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
	
			doPushC := FALSE;
			firstCrate := TRUE;
	
			FACTORY_STATE := AWAIT_ORDER;
			
		AWAIT_ORDER:
			
		STOP:
			(*Bottle conveyer*)
			doStartB := FALSE;
			doMotorB := FALSE;
			//do1StationB := FALSE;

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
		
		RESET:
			STATION_1_STATE := NEXT_CRATE;
			STATION_2_STATE := NO_PALLET;
			palletFlag := FALSE;
			pushTimerInput := FALSE;
			firstCrate := TRUE;
			doPushC := FALSE;
			doRBeer := FALSE;
			doRPacking := FALSE;
			diSensorCrateReady := FALSE;
			diSensorPalletInPos := FALSE;
		
			FACTORY_STATE := STOP;
		
	END_CASE;

	
	(*Non-case dependent IF-statements*)
	
	(*Stop crate delivery*)
	IF diSensorPackagingReady THEN
		doStation2C := FALSE;
	ELSE
		doStation2C := TRUE;
	END_IF;

	(*Stop bottle feeder if line is full*)
	IF diSensorBottle THEN
		doStartB := FALSE;
	ELSE
		doStartB := TRUE;
	END_IF;
	
	
	(* Timer for Case STATION_1_STATE *)
	pushTimer(IN:=pushTimerInput, PT:=T#1s500ms);
	
	CASE STATION_1_STATE OF
		NEXT_CRATE:
			// Either we have the first package or we are waiting for the crate to move on.
			IF (firstCrate AND diSensorCrateReady AND NOT doAfterBeerFilling) THEN
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
			IF (diSensorFullCrate AND diSensorCrateReady) THEN
				doBeforePusherC := TRUE;
				doStation1C := TRUE;
				doStartC := TRUE;
				doSlowDownC := TRUE;
				doAfterBeerFilling := FALSE;
				pushTimerInput := TRUE;
				STATION_1_STATE := PUSH;
			END_IF;//
			
		PUSH:
			doPushC := FALSE;
			IF pushTimer.Q THEN
				pushTimerInput := FALSE;
				doSlowDownC := FALSE;
				doPushC := TRUE;
				doRBeer := TRUE;
				STATION_1_STATE := ROBOTACTION_STATION_1;
			END_IF;
		ROBOTACTION_STATION_1:
			IF diSensorCrateReady THEN
				doBeforePusherC := FALSE;
				doStation1C := FALSE;
				doStartC := FALSE;
			END_IF;
			IF diBeerComplete THEN
				doAfterBeerFilling := TRUE;
				STATION_1_STATE := STATION_1_PAUSE;
			END_IF;
		STATION_1_PAUSE:
			doRBeer := FALSE;
			IF diSensorCrateReady THEN
				firstCrate := TRUE;
				STATION_1_STATE := NEXT_CRATE;
			END_IF;
			IF diSensorFullCrate THEN
				doAfterBeerFilling := FALSE;
			END_IF;	
			IF NOT diSensorCrateReady AND NOT doBeforePusherC THEN
				doBeforePusherC := TRUE;
				doStation1C := TRUE;
			ELSIF diSensorCrateReady THEN
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
				
	pushTimer();
	
	END_PROGRAM


PROGRAM _EXIT
	 
END_PROGRAM

