
PROGRAM _INIT
	(*Bottle conveyer*)
	MOTOR_BeerBottle := TRUE;
	MOTOR_BeerBottleStart := TRUE;
	MOTOR_BeerBottle_Station_1 := TRUE;

	(*Crate conveyer*)
	MOTOR_BeerCrateStart := TRUE;
	MOTOR_BeerCrate := TRUE;
	MOTOR_BeerCrateSlowDown := TRUE;
	MOTOR_BeerCrate_Station_1 := TRUE;

	(*Packaging conveyer*)
	MOTOR_PackagingStart := TRUE;
	MOTOR_Packaging := TRUE;
	MOTOR_BeerCrate_Station_2 := TRUE;
	MOTOR_Station_1_Belt := TRUE;

	(*Utils*)
	BeerCrateCounter := 1;
	// If less than 40 new beer
	Feeder_Crate := TRUE;
	Feeder_Beer := TRUE;
	Feeder_Packaging:= TRUE;
	
	PushCrate := FALSE;
	Feeder_Crate := TRUE;
	Feeder_Beer := TRUE;
	Feeder_Packaging := TRUE;
	
END_PROGRAM


PROGRAM _CYCLIC
	CASE FACTORY_STATE OF
		START:
			MOTOR_BeerBottle := TRUE;
			MOTOR_BeerBottleStart := TRUE;
			MOTOR_BeerBottle_Station_1 := TRUE;

			(*Crate conveyer*)
			MOTOR_BeerCrateStart := TRUE;
			MOTOR_BeerCrate := TRUE;
			MOTOR_BeerCrateSlowDown := TRUE;
			MOTOR_BeerCrate_Station_1 := TRUE;

			(*Packaging conveyer*)
			MOTOR_PackagingStart := TRUE;
			MOTOR_Packaging := TRUE;
			MOTOR_BeerCrate_Station_2 := TRUE;
			MOTOR_Station_1_Belt := TRUE;
			
			(*IF BeerCrateCounter < 30 THEN*)
			Feeder_Crate := TRUE;
			Feeder_Beer := TRUE;
		    Feeder_Packaging := TRUE;
				(*BeerCrateCounter := BeerCrateCounter + 1;
			END_IF;*)
		
		PAUSE:
			
		STOP:
			DeleteAll := FALSE;
			MOTOR_BeerBottle := FALSE;
			MOTOR_BeerBottleStart := FALSE;
			MOTOR_BeerBottle_Station_1 := FALSE;

			(*Crate conveyer*)
			MOTOR_BeerCrateStart := FALSE;
			MOTOR_BeerCrate := FALSE;
			MOTOR_BeerCrateSlowDown := FALSE;
			MOTOR_BeerCrate_Station_1 := FALSE;
			MOTOR_Station_1_Belt := FALSE;

			(*Packaging conveyer*)
			MOTOR_PackagingStart := FALSE;
			MOTOR_Packaging := FALSE;
			MOTOR_BeerCrate_Station_2 := FALSE;
		
			Feeder_Crate := FALSE;
			Feeder_Beer := FALSE;
			Feeder_Packaging:= FALSE;
		
		RESET:
			DeleteAll := TRUE;
			FACTORY_STATE := STOP;
	END_CASE;
	
	CASE STATION_1_STATE OF
		PUSH:
		ROBOTACTION_STATION_1:
		NEXT_CRATE:
		STATION_1_PAUSE:
		

	END_CASE;
	
	CASE STATION_2_STATE OF
		PALLET_IN_POS:
			Pallet_timer.IN := TRUE;
			Pallet_timer.PT := T#5s ;
			
			IF SENSOR_Packaging THEN
				MOTOR_PackagingStart := FALSE;
				//STATION_2_STATE := ROBOTACTION_STATION_2;
				STATION_2_STATE := NEXT_CRATE_SCANNER;
				//CREATE COUNTER TO DETERMINE NUMBER OF CRATES ON PALLET
			END_IF;
			
			IF (Pallet_timer.Q AND NOT SENSOR_Packaging) THEN
				Pallet_timer.IN := FALSE;
				STATION_2_STATE := NO_PALLET;
			END_IF;
			
			
		ROBOTACTION_STATION_2:
			IF SENSOR_Packaging_Crates THEN
				MOTOR_BeerCrate_Station_2 := FALSE;
				(*DoAction*)
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
		
	END_CASE;
	
	Pallet_timer();
END_PROGRAM


PROGRAM _EXIT
	 
END_PROGRAM

