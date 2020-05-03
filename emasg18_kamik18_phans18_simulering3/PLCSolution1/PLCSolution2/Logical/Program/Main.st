
PROGRAM _INIT
	(*Bottle conveyer*)
	do_Motor_BeerBottle := TRUE;
	do_Motor_BeerBottleStart := TRUE;
	do_Motor_BeerBottle_Station_1 := TRUE;

	(*Crate conveyer*)
	do_Motor_BeerCrateStart := TRUE;
	do_Motor_BeerCrate := TRUE;
	//do_Motor_BeerCrate_Station_1 := TRUE;
	do_Motor_BeerCrate_BeforePusher := FALSE;
	//do_Motor_Station_1_Belt := FALSE;
	do_Motor_BeerCrateSlowDown := FALSE;

	(*Packaging conveyer*
	do_Motor_PackagingStart := TRUE;
	do_Motor_Packaging := TRUE;
	do_Motor_BeerCrate_Station_2 := TRUE;

	(*Utils*
	do_BeerCrateCounter := 1;
	// If less than 40 new beer
	do_Feeder_Crate := TRUE;
	do_Feeder_Beer := TRUE;
	do_Feeder_Packaging:= TRUE;
	
	do_PushCrate := FALSE;
	firstCrate := TRUE;
	di_Sensor_Crate_1 := TRUE;	*)
END_PROGRAM


PROGRAM _CYCLIC
(*	CASE FACTORY_STATE OF			
		START:
			IF di_Sensor_Crate_1 THEN
				FACTORY_STATE := PAUSE;
			ELSE
			(*Bottle conveyer*
			do_Motor_BeerBottle := TRUE;
			do_Motor_BeerBottleStart := TRUE;
			do_Motor_BeerBottle_Station_1 := TRUE;
			do_Motor_BeerBottle_Station_2 := TRUE;

			(*Crate conveyer*
			do_Motor_BeerCrateStart := TRUE;
			do_Motor_BeerCrate := TRUE;
			do_Motor_BeerCrate_Station_1 := TRUE;
			do_Motor_BeerCrate_BeforePusher := TRUE;
			do_Motor_BeerCrateSlowDown := FALSE;

			(*Packaging conveyer*
			do_Motor_PackagingStart := TRUE;
			do_Motor_Packaging := TRUE;
			do_Motor_BeerCrate_Station_2 := TRUE;

			(*Utils*
			do_BeerCrateCounter := 1;
			// If less than 40 new beer
			do_Feeder_Crate := TRUE;
			do_Feeder_Beer := TRUE;
			do_Feeder_Packaging:= TRUE;
	
			do_PushCrate := FALSE;
				
			END_IF;
		
(*			IF di_Sensor_Bottle THEN
				do_Motor_BeerBottle_Station_1 := FALSE;
			ELSE 
				do_Motor_BeerBottle_Station_1 := TRUE;
			END_IF;*
			
		PAUSE:
			
		STOP:
			(*Bottle conveyer*
			do_Motor_BeerBottle := FALSE;
			do_Motor_BeerBottleStart := FALSE;
			do_Motor_BeerBottle_Station_1 := FALSE;

			(*Crate conveyer*
			do_Motor_BeerCrateStart := FALSE;
			do_Motor_BeerCrate := FALSE;
			do_Motor_BeerCrate_Station_1 := FALSE;
			do_Motor_BeerCrateSlowDown := FALSE;
			do_Motor_BeerCrate_BeforePusher := FALSE;

			(*Packaging conveyer*
			do_Motor_PackagingStart := FALSE;
			do_Motor_Packaging := FALSE;
			do_Motor_BeerCrate_Station_2 := FALSE;
			do_Motor_Station_1_Belt := FALSE;

			(*Utils*
			do_BeerCrateCounter := 1;
			// If less than 40 new beer
			do_Feeder_Crate := FALSE;
			do_Feeder_Beer := FALSE;
			do_Feeder_Packaging:= FALSE;
			do_PushCrate := FALSE;
		
		RESET:
			do_DeleteAll := TRUE;
			FACTORY_STATE := STOP;
	END_CASE;
	
	CASE STATION_1_STATE OF
		NEXT_CRATE:
			IF di_Sensor_Crate THEN
	  			do_Motor_BeerCrateSlowDown := FALSE;
			END_IF;
			IF (firstCrate AND di_Sensor_Crate) THEN
				do_Motor_BeerCrateSlowDown := TRUE;
				firstCrate := FALSE;
				STATION_1_STATE := PUSH; 
				//do_Motor_BeerBottle_Station_1 := TRUE;	
			END_IF;
			IF di_Sensor_Station_1 THEN
				do_Motor_BeerCrate_BeforePusher := TRUE;
				do_Motor_BeerCrateSlowDown := TRUE;
				do_Motor_Station_1_Belt := FALSE;
				STATION_1_STATE := PUSH;
			END_IF;
		PUSH:
			push_timer(IN:=TRUE, PT:=T#800ms);
			IF push_timer.Q THEN
				push_timer.IN := FALSE;
				do_Motor_BeerCrateSlowDown := FALSE;
				do_PushCrate := TRUE;
				STATION_1_STATE := ROBOTACTION_STATION_1;
			END_IF;
		ROBOTACTION_STATION_1:
			IF di_Sensor_Crate  THEN
				do_Motor_BeerCrate_BeforePusher := FALSE;
			END_IF;
			push_complete_timer(IN:= TRUE, PT := T#1s200ms);
			IF push_complete_timer.Q THEN
				push_complete_timer.IN := FALSE;
				do_PushCrate := FALSE;
				do_Motor_Station_1_Belt := TRUE;
			END_IF;
			// Do action
			STATION_1_STATE := STATION_1_PAUSE;
		STATION_1_PAUSE:
		//			STATION_1_STATE := NEXT_CRATE;

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
	(*pallet_timer();
	push_timer();
	push_complete_timer();
	*)
	END_PROGRAM


PROGRAM _EXIT
	 
END_PROGRAM

